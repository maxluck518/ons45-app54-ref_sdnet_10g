module add_tuser
#(
    parameter PORT_NUM = 1,
    parameter C_M_AXIS_DATA_WIDTH  = 64,
    parameter C_S_AXIS_DATA_WIDTH  = 64,
    parameter C_M_AXIS_TUSER_WIDTH = 128,
    parameter C_S_AXIS_TUSER_WIDTH = 128
    )
(
    input                                              clk,
    input                                              reset,

    input      [C_S_AXIS_DATA_WIDTH-1:0]               s_axis_tdata,
    input      [((C_S_AXIS_DATA_WIDTH/8))-1:0]         s_axis_tstrb,
    input      [C_S_AXIS_TUSER_WIDTH-1:0]              s_axis_tuser,
    input                                              s_axis_tvalid,
    output reg                                         s_axis_tready,
    input                                              s_axis_tlast,

    output reg    [C_M_AXIS_DATA_WIDTH-1:0]            m_axis_tdata,
    output reg    [((C_M_AXIS_DATA_WIDTH/8))-1:0]      m_axis_tstrb,
    output reg                                         m_axis_tvalid,
    input                                              m_axis_tready,
    output                                             m_axis_tlast
);

localparam                         T_USER = 0;
localparam                         T_DATA1 = 1;
localparam                         T_DATA2 = 2;
localparam                         IDLE  = 3;

// -- Signals
reg  [2:0]                                             state;
reg  [2:0]                                             next_state;
reg  [C_M_AXIS_DATA_WIDTH-1:0]        		           temp_user;
(*MARK_DEBUG="true"*)wire  [2:0]                       state_test;
assign state_test = state;
reg                                                    in_fifo_rd_en;
wire                                                   in_fifo_wr_en;
wire                                                   in_fifo_nearly_full;
wire                                                   in_fifo_empty;
wire  [C_M_AXIS_DATA_WIDTH-1:0]                        out_fifo_tdata;
wire  [C_M_AXIS_TUSER_WIDTH-1:0]                       out_fifo_tuser;
wire  [C_M_AXIS_DATA_WIDTH/8-1:0]                      out_fifo_tstrb;
wire                                                   out_fifo_tlast;


always @(posedge clk) begin
    if(reset)
        temp_user <= 0;
    else if(m_axis_tlast) begin
        temp_user <= 0;
        if(PORT_NUM == 0) temp_user[23:16] <= 8'h1;
        if(PORT_NUM == 1) temp_user[23:16] <= 8'h2;
        if(PORT_NUM == 2) temp_user[23:16] <= 8'h3;
        if(PORT_NUM == 3) temp_user[23:16] <= 8'h4;
    end
end

assign in_fifo_wr_en = s_axis_tready && s_axis_tvalid;
always @(posedge clk) begin
        s_axis_tready <= ~in_fifo_nearly_full;
    end

// -- Modules and Logic

fallthrough_small_fifo_v2
#(.WIDTH(1+C_S_AXIS_TUSER_WIDTH+(C_S_AXIS_DATA_WIDTH/8)+C_S_AXIS_DATA_WIDTH), 
  .MAX_DEPTH_BITS(10))
input_fifo
( .din         ({s_axis_tlast, s_axis_tuser, s_axis_tstrb, s_axis_tdata}),
    .wr_en       (in_fifo_wr_en), 
    .rd_en       (in_fifo_rd_en),
    .dout        ({out_fifo_tlast, out_fifo_tuser, out_fifo_tstrb, out_fifo_tdata}),
    .full        (),
    .prog_full   (),
    .nearly_full (in_fifo_nearly_full),
    .empty       (in_fifo_empty),
    .reset       (reset),
    .clk         (clk)
);
assign m_axis_tlast = out_fifo_tlast;

always @(*)   begin 
    m_axis_tdata  = 0; 
    m_axis_tstrb  = 0; 
    in_fifo_rd_en = 0;
    m_axis_tvalid = 0;
    next_state = state;
    case(state)
        T_USER:     begin
            if(!in_fifo_empty && m_axis_tready) begin
                m_axis_tdata = temp_user;
                m_axis_tstrb = 8'hff;          
                m_axis_tvalid = 1'b1;
                next_state = T_DATA2;
            end
        end
        T_DATA1:     begin
            m_axis_tdata = out_fifo_tdata;//temp_tdata;
            m_axis_tstrb = out_fifo_tstrb;//temp_tstrb;
            m_axis_tvalid = 1'b1;
            if(m_axis_tready) begin
                in_fifo_rd_en = 1'b1;
                next_state = T_DATA2;
            end
        end
        T_DATA2:    begin
	    if(m_axis_tready) begin            
		m_axis_tdata = out_fifo_tdata;
		m_axis_tstrb = out_fifo_tstrb;
		m_axis_tvalid = !in_fifo_empty;
		if(m_axis_tlast && m_axis_tready) begin
		    next_state = T_USER;
		    in_fifo_rd_en = 1'b1;
		end
		else if(m_axis_tready && !in_fifo_empty) begin
			in_fifo_rd_en = 1'b1;
		end
	    end
	end // end of T_DATA2
    endcase
end// end always 

always @(posedge clk) begin
    if(reset) state <= T_USER;
    else begin
        state <= next_state;
    end
end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2014/11/09 09:44:38
// Design Name: 
// Module Name: tb_pipeline
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_pipeline(
    );
    
    wire  													s_axis_rxd_0_tready;
    reg [63 : 0] 											s_axis_rxd_0_tdata;
    reg [7 : 0] 											s_axis_rxd_0_tstrb;
    reg  													s_axis_rxd_0_tlast;
    reg  													s_axis_rxd_0_tvalid;
	
	wire [63 : 0] 											m_axis_txd_0_tdata;
    wire [7 : 0] 											m_axis_txd_0_tstrb;
    wire  													m_axis_txd_0_tlast;
    wire  													m_axis_txd_0_tvalid;
	
	
	reg s_axis_rxd_aclk;
	reg s_axis_rxd_aresetn;
	reg qdr_clk;
	
	reg [3:0]  test;
	reg  tag;
	wire           user_app_wr_cmd0;
    wire[18:0]     user_app_wr_addr0;
    wire           user_app_rd_cmd0;
    wire[18:0]     user_app_rd_addr0;
    wire[143:0]    user_app_wr_data0;
    reg            user_app_rd_valid0;
    reg [143:0]	   user_app_rd_data0;
	reg			   start_replay;
	
	
	always @(posedge qdr_clk) begin
		user_app_rd_valid0 <= user_app_wr_cmd0;
		user_app_rd_data0 <= user_app_wr_data0;
	end
	
 packet_pipeline_input pipeline_inst(
    .s_axis_rxd_aclk			(s_axis_rxd_aclk),
	.s_axis_rxd_aresetn			(s_axis_rxd_aresetn),
	
	.s_axis_rxd_0_tvalid		(s_axis_rxd_0_tvalid),
	.s_axis_rxd_0_tdata			(s_axis_rxd_0_tdata),
	.s_axis_rxd_0_tkeep 		(s_axis_rxd_0_tstrb),
	.s_axis_rxd_0_tlast			(s_axis_rxd_0_tlast),
	.s_axis_rxd_0_tready		(s_axis_rxd_0_tready),

	.s_axis_rxd_1_tvalid		(s_axis_rxd_0_tvalid),
	.s_axis_rxd_1_tdata			(s_axis_rxd_0_tdata+1),
	.s_axis_rxd_1_tkeep 		(s_axis_rxd_0_tstrb),
	.s_axis_rxd_1_tlast			(s_axis_rxd_0_tlast),
	.s_axis_rxd_1_tready		(s_axis_rxd_0_tready),

	.s_axis_rxd_2_tvalid		(s_axis_rxd_0_tvalid),
	.s_axis_rxd_2_tdata			(s_axis_rxd_0_tdata+2),
	.s_axis_rxd_2_tkeep 		(s_axis_rxd_0_tstrb),
	.s_axis_rxd_2_tlast			(s_axis_rxd_0_tlast),
	.s_axis_rxd_2_tready		(s_axis_rxd_0_tready),

	.s_axis_rxd_3_tvalid		(s_axis_rxd_0_tvalid),
	.s_axis_rxd_3_tdata			(s_axis_rxd_0_tdata+3),
	.s_axis_rxd_3_tkeep 		(s_axis_rxd_0_tstrb),
	.s_axis_rxd_3_tlast			(s_axis_rxd_0_tlast),
	.s_axis_rxd_3_tready		(s_axis_rxd_0_tready),
	
		.m_axis_txd_0_tvalid		(m_axis_txd_0_tvalid),
    	.m_axis_txd_0_tdata			(m_axis_txd_0_tdata),
    	.m_axis_txd_0_tkeep 		(m_axis_txd_0_tstrb),
    	.m_axis_txd_0_tlast			(m_axis_txd_0_tlast),
    	.m_axis_txd_0_tready		(1'b1)
 );
 
  integer i;
  initial begin
	  tag = 1;
      s_axis_rxd_aclk   = 1'b0;
	  qdr_clk = 1'b0;
	  start_replay = 1'b0;
	  test  = 0;
      $display("[%t] : System Reset Asserted...", $realtime);
      s_axis_rxd_aresetn = 1'b0;
      for (i = 0; i < 50; i = i + 1) begin
                 @(posedge s_axis_rxd_aclk);
      end
      $display("[%t] : System Reset De-asserted...", $realtime);
      s_axis_rxd_aresetn = 1'b1;
  end

  always #2.5  s_axis_rxd_aclk = ~s_axis_rxd_aclk;
  always #2.5  qdr_clk = ~qdr_clk;
 

	wire [31:0] header_word_0 = 32'hfffffff0; // Destination MAC
    wire [31:0] header_word_1 = 32'h89abcdef; // Source MAC + EtherType

    localparam WAIT_TIME = 0;
    localparam HEADER_0 = 1;
    localparam HEADER_1 = 2;
    localparam PAYLOAD  = 3;
    localparam DEAD     = 4;

    reg [2:0] state, state_next;
    reg [7:0] counter, counter_next;
	
	reg [9:0] start,start_next;

	always @(*) begin
	if(m_axis_txd_0_tvalid)
        state_next = state;
        s_axis_rxd_0_tdata = 64'b0;
        s_axis_rxd_0_tstrb = 8'hFF;
        s_axis_rxd_0_tlast = 1'b0;
        s_axis_rxd_0_tvalid = 1'b0;
        counter_next = counter;
		//start_replay = 0;
	if (tag) begin
        case(state)
			WAIT_TIME: begin
			
				state_next = HEADER_0;
            end

            HEADER_0: begin
				s_axis_rxd_0_tvalid = 1'b1;
                s_axis_rxd_0_tdata = header_word_0;
                s_axis_rxd_0_tstrb = 8'hFF;
                if( s_axis_rxd_0_tready ) begin
                    state_next = HEADER_1;
                end
            end
            HEADER_1: begin
				s_axis_rxd_0_tvalid = 1'b1;
                s_axis_rxd_0_tdata = header_word_1;
                s_axis_rxd_0_tstrb = 8'hFF;
                if( s_axis_rxd_0_tready ) begin
                    state_next = PAYLOAD;
                end
            end
            PAYLOAD: begin
				s_axis_rxd_0_tvalid = 1'b1;
                s_axis_rxd_0_tdata = {32'h16a};
                s_axis_rxd_0_tstrb = 8'hFF;
                if(s_axis_rxd_0_tready ) begin
                    counter_next = counter + 1'b1;
                    if(counter == 8'hf) begin
                        s_axis_rxd_0_tstrb = 8'hFF;
                        state_next = DEAD;
                        counter_next = 8'b0;
                        s_axis_rxd_0_tlast = 1'b1;
						test = test + 1;
					if(test == 5) begin
						tag = 1;
						end
                    end
                end
            end

            DEAD: begin
                counter_next = counter + 1'b1;
                s_axis_rxd_0_tlast = 1'b0;
                if(counter[0]==1'b1) begin
                    counter_next = 8'b0;
                    state_next = WAIT_TIME;
                end
            end
        endcase
	  end
    end

    always @(posedge s_axis_rxd_aclk) begin
        if(~s_axis_rxd_aresetn) begin
            state <= WAIT_TIME;
            counter <= 8'b0;
			start <= 10'h0;
        end
        else begin
			state <= state_next;
            counter <= counter_next;
			start <= start +1;
        end
    end
   
endmodule


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
    
    wire                                                    s_axis_rxd_0_tready;
    reg [255 : 0]                                            s_axis_rxd_0_tdata;
    reg [31 : 0]                                             s_axis_rxd_0_tkeep;
    reg                                                     s_axis_rxd_0_tlast;
    reg                                                     s_axis_rxd_0_tvalid;
    reg [255:0]                                              s_axis_rxd_0_tuser;
    reg [15:0]                                              s_axis_rxd_0_tuser_d;
    reg                                                     m_axis_tready[7:0];
    
    
    reg s_axis_rxd_aclk;
    reg s_axis_rxd_aresetn;
    reg qdr_clk;
    
    reg [3:0]  test;
    reg [3:0]  tuple;
    reg [127:0]  tuple_test;
    reg  drop_flag;
    reg  tag;
    wire           user_app_wr_cmd0;
    wire[18:0]     user_app_wr_addr0;
    wire           user_app_rd_cmd0;
    wire[18:0]     user_app_rd_addr0;
    wire[143:0]    user_app_wr_data0;
    reg            user_app_rd_valid0;
    reg [143:0]    user_app_rd_data0;
    reg            start_replay;
    reg            taggggg;
    reg            tuple_out_flowstream_valid;
    
    
    always @(posedge qdr_clk) begin
        user_app_rd_valid0 <= user_app_wr_cmd0;
        user_app_rd_data0 <= user_app_wr_data0;
    end
    
 packet_pipeline_output packet_gen_inst(
    .s_axis_rxd_aclk                 (s_axis_rxd_aclk),
    .s_axis_rxd_aresetn               (s_axis_rxd_aresetn),

    .s_axis_rxd_0_tdata              (s_axis_rxd_0_tdata), 
    .s_axis_rxd_0_tkeep              (s_axis_rxd_0_tkeep), 
    .s_axis_rxd_0_tlast              (s_axis_rxd_0_tlast), 
    .s_axis_rxd_0_tvalid             (s_axis_rxd_0_tvalid), 
    .s_axis_rxd_0_tready             (s_axis_rxd_0_tready), 

    .m_axis_txd_0_tready             (1'b1),          
    .m_axis_txd_1_tready             (1'b1),      
    .m_axis_txd_2_tready             (1'b1),      
    .m_axis_txd_3_tready             (1'b1),        
    .m_axis_s2mm_0_tready            (1'b1),            
    .m_axis_s2mm_1_tready            (1'b1),            
    .m_axis_s2mm_2_tready            (1'b1),            
    .m_axis_s2mm_3_tready            (1'b1),            

    // .m_axis_txd_0_tready             (m_axis_tready[0]),          
    // .m_axis_txd_1_tready             (m_axis_tready[1]),      
    // .m_axis_txd_2_tready             (m_axis_tready[2]),      
    // .m_axis_txd_3_tready             (m_axis_tready[3]),        
    // .m_axis_s2mm_0_tready            (m_axis_tready[4]),            
    // .m_axis_s2mm_1_tready            (m_axis_tready[5]),            
    // .m_axis_s2mm_2_tready            (m_axis_tready[6]),            
    // .m_axis_s2mm_3_tready            (m_axis_tready[7]),            

    .tuple_in_flowstream_valid  (tuple_out_flowstream_valid),

    .tuple_in_flowstream_data   (tuple_test)
    // .tuple_out_flowstream_data   (tuple%4+4)
    // .tuple_out_flowstream_data   (test%4+4)

       // .tuple_out_flowstream_data   (11'h000 + test%4+(test<10))
     // .tuple_out_flowstream_data   (11'h000)

 );
 
  integer i;
  initial begin
      tag = 1;
      taggggg = 1;
      s_axis_rxd_aclk   = 1'b0;
      qdr_clk = 1'b0;
      start_replay = 1'b0;
      test  = 0;
      tuple_test  = 11'h004;
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


  always @(posedge s_axis_rxd_aclk) begin
      m_axis_tready[0] <= $random;
      m_axis_tready[1] <= $random;
      m_axis_tready[2] <= $random;
      m_axis_tready[3] <= $random;
      m_axis_tready[4] <= $random;
      m_axis_tready[5] <= $random;
      m_axis_tready[6] <= $random;
      m_axis_tready[7] <= $random;
      drop_flag <=$random;
      tuple[0] <= $random;
      tuple[1] <= $random;
      tuple[2] <= $random;
      tuple[3] <= $random;
  end

reg [7:0]                           dst_port;
reg [7:0]                           src_port;
reg [15:0]                          pkt_len;

wire [31:0] header_word_0 = 32'h33e1e1e1;
// wire [31:0] header_word_1 = 32'h11e1e1e1;
wire [31:0] header_word_1[3:0];
wire [31:0] header_word_2[3:0];

assign header_word_1[0] = 32'h0101eeee;
assign header_word_1[1] = 32'h0202eeee;
assign header_word_1[2] = 32'h0303eeee;
assign header_word_1[3] = 32'h0404eeee;

assign header_word_2[0] = 32'h00000000;
assign header_word_2[1] = 32'h11111111;
assign header_word_2[2] = 32'h22222222;
assign header_word_2[3] = 32'h33333333;

wire [31:0] header_word_3 = 32'h08004500;
wire [31:0] header_word_4 = 32'h00320001;
wire [31:0] header_word_5 = 32'h00004006;
wire [31:0] header_word_6 = 32'he771c0a8;
wire [31:0] header_word_7 = 32'h0901c0a8;
wire [31:0] header_word_8 = 32'h09020035;
wire [31:0] header_word_9 = 32'h00350000;
wire [31:0] header_word_a = 32'h00000000;
wire [31:0] header_word_b = 32'h00005002;
wire [31:0] header_word_c = 32'h2710f50a;
wire [31:0] header_word_d = 32'h00000000;
wire [31:0] header_word_e = 32'h00000000;
wire [31:0] header_word_f = 32'h00000000;

    localparam WAIT_TIME = 0;
    localparam HEADER_0 = 1;
    localparam HEADER_1 = 2;
    localparam PAYLOAD  = 3;
    localparam DEAD     = 4;

    reg [2:0] state, state_next;
    reg [7:0] counter, counter_next;
    
    reg [9:0] start,start_next;

    always @(*) begin
    //if(m_axis_txd_0_tvalid)
        state_next = state;
        s_axis_rxd_0_tdata = 256'b0;
        s_axis_rxd_0_tkeep = 32'hFF;
        s_axis_rxd_0_tlast = 1'b0;
        s_axis_rxd_0_tvalid = 1'b0;
        
        counter_next = counter;
        if (~s_axis_rxd_aresetn) begin
            tuple_out_flowstream_valid = 0;
            s_axis_rxd_0_tuser = 31'h44;
        end
    
        //start_replay = 0;
    if (tag) begin
        case(state)
            WAIT_TIME: begin
                if(start > 10'h08);// start_replay = 1;
                if(start>10'h010)
                state_next = HEADER_0;
            end

            HEADER_0: begin
                // dst_port = tuple%4+1;
                dst_port = 0;
                src_port = tuple%4+1;
                pkt_len = 0;
                tuple_test  = {96'h0,dst_port,src_port,pkt_len};
                tuple_out_flowstream_valid = 1;
                s_axis_rxd_0_tvalid = 1'b0;
                s_axis_rxd_0_tuser[31:0] = {test%4,9'b000000000,3'b000,12'h000,test%4};
                s_axis_rxd_0_tdata[31:0] = header_word_1[tuple%4];
                test = tuple;
                s_axis_rxd_0_tkeep = 32'h000000FF;
                if( s_axis_rxd_0_tready ) begin
                    s_axis_rxd_0_tvalid = 1'b1;
                    state_next = HEADER_1;
                end
            end
            HEADER_1: begin
                tuple_out_flowstream_valid = 0;
                s_axis_rxd_0_tvalid = 1'b0;
                s_axis_rxd_0_tdata[31:0] = header_word_2[test%4];
                s_axis_rxd_0_tkeep = 32'h000000FF;
                if( s_axis_rxd_0_tready ) begin
                    s_axis_rxd_0_tvalid = 1'b1;
                    state_next = PAYLOAD;
                end
            end
            PAYLOAD: begin
                s_axis_rxd_0_tvalid = 1'b0;
                s_axis_rxd_0_tdata = {32'h16a} + counter;
                s_axis_rxd_0_tkeep = 8'hFF;
                if(s_axis_rxd_0_tready ) begin
                    s_axis_rxd_0_tvalid = 1'b1;
                    counter_next = counter + 1'b1;
                    if(counter == 8'he) begin
                        s_axis_rxd_0_tkeep = 8'hFF;
                        state_next = HEADER_0;
                        counter_next = 8'b0;
                        s_axis_rxd_0_tlast = 1'b1;
                        
                    if(test == 10) begin
                        tag = 1;
                        end
                    end
                end
            end

            DEAD: begin
                counter_next = counter + 1'b1;
                s_axis_rxd_0_tlast = 1'b0;
                if(counter[7]==1'b0) begin
                    counter_next = 8'b0;
                    state_next = HEADER_0;
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
            s_axis_rxd_0_tuser_d = 0;
        end
        else begin

            state <= state_next;
            counter <= counter_next;
            start <= start +1;
        end
    end
   
endmodule

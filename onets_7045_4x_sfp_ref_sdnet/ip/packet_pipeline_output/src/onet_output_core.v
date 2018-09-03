
`timescale 1 ps / 1 ps

module onet_output_core
#(
  parameter AXIS_USER_WIDTH = 128,
  parameter C_S_AXIS_TDATA_WIDTH	= 256,
  parameter C_M_AXIS_TDATA_WIDTH	= 64,
  parameter ACTION_TUPLE_WIDTH = 128,
  parameter QUEUES_NUM = 8
)
(

	input 							axis_resetn,
	input 							axis_clk,

	input                                              s_axis_tvalid,
	output                                             s_axis_tready,
	input [C_S_AXIS_TDATA_WIDTH-1:0]                   s_axis_tdata,
	input [C_S_AXIS_TDATA_WIDTH/8-1:0]                 s_axis_tstrb,
	input                                              s_axis_tlast,

    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_0,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_0,
    output                                             m_axis_tvalid_0,
    output                                             m_axis_tlast_0,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_0,
    input                                              m_axis_tready_0,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_1,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_1,
    output                                             m_axis_tvalid_1,
    output                                             m_axis_tlast_1,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_1,
    input                                              m_axis_tready_1,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_2,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_2,
    output                                             m_axis_tvalid_2,
    output                                             m_axis_tlast_2,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_2,
    input                                              m_axis_tready_2,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_3,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_3,
    output                                             m_axis_tvalid_3,
    output                                             m_axis_tlast_3,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_3,
    input                                              m_axis_tready_3,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_4,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_4,
    output                                             m_axis_tvalid_4,
    output                                             m_axis_tlast_4,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_4,
    input                                              m_axis_tready_4,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_5,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_5,
    output                                             m_axis_tvalid_5,
    output                                             m_axis_tlast_5,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_5,
    input                                              m_axis_tready_5,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_6,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_6,
    output                                             m_axis_tvalid_6,
    output                                             m_axis_tlast_6,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_6,
    input                                              m_axis_tready_6,
    output [C_M_AXIS_TDATA_WIDTH-1:0]                  m_axis_tdata_7,
    output [AXIS_USER_WIDTH-1:0]                       m_axis_tuser_7,
    output                                             m_axis_tvalid_7,
    output                                             m_axis_tlast_7,
    output [C_M_AXIS_TDATA_WIDTH/8-1:0]                m_axis_tstrb_7,
    input                                              m_axis_tready_7,

    input   [ACTION_TUPLE_WIDTH-1:0]                   tuple_flowstream_data,
    input                                              tuple_flowstream_valid
);

    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_0;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_0;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_0;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_0;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_0;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_0;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_1;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_1;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_1;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_1;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_1;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_1;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_2;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_2;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_2;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_2;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_2;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_2;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_3;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_3;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_3;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_3;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_3;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_3;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_4;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_4;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_4;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_4;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_4;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_4;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_5;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_5;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_5;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_5;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_5;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_5;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_6;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_6;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_6;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_6;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_6;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_6;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH-1:0]                    m_axis_outqueue_tdata_7;
    (*MARK_DEBUG="true"*)wire [AXIS_USER_WIDTH-1:0]                          m_axis_outqueue_tuser_7;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tvalid_7;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tlast_7;
    (*MARK_DEBUG="true"*)wire  [C_S_AXIS_TDATA_WIDTH/8-1:0]                  m_axis_outqueue_tstrb_7;
    (*MARK_DEBUG="true"*)wire                                                m_axis_outqueue_tready_7;

output_schedule
#(.AXIS_DATA_WIDTH    (C_S_AXIS_TDATA_WIDTH),
  .AXIS_USER_WIDTH    (AXIS_USER_WIDTH),
  .ACTION_TUPLE_WIDTH (ACTION_TUPLE_WIDTH),
  .QUEUES_NUM         (8)
)  output_schedule_inst
(
    .axis_resetn             (axis_resetn),
    .axis_clk                (axis_clk),

    .s_axis_tdata            (s_axis_tdata),
    .s_axis_tstrb            (s_axis_tstrb),
    .s_axis_tlast            (s_axis_tlast),
    .s_axis_tvalid           (s_axis_tvalid),
    .s_axis_tready           (s_axis_tready),

    .m_axis_tdata_0          (m_axis_outqueue_tdata_0),
    .m_axis_tstrb_0          (m_axis_outqueue_tstrb_0),
    .m_axis_tlast_0          (m_axis_outqueue_tlast_0),
    .m_axis_tvalid_0         (m_axis_outqueue_tvalid_0),
    .m_axis_tready_0         (m_axis_outqueue_tready_0),
    .m_axis_tdata_1          (m_axis_outqueue_tdata_1),
    .m_axis_tstrb_1          (m_axis_outqueue_tstrb_1),
    .m_axis_tlast_1          (m_axis_outqueue_tlast_1),
    .m_axis_tvalid_1         (m_axis_outqueue_tvalid_1),
    .m_axis_tready_1         (m_axis_outqueue_tready_1),
    .m_axis_tdata_2          (m_axis_outqueue_tdata_2),
    .m_axis_tstrb_2          (m_axis_outqueue_tstrb_2),
    .m_axis_tlast_2          (m_axis_outqueue_tlast_2),
    .m_axis_tvalid_2         (m_axis_outqueue_tvalid_2),
    .m_axis_tready_2         (m_axis_outqueue_tready_2),
    .m_axis_tdata_3          (m_axis_outqueue_tdata_3),
    .m_axis_tstrb_3          (m_axis_outqueue_tstrb_3),
    .m_axis_tlast_3          (m_axis_outqueue_tlast_3),
    .m_axis_tvalid_3         (m_axis_outqueue_tvalid_3),
    .m_axis_tready_3         (m_axis_outqueue_tready_3),
    .m_axis_tdata_4          (m_axis_outqueue_tdata_4),
    .m_axis_tstrb_4          (m_axis_outqueue_tstrb_4),
    .m_axis_tvalid_4         (m_axis_outqueue_tvalid_4),
    .m_axis_tlast_4          (m_axis_outqueue_tlast_4),
    .m_axis_tready_4         (m_axis_outqueue_tready_4),
    .m_axis_tdata_5          (m_axis_outqueue_tdata_5),
    .m_axis_tstrb_5          (m_axis_outqueue_tstrb_5),
    .m_axis_tlast_5          (m_axis_outqueue_tlast_5),
    .m_axis_tvalid_5         (m_axis_outqueue_tvalid_5),
    .m_axis_tready_5         (m_axis_outqueue_tready_5),
    .m_axis_tdata_6          (m_axis_outqueue_tdata_6),
    .m_axis_tstrb_6          (m_axis_outqueue_tstrb_6),
    .m_axis_tlast_6          (m_axis_outqueue_tlast_6),
    .m_axis_tvalid_6         (m_axis_outqueue_tvalid_6),
    .m_axis_tready_6         (m_axis_outqueue_tready_6),
    .m_axis_tdata_7          (m_axis_outqueue_tdata_7),
    .m_axis_tstrb_7          (m_axis_outqueue_tstrb_7),
    .m_axis_tlast_7          (m_axis_outqueue_tlast_7),
    .m_axis_tvalid_7         (m_axis_outqueue_tvalid_7),
    .m_axis_tready_7         (m_axis_outqueue_tready_7),

    .tuple_flowstream_data   (tuple_flowstream_data),
    .tuple_flowstream_valid  (tuple_flowstream_valid)
);
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) eth0_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_0),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_0),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_0),
     .s_axis_tready          (m_axis_outqueue_tready_0),
     .s_axis_tlast           (m_axis_outqueue_tlast_0),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_0),
    .m_axis_tstrb           (m_axis_tstrb_0),
    .m_axis_tvalid          (m_axis_tvalid_0),
    .m_axis_tready          (m_axis_tready_0),
    .m_axis_tlast           (m_axis_tlast_0)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) eth1_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_1),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_1),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_1),
     .s_axis_tready          (m_axis_outqueue_tready_1),
     .s_axis_tlast           (m_axis_outqueue_tlast_1),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_1),
    .m_axis_tstrb           (m_axis_tstrb_1),
    .m_axis_tvalid          (m_axis_tvalid_1),
    .m_axis_tready          (m_axis_tready_1),
    .m_axis_tlast           (m_axis_tlast_1)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) eth2_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_2),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_2),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_2),
     .s_axis_tready          (m_axis_outqueue_tready_2),
     .s_axis_tlast           (m_axis_outqueue_tlast_2),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_2),
    .m_axis_tstrb           (m_axis_tstrb_2),
    .m_axis_tvalid          (m_axis_tvalid_2),
    .m_axis_tready          (m_axis_tready_2),
    .m_axis_tlast           (m_axis_tlast_2)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) eth3_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_3),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_3),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_3),
     .s_axis_tready          (m_axis_outqueue_tready_3),
     .s_axis_tlast           (m_axis_outqueue_tlast_3),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_3),
    .m_axis_tstrb           (m_axis_tstrb_3),
    .m_axis_tvalid          (m_axis_tvalid_3),
    .m_axis_tready          (m_axis_tready_3),
    .m_axis_tlast           (m_axis_tlast_3)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) dma0_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_4),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_4),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_4),
     .s_axis_tready          (m_axis_outqueue_tready_4),
     .s_axis_tlast           (m_axis_outqueue_tlast_4),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_4),
    .m_axis_tstrb           (m_axis_tstrb_4),
    .m_axis_tvalid          (m_axis_tvalid_4),
    .m_axis_tready          (m_axis_tready_4),
    .m_axis_tlast           (m_axis_tlast_4)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) dma1_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_5),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_5),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_5),
     .s_axis_tready          (m_axis_outqueue_tready_5),
     .s_axis_tlast           (m_axis_outqueue_tlast_5),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_5),
    .m_axis_tstrb           (m_axis_tstrb_5),
    .m_axis_tvalid          (m_axis_tvalid_5),
    .m_axis_tready          (m_axis_tready_5),
    .m_axis_tlast           (m_axis_tlast_5)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) dma2_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_6),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_6),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_6),
     .s_axis_tready          (m_axis_outqueue_tready_6),
     .s_axis_tlast           (m_axis_outqueue_tlast_6),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_6),
    .m_axis_tstrb           (m_axis_tstrb_6),
    .m_axis_tvalid          (m_axis_tvalid_6),
    .m_axis_tready          (m_axis_tready_6),
    .m_axis_tlast           (m_axis_tlast_6)
    
   );
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(C_M_AXIS_TDATA_WIDTH),
      .C_S_AXIS_DATA_WIDTH(C_S_AXIS_TDATA_WIDTH),
      .C_M_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH),
      .C_S_AXIS_TUSER_WIDTH(AXIS_USER_WIDTH)
     ) dma3_inst
    (
    // Global Ports
    .axi_aclk(axis_clk),
    .axi_resetn(axis_resetn),
	
	// Slave Stream Ports
     .s_axis_tdata           (m_axis_outqueue_tdata_7),
     .s_axis_tstrb           (m_axis_outqueue_tstrb_7),
     .s_axis_tvalid          (m_axis_outqueue_tvalid_7),
     .s_axis_tready          (m_axis_outqueue_tready_7),
     .s_axis_tlast           (m_axis_outqueue_tlast_7),

    // Master Stream Ports
    .m_axis_tdata           (m_axis_tdata_7),
    .m_axis_tstrb           (m_axis_tstrb_7),
    .m_axis_tvalid          (m_axis_tvalid_7),
    .m_axis_tready          (m_axis_tready_7),
    .m_axis_tlast           (m_axis_tlast_7)
    
   );

endmodule

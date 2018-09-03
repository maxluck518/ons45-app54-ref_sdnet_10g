//-----------------------------------------------------------------//
//onet_core_logic.v
//
//-----------------------------------------------------------------//
module onet_core_logic#(
parameter integer C_S_AXIS_RXD_0_TDATA_WIDTH	= 64,
parameter integer C_M_AXIS_TXD_0_TDATA_WIDTH	= 64,
parameter integer UDP_AXIS_TDATA_WIDTH	= 256,
parameter integer UDP_AXIS_TUSER_WIDTH	= 128
)
(
      input                                         clk,                       //system clk
      input                                         reset,                     //system reset
      //ethernet port 0
      input                                         s_axis_eth_aclk_0,

/////////////////////////////////////add s_axis_eth_rx_tdata_0///////////////////////////////////
      output                                        s_axis_eth_rx_0_aresetn,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]        s_axis_eth_rx_0_tdata,
      input                                         s_axis_eth_rx_0_tvalid,
      input                                         s_axis_eth_rx_0_tlast,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]      s_axis_eth_rx_0_tstrb,
      output                                        s_axis_eth_rx_0_tready,
/////////////////////////////////////add s_axis_eth_rx_tdata_0///////////////////////////////////
	  
	  output                                        s_axis_eth_rx_1_aresetn,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]        s_axis_eth_rx_1_tdata,
      input                                         s_axis_eth_rx_1_tvalid,
      input                                         s_axis_eth_rx_1_tlast,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]      s_axis_eth_rx_1_tstrb,
      output                                        s_axis_eth_rx_1_tready,
	  
	  output                                        s_axis_eth_rx_2_aresetn,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]        s_axis_eth_rx_2_tdata,
      input                                         s_axis_eth_rx_2_tvalid,
      input                                         s_axis_eth_rx_2_tlast,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]      s_axis_eth_rx_2_tstrb,
      output                                        s_axis_eth_rx_2_tready,
	  
	  output                                        s_axis_eth_rx_3_aresetn,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]        s_axis_eth_rx_3_tdata,
      input                                         s_axis_eth_rx_3_tvalid,
      input                                         s_axis_eth_rx_3_tlast,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]      s_axis_eth_rx_3_tstrb,
      output                                        s_axis_eth_rx_3_tready,
      
      output                                        m_axis_eth_tx_aresetn,
      output [C_M_AXIS_TXD_0_TDATA_WIDTH-1:0]       m_axis_eth_tx_tdata,
      output                                        m_axis_eth_tx_tvalid,
      output                                        m_axis_eth_tx_tlast,
      output [C_M_AXIS_TXD_0_TDATA_WIDTH/8-1:0]     m_axis_eth_tx_tstrb,
      input                                         m_axis_eth_tx_tready
	  
    );
  
	wire [UDP_AXIS_TDATA_WIDTH-1:0] DEFAULT_TUSER;
   assign DEFAULT_TUSER = 128'b0;
  
////////////////////////////tc_converter----->udp_gen_out////////////////////////////////  
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_gen_out_tdata_0;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_gen_out_tstrb_0;
   wire                                             udp_gen_out_tvalid_0;
   wire                                             udp_gen_out_tlast_0;
   wire                                             udp_gen_out_tready_0;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_gen_out_tuser_0;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_gen_out_tdata_1;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_gen_out_tstrb_1;
   wire                                             udp_gen_out_tvalid_1;
   wire                                             udp_gen_out_tlast_1;
   wire                                             udp_gen_out_tready_1;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_gen_out_tuser_1;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_gen_out_tdata_2;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_gen_out_tstrb_2;
   wire                                             udp_gen_out_tvalid_2;
   wire                                             udp_gen_out_tlast_2;
   wire                                             udp_gen_out_tready_2;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_gen_out_tuser_2;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_gen_out_tdata_3;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_gen_out_tstrb_3;
   wire                                             udp_gen_out_tvalid_3;
   wire                                             udp_gen_out_tlast_3;
   wire                                             udp_gen_out_tready_3;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_gen_out_tuser_3;
////////////////////////////tc_converter----->udp_gen_out////////////////////////////////

////////////////////////////udp_mon_in udp_mon_out only 0////////////////////////////////   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_in_tdata_0;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_in_tstrb_0;
   wire                                             udp_mon_in_tvalid_0;
   wire                                             udp_mon_in_tlast_0;
   wire                                             udp_mon_in_tready_0;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_in_tuser_0;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_out_tdata_0;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_out_tstrb_0;
   wire                                             udp_mon_out_tvalid_0;
   wire                                             udp_mon_out_tlast_0;
   wire                                             udp_mon_out_tready_0;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_out_tuser_0;
   
////////////////////////////udp_mon_in udp_mon_out 123////////////////////////////////     
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_in_tdata_1;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_in_tstrb_1;
   wire                                             udp_mon_in_tvalid_1;
   wire                                             udp_mon_in_tlast_1;
   wire                                             udp_mon_in_tready_1;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_in_tuser_1;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_out_tdata_1;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_out_tstrb_1;
   wire                                             udp_mon_out_tvalid_1;
   wire                                             udp_mon_out_tlast_1;
   wire                                             udp_mon_out_tready_1;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_out_tuser_1;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_in_tdata_2;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_in_tstrb_2;
   wire                                             udp_mon_in_tvalid_2;
   wire                                             udp_mon_in_tlast_2;
   wire                                             udp_mon_in_tready_2;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_in_tuser_2;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_out_tdata_2;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_out_tstrb_2;
   wire                                             udp_mon_out_tvalid_2;
   wire                                             udp_mon_out_tlast_2;
   wire                                             udp_mon_out_tready_2;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_out_tuser_2;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_in_tdata_3;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_in_tstrb_3;
   wire                                             udp_mon_in_tvalid_3;
   wire                                             udp_mon_in_tlast_3;
   wire                                             udp_mon_in_tready_3;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_in_tuser_3;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]                 udp_mon_out_tdata_3;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]               udp_mon_out_tstrb_3;
   wire                                             udp_mon_out_tvalid_3;
   wire                                             udp_mon_out_tlast_3;
   wire                                             udp_mon_out_tready_3;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]                 udp_mon_out_tuser_3;
   

    wire [63:0]     add_user_out_0_tdata;
    wire [7:0]      add_user_out_0_tstrb;
    wire            add_user_out_0_tvalid;
    wire            add_user_out_0_tlast;
    wire            add_user_out_0_tready;
    
    wire [63:0]     add_user_out_1_tdata;
    wire [7:0]      add_user_out_1_tstrb;
    wire            add_user_out_1_tvalid;
    wire            add_user_out_1_tlast;
    wire            add_user_out_1_tready;
    
    wire [63:0]     add_user_out_2_tdata;
    wire [7:0]      add_user_out_2_tstrb;
    wire            add_user_out_2_tvalid;
    wire            add_user_out_2_tlast;
    wire            add_user_out_2_tready;
            
    wire [63:0]     add_user_out_3_tdata;
    wire [7:0]      add_user_out_3_tstrb;
    wire            add_user_out_3_tvalid;
    wire            add_user_out_3_tlast;
    wire            add_user_out_3_tready;
   
    wire [C_M_AXIS_TXD_0_TDATA_WIDTH-1:0]           add_user_tdata;
    wire [C_M_AXIS_TXD_0_TDATA_WIDTH/8-1:0]         add_user_tstrb;
    wire [UDP_AXIS_TUSER_WIDTH-1:0]                 add_user_tuser;
    wire                                            add_user_tvalid;
    wire                                            add_user_tlast;
    wire                                            add_user_tready;
    
add_tuser 
#(  .PORT_NUM(0),
    .C_M_AXIS_DATA_WIDTH   (64),
    .C_S_AXIS_DATA_WIDTH   (64)
) add_tuser_eth0_inst
(
// --- Interface to the output queues     
    .s_axis_tdata           (s_axis_eth_rx_0_tdata),
    .s_axis_tstrb           (s_axis_eth_rx_0_tstrb),
    .s_axis_tvalid          (s_axis_eth_rx_0_tvalid),
    .s_axis_tready          (s_axis_eth_rx_0_tready),
    .s_axis_tlast           (s_axis_eth_rx_0_tlast),
    
    .m_axis_tdata           (add_user_out_0_tdata),
    .m_axis_tstrb           (add_user_out_0_tstrb),
    .m_axis_tvalid          (add_user_out_0_tvalid),
    .m_axis_tready          (add_user_out_0_tready),
    .m_axis_tlast           (add_user_out_0_tlast),
    // --- Misc
    .reset                 (reset),
    .clk                   (clk)
);

add_tuser 
#(  .PORT_NUM(1),
    .C_M_AXIS_DATA_WIDTH   (64),
    .C_S_AXIS_DATA_WIDTH   (64)
) add_tuser_eth1_inst
(
// --- Interface to the output queues     
    .s_axis_tdata           (s_axis_eth_rx_1_tdata),
    .s_axis_tstrb           (s_axis_eth_rx_1_tstrb),
    .s_axis_tvalid          (s_axis_eth_rx_1_tvalid),
    .s_axis_tready          (s_axis_eth_rx_1_tready),
    .s_axis_tlast           (s_axis_eth_rx_1_tlast),
    
    .m_axis_tdata           (add_user_out_1_tdata),
    .m_axis_tstrb           (add_user_out_1_tstrb),
    .m_axis_tvalid          (add_user_out_1_tvalid),
    .m_axis_tready          (add_user_out_1_tready),
    .m_axis_tlast           (add_user_out_1_tlast),
    // --- Misc
    .reset                 (reset),
    .clk                   (clk)
);

add_tuser 
#(  .PORT_NUM(2),
    .C_M_AXIS_DATA_WIDTH   (64),
    .C_S_AXIS_DATA_WIDTH   (64)
) add_tuser_eth2_inst
(
// --- Interface to the output queues     
    .s_axis_tdata           (s_axis_eth_rx_2_tdata),
    .s_axis_tstrb           (s_axis_eth_rx_2_tstrb),
    .s_axis_tvalid          (s_axis_eth_rx_2_tvalid),
    .s_axis_tready          (s_axis_eth_rx_2_tready),
    .s_axis_tlast           (s_axis_eth_rx_2_tlast),
    
    .m_axis_tdata           (add_user_out_2_tdata),
    .m_axis_tstrb           (add_user_out_2_tstrb),
    .m_axis_tvalid          (add_user_out_2_tvalid),
    .m_axis_tready          (add_user_out_2_tready),
    .m_axis_tlast           (add_user_out_2_tlast),
    // --- Misc
    .reset                 (reset),
    .clk                   (clk)
);
add_tuser 
#(  .PORT_NUM(3),
    .C_M_AXIS_DATA_WIDTH   (64),
    .C_S_AXIS_DATA_WIDTH   (64)
) add_tuser_eth3_inst
(
// --- Interface to the output queues     
    .s_axis_tdata           (s_axis_eth_rx_3_tdata),
    .s_axis_tstrb           (s_axis_eth_rx_3_tstrb),
    .s_axis_tvalid          (s_axis_eth_rx_3_tvalid),
    .s_axis_tready          (s_axis_eth_rx_3_tready),
    .s_axis_tlast           (s_axis_eth_rx_3_tlast),
    
    .m_axis_tdata           (add_user_out_3_tdata),
    .m_axis_tstrb           (add_user_out_3_tstrb),
    .m_axis_tvalid          (add_user_out_3_tvalid),
    .m_axis_tready          (add_user_out_3_tready),
    .m_axis_tlast           (add_user_out_3_tlast),
    // --- Misc
    .reset                 (reset),
    .clk                   (clk)
);
    
   ////////////////////////////////////   
   // eth0 -> udp : 32 -> 256 
   ////////////////////////////////////
   axis_converter_rx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(64),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128),
	  .C_DEFAULT_SRC_PORT(8'h01),
	  .C_DEFAULT_DST_PORT(8'h00)
     ) eth_rx_0
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (add_user_out_0_tdata),
    .s_axis_tstrb           (add_user_out_0_tstrb),
    .s_axis_tvalid          (add_user_out_0_tvalid),
    .s_axis_tready          (add_user_out_0_tready),
    .s_axis_tlast           (add_user_out_0_tlast),

    // Master Stream Ports
    .m_axis_tdata           (udp_mon_in_tdata_0),
    .m_axis_tstrb           (udp_mon_in_tstrb_0),
    .m_axis_tvalid          (udp_mon_in_tvalid_0),
    .m_axis_tready          (udp_mon_in_tready_0),
    .m_axis_tlast           (udp_mon_in_tlast_0),
	.m_axis_tuser           (udp_mon_in_tuser_0)
    
   );
   
   ////////////////////////////////////   
   // eth1 -> udp : 32 -> 256 
   ////////////////////////////////////
   axis_converter_rx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(64),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128),
	  .C_DEFAULT_SRC_PORT(8'h02),
	  .C_DEFAULT_DST_PORT(8'h00)
     ) eth_rx_1
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (add_user_out_1_tdata),
    .s_axis_tstrb           (add_user_out_1_tstrb),
    .s_axis_tvalid          (add_user_out_1_tvalid),
    .s_axis_tready          (add_user_out_1_tready),
    .s_axis_tlast           (add_user_out_1_tlast),

    // Master Stream Ports
    .m_axis_tdata           (udp_mon_in_tdata_1),
    .m_axis_tstrb           (udp_mon_in_tstrb_1),
    .m_axis_tvalid          (udp_mon_in_tvalid_1),
    .m_axis_tready          (udp_mon_in_tready_1),
    .m_axis_tlast           (udp_mon_in_tlast_1),
	.m_axis_tuser           (udp_mon_in_tuser_1)
    
   );
   
   ////////////////////////////////////   
   // eth2 -> udp : 32 -> 256 
   ////////////////////////////////////
   axis_converter_rx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(64),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128),
	  .C_DEFAULT_SRC_PORT(8'h03),
	  .C_DEFAULT_DST_PORT(8'h00)
     ) eth_rx_2
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (add_user_out_2_tdata),
    .s_axis_tstrb           (add_user_out_2_tstrb),
    .s_axis_tvalid          (add_user_out_2_tvalid),
    .s_axis_tready          (add_user_out_2_tready),
    .s_axis_tlast           (add_user_out_2_tlast),

    // Master Stream Ports
    .m_axis_tdata           (udp_mon_in_tdata_2),
    .m_axis_tstrb           (udp_mon_in_tstrb_2),
    .m_axis_tvalid          (udp_mon_in_tvalid_2),
    .m_axis_tready          (udp_mon_in_tready_2),
    .m_axis_tlast           (udp_mon_in_tlast_2),
	.m_axis_tuser           (udp_mon_in_tuser_2)
    
   );
   
   ////////////////////////////////////   
   // eth3 -> udp : 32 -> 256 
   ////////////////////////////////////
   axis_converter_rx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(64),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128),
	  .C_DEFAULT_SRC_PORT(8'h04),
	  .C_DEFAULT_DST_PORT(8'h00)
     ) eth_rx_3
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (add_user_out_3_tdata),
    .s_axis_tstrb           (add_user_out_3_tstrb),
    .s_axis_tvalid          (add_user_out_3_tvalid),
    .s_axis_tready          (add_user_out_3_tready),
    .s_axis_tlast           (add_user_out_3_tlast),

    // Master Stream Ports
    .m_axis_tdata           (udp_mon_in_tdata_3),
    .m_axis_tstrb           (udp_mon_in_tstrb_3),
    .m_axis_tvalid          (udp_mon_in_tvalid_3),
    .m_axis_tready          (udp_mon_in_tready_3),
    .m_axis_tlast           (udp_mon_in_tlast_3),
	.m_axis_tuser           (udp_mon_in_tuser_3)
    
   );
   
///////////////////////////////add udp mon module////////////////////////////////////////////  
    user_data_path_mon osnt_monitor_udp
   (
      // --- Interface to the input queues
    .s_axis_tdata_0        (udp_mon_in_tdata_0), 
	.s_axis_tstrb_0        (udp_mon_in_tstrb_0),
	.s_axis_tuser_0        (udp_mon_in_tuser_0), 	  
    .s_axis_tvalid_0       (udp_mon_in_tvalid_0), 
    .s_axis_tlast_0        (udp_mon_in_tlast_0), 
    .s_axis_tready_0       (udp_mon_in_tready_0),
	
	.s_axis_tdata_1        (udp_mon_in_tdata_1), 
	.s_axis_tstrb_1        (udp_mon_in_tstrb_1),
	.s_axis_tuser_1        (udp_mon_in_tuser_1), 	  
    .s_axis_tvalid_1       (udp_mon_in_tvalid_1), 
    .s_axis_tlast_1        (udp_mon_in_tlast_1), 
    .s_axis_tready_1       (udp_mon_in_tready_1),
	
	.s_axis_tdata_2        (udp_mon_in_tdata_2), 
	.s_axis_tstrb_2        (udp_mon_in_tstrb_2),
	.s_axis_tuser_2        (udp_mon_in_tuser_2), 	  
    .s_axis_tvalid_2       (udp_mon_in_tvalid_2), 
    .s_axis_tlast_2        (udp_mon_in_tlast_2), 
    .s_axis_tready_2       (udp_mon_in_tready_2),
	
	.s_axis_tdata_3        (udp_mon_in_tdata_3), 
	.s_axis_tstrb_3        (udp_mon_in_tstrb_3),
	.s_axis_tuser_3        (udp_mon_in_tuser_3), 	  
    .s_axis_tvalid_3       (udp_mon_in_tvalid_3), 
    .s_axis_tlast_3        (udp_mon_in_tlast_3), 
    .s_axis_tready_3       (udp_mon_in_tready_3),
	
	  // --- Interface to the output queues
    .m_axis_tdata_0        (udp_mon_out_tdata_0), 
	.m_axis_tstrb_0        (udp_mon_out_tstrb_0),
	.m_axis_tuser_0        (udp_mon_out_tuser_0), 	  
    .m_axis_tvalid_0       (udp_mon_out_tvalid_0), 
    .m_axis_tlast_0        (udp_mon_out_tlast_0), 
    .m_axis_tready_0       (udp_mon_out_tready_0),

    // --- Misc
    .reset                 (reset),
    .clk                   (clk)
    );

   


   ////////////////////////////////////   
   // engine -> eth0 : 256 -> 32 
   ////////////////////////////////////
   axis_converter_tx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(256),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128)
     ) eth_tx_0
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),


    .s_axis_tdata           (udp_mon_out_tdata_0),
    .s_axis_tstrb           (udp_mon_out_tstrb_0),
    .s_axis_tvalid          (udp_mon_out_tvalid_0),
    .s_axis_tready          (udp_mon_out_tready_0),
    .s_axis_tlast           (udp_mon_out_tlast_0),
    .s_axis_tuser           (udp_mon_out_tuser_0),
    
    

    .m_axis_tdata           (m_axis_eth_tx_tdata),  
    .m_axis_tstrb           (m_axis_eth_tx_tstrb),  
    .m_axis_tvalid          (m_axis_eth_tx_tvalid),  
    .m_axis_tready          (m_axis_eth_tx_tready), 
    .m_axis_tlast           (m_axis_eth_tx_tlast),
    // .m_axis_tdata           (add_user_tdata),
    // .m_axis_tstrb           (add_user_tstrb),
    // .m_axis_tuser           (add_user_tuser),
    // .m_axis_tvalid          (add_user_tvalid),
    // .m_axis_tready          (add_user_tready),
    // .m_axis_tlast           (add_user_tlast),
    
	.tx_pkt_byte_cnt        (),
    .tx_pkt_byte_cnt_vld    ()
   );

    // add_tuser 
    // #(    
    // .C_M_AXIS_DATA_WIDTH   (256),
    // .C_S_AXIS_DATA_WIDTH   (256),
    // .C_M_AXIS_TUSER_WIDTH  (128),
    // .C_S_AXIS_TUSER_WIDTH  (128)

    // ) 
    // add_tuser_inst
    // (
    // // --- Interface to the output queues     
        // .s_axis_tdata           (add_user_tdata),
        // .s_axis_tstrb           (add_user_tstrb),
        // .s_axis_tuser           (add_user_tuser),
        // .s_axis_tvalid          (add_user_tvalid),
        // .s_axis_tready          (add_user_tready),
        // .s_axis_tlast           (add_user_tlast),
        
        // .m_axis_tdata           (m_axis_eth_tx_tdata),  
        // .m_axis_tstrb           (m_axis_eth_tx_tstrb),  
        // .m_axis_tvalid          (m_axis_eth_tx_tvalid),  
        // .m_axis_tready          (m_axis_eth_tx_tready), 
        // .m_axis_tlast           (m_axis_eth_tx_tlast),

        // .reset                 (reset),
        // .clk                   (clk)
    // );
endmodule

//-----------------------------------------------------------------//
//onet_core_logic.v
//
//-----------------------------------------------------------------//
module onet_core_logic#(
parameter integer C_S_AXIS_RXD_0_TDATA_WIDTH	= 64,
parameter integer C_M_AXIS_TXD_0_TDATA_WIDTH	= 64,
parameter integer UDP_AXIS_TDATA_WIDTH	  = 256,
parameter integer UDP_AXIS_TUSER_WIDTH    = 128
)
(
      input                                     clk,                       //system clk
      input                                     reset,                     //system reset
      //ethernet port 0
      input                                     s_axis_eth_aclk_0,

/////////////////////////////////////add s_axis_eth_rx_tdata_0///////////////////////////////////
      output                                    s_axis_eth_rx_aresetn_0,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]    s_axis_eth_rx_tdata_0,
      input                                     s_axis_eth_rx_tvalid_0,
      input                                     s_axis_eth_rx_tlast_0,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]  s_axis_eth_rx_tkeep_0,
      output                                    s_axis_eth_rx_tready_0,
/////////////////////////////////////add s_axis_eth_rx_tdata_0///////////////////////////////////
      output                                    s_axis_eth_rx_aresetn_1,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH-1:0]    s_axis_eth_rx_tdata_1,
      input                                     s_axis_eth_rx_tvalid_1,
      input                                     s_axis_eth_rx_tlast_1,
      input [C_S_AXIS_RXD_0_TDATA_WIDTH/8-1:0]  s_axis_eth_rx_tkeep_1,
      output                                    s_axis_eth_rx_tready_1,
	  
	  
      
      output                                    m_axis_eth_tx_aresetn_0,
      output [C_M_AXIS_TXD_0_TDATA_WIDTH-1:0]   m_axis_eth_tx_tdata_0,
      output                                    m_axis_eth_tx_tvalid_0,
      output                                    m_axis_eth_tx_tlast_0,
      output [C_M_AXIS_TXD_0_TDATA_WIDTH/8-1:0]   m_axis_eth_tx_tkeep_0,
      input                                     m_axis_eth_tx_tready_0
	  
    );
  
wire [127:0] DEFAULT_TUSER;
assign DEFAULT_TUSER = 128'b0;




////////////////////////////udp_mon_in udp_mon_out only 0////////////////////////////////   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_in_tdata_0;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_in_tstrb_0;
   wire                                     udp_mon_in_tvalid_0;
   wire                                     udp_mon_in_tlast_0;
   wire                                     udp_mon_in_tready_0;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_in_tuser_0;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_out_tdata_0;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_out_tstrb_0;
   wire                                     udp_mon_out_tvalid_0;
   wire                                     udp_mon_out_tlast_0;
   wire                                     udp_mon_out_tready_0;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_out_tuser_0;
        
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_in_tdata_1;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_in_tstrb_1;
   wire                                     udp_mon_in_tvalid_1;
   wire                                     udp_mon_in_tlast_1;
   wire                                     udp_mon_in_tready_1;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_in_tuser_1;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_out_tdata_1;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_out_tstrb_1;
   wire                                     udp_mon_out_tvalid_1;
   wire                                     udp_mon_out_tlast_1;
   wire                                     udp_mon_out_tready_1;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_out_tuser_1;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_in_tdata_2;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_in_tstrb_2;
   wire                                     udp_mon_in_tvalid_2;
   wire                                     udp_mon_in_tlast_2;
   wire                                     udp_mon_in_tready_2;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_in_tuser_2;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_out_tdata_2;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_out_tstrb_2;
   wire                                     udp_mon_out_tvalid_2;
   wire                                     udp_mon_out_tlast_2;
   wire                                     udp_mon_out_tready_2;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_out_tuser_2;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_in_tdata_3;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_in_tstrb_3;
   wire                                     udp_mon_in_tvalid_3;
   wire                                     udp_mon_in_tlast_3;
   wire                                     udp_mon_in_tready_3;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_in_tuser_3;
   
   wire [UDP_AXIS_TDATA_WIDTH-1:0]          udp_mon_out_tdata_3;
   wire [UDP_AXIS_TDATA_WIDTH/8-1:0]        udp_mon_out_tstrb_3;
   wire                                     udp_mon_out_tvalid_3;
   wire                                     udp_mon_out_tlast_3;
   wire                                     udp_mon_out_tready_3;
   wire	[UDP_AXIS_TUSER_WIDTH-1:0]          udp_mon_out_tuser_3;
   

   
   ////////////////////////////////////   
   // eth0 -> udp : 32 -> 256 
   ////////////////////////////////////
   axis_converter_rx
    #(.C_M_AXIS_DATA_WIDTH(256),
      .C_S_AXIS_DATA_WIDTH(64),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128),
	  .C_DEFAULT_SRC_PORT(8'h00),
	  .C_DEFAULT_DST_PORT(8'h02)
     ) eth_rx_0
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (s_axis_eth_rx_tdata_0),
    .s_axis_tstrb           (s_axis_eth_rx_tkeep_0),
    .s_axis_tvalid          (s_axis_eth_rx_tvalid_0),
    .s_axis_tready          (s_axis_eth_rx_tready_0),
    .s_axis_tlast           (s_axis_eth_rx_tlast_0),
	  .s_axis_tuser           (DEFAULT_TUSER),

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
	  .C_DEFAULT_SRC_PORT(8'h01),
	  .C_DEFAULT_DST_PORT(8'h08)
     ) eth_rx_1
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),
	
	// Slave Stream Ports
    .s_axis_tdata           (s_axis_eth_rx_tdata_1),
    .s_axis_tstrb           (s_axis_eth_rx_tkeep_1),
    .s_axis_tvalid          (s_axis_eth_rx_tvalid_1),
    .s_axis_tready          (s_axis_eth_rx_tready_1),
    .s_axis_tlast           (s_axis_eth_rx_tlast_1),
	 .s_axis_tuser           (DEFAULT_TUSER),

    // Master Stream Ports
    .m_axis_tdata           (udp_mon_in_tdata_1),
    .m_axis_tstrb           (udp_mon_in_tstrb_1),
    .m_axis_tvalid          (udp_mon_in_tvalid_1),
    .m_axis_tready          (udp_mon_in_tready_1),
    .m_axis_tlast           (udp_mon_in_tlast_1),
	.m_axis_tuser           (udp_mon_in_tuser_1)
    
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
    #(.C_M_AXIS_DATA_WIDTH(64),
      .C_S_AXIS_DATA_WIDTH(256),
      .C_M_AXIS_TUSER_WIDTH(128),
      .C_S_AXIS_TUSER_WIDTH(128)
     ) eth_tx_0
    (
    // Global Ports
    .axi_aclk(s_axis_eth_aclk_0),
    .axi_resetn(~reset),

    // Master Stream Ports
    .s_axis_tdata           (udp_mon_out_tdata_0),
    .s_axis_tstrb           (udp_mon_out_tstrb_0),
    .s_axis_tvalid          (udp_mon_out_tvalid_0),
    .s_axis_tready          (udp_mon_out_tready_0),
    .s_axis_tlast           (udp_mon_out_tlast_0),
	//.s_axis_tuser           (udp_mon_out_tdata_0),

    // Slave Stream Ports
    .m_axis_tdata           (m_axis_eth_tx_tdata_0),
    .m_axis_tstrb           (m_axis_eth_tx_tkeep_0),
    .m_axis_tvalid          (m_axis_eth_tx_tvalid_0),
    .m_axis_tready          (m_axis_eth_tx_tready_0),
    .m_axis_tlast           (m_axis_eth_tx_tlast_0),
	.m_axis_tuser           (),
	
	 .tx_pkt_byte_cnt        (),
     .tx_pkt_byte_cnt_vld    ()
   );

endmodule

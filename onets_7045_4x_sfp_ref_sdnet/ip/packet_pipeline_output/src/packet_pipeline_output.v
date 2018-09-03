//-------------------------------------------------------------------
// AXI4 interface wrapper for packet processing pipeline.
//-------------------------------------------------------------------

module packet_pipeline_output#(
    parameter integer C_S_AXI_LITE_DATA_WIDTH	= 32,
    parameter integer C_S_AXI_LITE_ADDR_WIDTH	= 27,

    parameter integer C_S_AXIS_RXD_0_TDATA_WIDTH	= 256,
    parameter integer C_M_AXIS_TXD_0_TDATA_WIDTH	= 64,
    parameter integer C_M_AXIS_TXD_1_TDATA_WIDTH	= 64,
    parameter integer C_M_AXIS_TXD_2_TDATA_WIDTH	= 64,
    parameter integer C_M_AXIS_TXD_3_TDATA_WIDTH	= 64,

    parameter integer C_S_AXIS_RXS_TDATA_WIDTH	= 64,
    parameter integer ACTION_TUPLE_WIDTH = 128

)
(
    // Users to add ports here
    input wire s_axis_rxd_aclk,
    input wire s_axis_rxd_aresetn,
    // User ports ends
    // Do not modify the ports beyond this line

    // Ports of Axi Slave Bus Interface S_AXI_LITE
    input wire  s_axi_lite_aclk,
    input wire  s_axi_lite_aresetn,
    input wire [C_S_AXI_LITE_ADDR_WIDTH-1 : 0] s_axi_lite_awaddr,
    input wire [2 : 0] s_axi_lite_awprot,
    input wire  s_axi_lite_awvalid,
    output wire  s_axi_lite_awready,
    input wire [C_S_AXI_LITE_DATA_WIDTH-1 : 0] s_axi_lite_wdata,
    input wire [(C_S_AXI_LITE_DATA_WIDTH/8)-1 : 0] s_axi_lite_wstrb,
    input wire  s_axi_lite_wvalid,
    output wire  s_axi_lite_wready,
    output wire [1 : 0] s_axi_lite_bresp,
    output wire  s_axi_lite_bvalid,
    input wire  s_axi_lite_bready,
    input wire [C_S_AXI_LITE_ADDR_WIDTH-1 : 0] s_axi_lite_araddr,
    input wire [2 : 0] s_axi_lite_arprot,
    input wire  s_axi_lite_arvalid,
    output wire  s_axi_lite_arready,
    output wire [C_S_AXI_LITE_DATA_WIDTH-1 : 0] s_axi_lite_rdata,
    output wire [1 : 0] s_axi_lite_rresp,
    output wire  s_axi_lite_rvalid,
    input wire  s_axi_lite_rready,


    input wire [C_S_AXIS_RXD_0_TDATA_WIDTH-1 : 0]                   s_axis_rxd_0_tdata,
    input wire [(C_S_AXIS_RXD_0_TDATA_WIDTH/8)-1 : 0]               s_axis_rxd_0_tkeep,
    input wire                                                      s_axis_rxd_0_tlast,
    input wire                                                      s_axis_rxd_0_tvalid,
    output wire                                                     s_axis_rxd_0_tready,
    output wire [C_M_AXIS_TXD_0_TDATA_WIDTH-1 : 0]                  m_axis_txd_0_tdata,
    output wire [(C_M_AXIS_TXD_0_TDATA_WIDTH/8)-1 : 0]              m_axis_txd_0_tkeep,
    output wire                                                     m_axis_txd_0_tlast,
    output wire                                                     m_axis_txd_0_tvalid,
    input wire                                                      m_axis_txd_0_tready,
    output wire [C_M_AXIS_TXD_1_TDATA_WIDTH-1 : 0]                  m_axis_txd_1_tdata,
    output wire [(C_M_AXIS_TXD_1_TDATA_WIDTH/8)-1 : 0]              m_axis_txd_1_tkeep,
    output wire                                                     m_axis_txd_1_tlast,
	output wire                                                     m_axis_txd_1_tvalid,
    input wire                                                      m_axis_txd_1_tready,
    output wire [C_M_AXIS_TXD_2_TDATA_WIDTH-1 : 0]                  m_axis_txd_2_tdata,
    output wire [(C_M_AXIS_TXD_2_TDATA_WIDTH/8)-1 : 0]              m_axis_txd_2_tkeep,
    output wire                                                     m_axis_txd_2_tlast,
    output wire                                                     m_axis_txd_2_tvalid,
    input wire                                                      m_axis_txd_2_tready,
    output wire [C_M_AXIS_TXD_3_TDATA_WIDTH-1 : 0]                  m_axis_txd_3_tdata,
    output wire [(C_M_AXIS_TXD_3_TDATA_WIDTH/8)-1 : 0]              m_axis_txd_3_tkeep,
    output wire                                                     m_axis_txd_3_tlast,
    output wire                                                     m_axis_txd_3_tvalid,
    input wire                                                      m_axis_txd_3_tready,
    output wire [C_S_AXIS_RXS_TDATA_WIDTH-1 : 0] 					m_axis_s2mm_0_tdata,
    output wire [(C_S_AXIS_RXS_TDATA_WIDTH/8)-1 : 0] 				m_axis_s2mm_0_tkeep,
    output wire  													m_axis_s2mm_0_tlast,
    output wire  													m_axis_s2mm_0_tvalid,
    input wire  													m_axis_s2mm_0_tready,
    output wire [C_S_AXIS_RXS_TDATA_WIDTH-1 : 0] 					m_axis_s2mm_1_tdata,
    output wire [(C_S_AXIS_RXS_TDATA_WIDTH/8)-1 : 0] 				m_axis_s2mm_1_tkeep,
    output wire  													m_axis_s2mm_1_tlast,
    output wire  													m_axis_s2mm_1_tvalid,
    input wire  													m_axis_s2mm_1_tready,
    output wire [C_S_AXIS_RXS_TDATA_WIDTH-1 : 0] 					m_axis_s2mm_2_tdata,
    output wire [(C_S_AXIS_RXS_TDATA_WIDTH/8)-1 : 0] 				m_axis_s2mm_2_tkeep,
    output wire  													m_axis_s2mm_2_tlast,
    output wire  													m_axis_s2mm_2_tvalid,
    input wire  													m_axis_s2mm_2_tready,
    output wire [C_S_AXIS_RXS_TDATA_WIDTH-1 : 0] 					m_axis_s2mm_3_tdata,
    output wire [(C_S_AXIS_RXS_TDATA_WIDTH/8)-1 : 0] 				m_axis_s2mm_3_tkeep,
    output wire  													m_axis_s2mm_3_tlast,
    output wire  													m_axis_s2mm_3_tvalid,
    input wire  													m_axis_s2mm_3_tready,
    
    input   [ACTION_TUPLE_WIDTH-1:0]                                tuple_in_flowstream_data,
    input                                                           tuple_in_flowstream_valid
   );
   
   wire axis_aclk = s_axis_rxd_aclk;
   wire axis_aresetn = s_axis_rxd_aresetn;
   	wire [11: 0]   dma_tx_pkt_byte_cnt_0;
         wire 	       dma_tx_pkt_byte_cnt_vld_0;
      wire [11: 0]   dma_tx_pkt_byte_cnt_1;
         wire 	       dma_tx_pkt_byte_cnt_vld_1;	  
         wire [11: 0]   dma_tx_pkt_byte_cnt_2;
         wire 	       dma_tx_pkt_byte_cnt_vld_2;	  
      wire [11: 0]   dma_tx_pkt_byte_cnt_3;
         wire 	       dma_tx_pkt_byte_cnt_vld_3;	

   
onet_output_core
#(
  .C_S_AXIS_TDATA_WIDTH	 (256),
  .C_M_AXIS_TDATA_WIDTH	 (64),
  .AXIS_USER_WIDTH       (128),
  .ACTION_TUPLE_WIDTH    (128),
  .QUEUES_NUM            (8)
) onet_output_core_inst 
(
    .axis_resetn             (s_axis_rxd_aresetn),
    .axis_clk                (s_axis_rxd_aclk),

    .s_axis_tdata            (s_axis_rxd_0_tdata),
    .s_axis_tstrb            (s_axis_rxd_0_tkeep),
    .s_axis_tlast            (s_axis_rxd_0_tlast),
    .s_axis_tvalid           (s_axis_rxd_0_tvalid),
    .s_axis_tready           (s_axis_rxd_0_tready),
    .m_axis_tdata_0          (m_axis_txd_0_tdata),
    .m_axis_tstrb_0          (m_axis_txd_0_tkeep),
    .m_axis_tlast_0          (m_axis_txd_0_tlast),
    .m_axis_tvalid_0         (m_axis_txd_0_tvalid),
    .m_axis_tready_0         (m_axis_txd_0_tready),
    .m_axis_tdata_1          (m_axis_txd_1_tdata),
    .m_axis_tstrb_1          (m_axis_txd_1_tkeep),
    .m_axis_tlast_1          (m_axis_txd_1_tlast),
    .m_axis_tvalid_1         (m_axis_txd_1_tvalid),
    .m_axis_tready_1         (m_axis_txd_1_tready),
    .m_axis_tdata_2          (m_axis_txd_2_tdata),
    .m_axis_tstrb_2          (m_axis_txd_2_tkeep),
    .m_axis_tlast_2          (m_axis_txd_2_tlast),
    .m_axis_tvalid_2         (m_axis_txd_2_tvalid),
    .m_axis_tready_2         (m_axis_txd_2_tready),
    .m_axis_tdata_3          (m_axis_txd_3_tdata),
    .m_axis_tstrb_3          (m_axis_txd_3_tkeep),
    .m_axis_tlast_3          (m_axis_txd_3_tlast),
    .m_axis_tvalid_3         (m_axis_txd_3_tvalid),
    .m_axis_tready_3         (m_axis_txd_3_tready),
    .m_axis_tdata_4          (m_axis_s2mm_0_tdata),
    .m_axis_tstrb_4          (m_axis_s2mm_0_tkeep),
    .m_axis_tvalid_4         (m_axis_s2mm_0_tvalid),
    .m_axis_tlast_4          (m_axis_s2mm_0_tlast),
    .m_axis_tready_4         (m_axis_s2mm_0_tready),
    .m_axis_tdata_5          (m_axis_s2mm_1_tdata),
    .m_axis_tstrb_5          (m_axis_s2mm_1_tkeep),
    .m_axis_tlast_5          (m_axis_s2mm_1_tlast),
    .m_axis_tvalid_5         (m_axis_s2mm_1_tvalid),
    .m_axis_tready_5         (m_axis_s2mm_1_tready),
    .m_axis_tdata_6          (m_axis_s2mm_2_tdata),
    .m_axis_tstrb_6          (m_axis_s2mm_2_tkeep),
    .m_axis_tlast_6          (m_axis_s2mm_2_tlast),
    .m_axis_tvalid_6         (m_axis_s2mm_2_tvalid),
    .m_axis_tready_6         (m_axis_s2mm_2_tready),
    .m_axis_tdata_7          (m_axis_s2mm_3_tdata),
    .m_axis_tstrb_7          (m_axis_s2mm_3_tkeep),
    .m_axis_tlast_7          (m_axis_s2mm_3_tlast),
    .m_axis_tvalid_7         (m_axis_s2mm_3_tvalid),
    .m_axis_tready_7         (m_axis_s2mm_3_tready),
    .tuple_flowstream_data   (tuple_in_flowstream_data),
    .tuple_flowstream_valid  (tuple_in_flowstream_valid)
);
	
   
endmodule

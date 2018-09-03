//-------------------------------------------------------------------
// AXI4 interface wrapper for packet processing pipeline.
//-------------------------------------------------------------------

`timescale 1ns/1ps
module dma_eth#(
parameter integer C_S_AXIS_RXD_0_TDATA_WIDTH	= 64,
parameter integer C_M_AXIS_TXD_0_TDATA_WIDTH	= 64
)
(
    // Users to add ports here
    input wire s_axis_rxd_aclk,
    input wire s_axis_rxd_aresetn,

    output wire  													s_axis_rxd_0_tready,
    input wire [C_S_AXIS_RXD_0_TDATA_WIDTH-1 : 0] 					s_axis_rxd_0_tdata,
    input wire [(C_S_AXIS_RXD_0_TDATA_WIDTH/8)-1 : 0] 				s_axis_rxd_0_tkeep,
    input wire  													s_axis_rxd_0_tlast,
    input wire  													s_axis_rxd_0_tvalid,
	
	output wire  													s_axis_rxd_1_tready,
    input wire [C_S_AXIS_RXD_0_TDATA_WIDTH-1 : 0] 					s_axis_rxd_1_tdata,
    input wire [(C_S_AXIS_RXD_0_TDATA_WIDTH/8)-1 : 0] 				s_axis_rxd_1_tkeep,
    input wire  													s_axis_rxd_1_tlast,
    input wire  													s_axis_rxd_1_tvalid,
	
    output wire  													m_axis_txd_0_tvalid,
    output wire [C_M_AXIS_TXD_0_TDATA_WIDTH-1 : 0] 					m_axis_txd_0_tdata,
    output wire [(C_M_AXIS_TXD_0_TDATA_WIDTH/8)-1 : 0] 				m_axis_txd_0_tkeep,
    output wire  													m_axis_txd_0_tlast,
    input wire  													m_axis_txd_0_tready	
	
   );
   
   wire axis_aclk = s_axis_rxd_aclk;
   wire axis_aresetn = s_axis_rxd_aresetn;
   onet_core_logic onet_core_logic_inst (
      .clk                          (axis_aclk), 
      .reset                        (~axis_aresetn), 
   
      .s_axis_eth_aclk_0            (axis_aclk),
///////////////////////s_axis_eth_rx_tdata_0 -----> s_axis_dma_rx_txxx_0/////////////////////////
      .m_axis_eth_tx_tdata_0        (m_axis_txd_0_tdata), 
      .m_axis_eth_tx_tvalid_0       (m_axis_txd_0_tvalid), 
      .m_axis_eth_tx_tlast_0        (m_axis_txd_0_tlast), 
      .m_axis_eth_tx_tkeep_0        (m_axis_txd_0_tkeep), 
      .m_axis_eth_tx_tready_0       (m_axis_txd_0_tready), 
	  
	  /////////////////////add mon path:eth----->dma///////////////////////////
	  .s_axis_eth_rx_tdata_0        (s_axis_rxd_0_tdata), 
      .s_axis_eth_rx_tvalid_0       (s_axis_rxd_0_tvalid), 
      .s_axis_eth_rx_tlast_0        (s_axis_rxd_0_tlast), 
      .s_axis_eth_rx_tkeep_0        (s_axis_rxd_0_tkeep), 
      .s_axis_eth_rx_tready_0       (s_axis_rxd_0_tready),

	  .s_axis_eth_rx_tdata_1        (s_axis_rxd_1_tdata), 
      .s_axis_eth_rx_tvalid_1       (s_axis_rxd_1_tvalid), 
      .s_axis_eth_rx_tlast_1        (s_axis_rxd_1_tlast), 
      .s_axis_eth_rx_tkeep_1        (s_axis_rxd_1_tkeep), 
      .s_axis_eth_rx_tready_1       (s_axis_rxd_1_tready)

   ); 

 endmodule

//----------------------------------------------------------------------------
//   This file is owned and controlled by Xilinx and must be used solely    //
//   for design, simulation, implementation and creation of design files    //
//   limited to Xilinx devices or technologies. Use with non-Xilinx         //
//   devices or technologies is expressly prohibited and immediately        //
//   terminates your license.                                               //
//                                                                          //
//   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY   //
//   FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY   //
//   PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE            //
//   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS     //
//   MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY     //
//   CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY      //
//   RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY      //
//   DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE  //
//   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         //
//   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        //
//   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A  //
//   PARTICULAR PURPOSE.                                                    //
//                                                                          //
//   Xilinx products are not intended for use in life support appliances,   //
//   devices, or systems.  Use in such applications are expressly           //
//   prohibited.                                                            //
//                                                                          //
//   (c) Copyright 1995-2015 Xilinx, Inc.                                   //
//   All rights reserved.                                                   //
//----------------------------------------------------------------------------
// Xilinx SDNet Compiler version HEAD, build 1585976
//----------------------------------------------------------------------------
/*

*/

`timescale 1 ps / 1 ps

module PPPOE (
	packet_in_instream_TVALID,
	packet_in_instream_TREADY,
	packet_in_instream_TDATA,
	packet_in_instream_TKEEP,
	packet_in_instream_TLAST,
	control_qinq_tb_S_AXI_AWADDR,
	control_qinq_tb_S_AXI_AWVALID,
	control_qinq_tb_S_AXI_AWREADY,
	control_qinq_tb_S_AXI_WDATA,
	control_qinq_tb_S_AXI_WSTRB,
	control_qinq_tb_S_AXI_WVALID,
	control_qinq_tb_S_AXI_WREADY,
	control_qinq_tb_S_AXI_BRESP,
	control_qinq_tb_S_AXI_BVALID,
	control_qinq_tb_S_AXI_BREADY,
	control_qinq_tb_S_AXI_ARADDR,
	control_qinq_tb_S_AXI_ARVALID,
	control_qinq_tb_S_AXI_ARREADY,
	control_qinq_tb_S_AXI_RDATA,
	control_qinq_tb_S_AXI_RRESP,
	control_qinq_tb_S_AXI_RVALID,
	control_qinq_tb_S_AXI_RREADY,
	control_domain_tb_S_AXI_AWADDR,
	control_domain_tb_S_AXI_AWVALID,
	control_domain_tb_S_AXI_AWREADY,
	control_domain_tb_S_AXI_WDATA,
	control_domain_tb_S_AXI_WSTRB,
	control_domain_tb_S_AXI_WVALID,
	control_domain_tb_S_AXI_WREADY,
	control_domain_tb_S_AXI_BRESP,
	control_domain_tb_S_AXI_BVALID,
	control_domain_tb_S_AXI_BREADY,
	control_domain_tb_S_AXI_ARADDR,
	control_domain_tb_S_AXI_ARVALID,
	control_domain_tb_S_AXI_ARREADY,
	control_domain_tb_S_AXI_RDATA,
	control_domain_tb_S_AXI_RRESP,
	control_domain_tb_S_AXI_RVALID,
	control_domain_tb_S_AXI_RREADY,
	control_l3_tb_S_AXI_AWADDR,
	control_l3_tb_S_AXI_AWVALID,
	control_l3_tb_S_AXI_AWREADY,
	control_l3_tb_S_AXI_WDATA,
	control_l3_tb_S_AXI_WSTRB,
	control_l3_tb_S_AXI_WVALID,
	control_l3_tb_S_AXI_WREADY,
	control_l3_tb_S_AXI_BRESP,
	control_l3_tb_S_AXI_BVALID,
	control_l3_tb_S_AXI_BREADY,
	control_l3_tb_S_AXI_ARADDR,
	control_l3_tb_S_AXI_ARVALID,
	control_l3_tb_S_AXI_ARREADY,
	control_l3_tb_S_AXI_RDATA,
	control_l3_tb_S_AXI_RRESP,
	control_l3_tb_S_AXI_RVALID,
	control_l3_tb_S_AXI_RREADY,
	control_pppL2_tb_S_AXI_AWADDR,
	control_pppL2_tb_S_AXI_AWVALID,
	control_pppL2_tb_S_AXI_AWREADY,
	control_pppL2_tb_S_AXI_WDATA,
	control_pppL2_tb_S_AXI_WSTRB,
	control_pppL2_tb_S_AXI_WVALID,
	control_pppL2_tb_S_AXI_WREADY,
	control_pppL2_tb_S_AXI_BRESP,
	control_pppL2_tb_S_AXI_BVALID,
	control_pppL2_tb_S_AXI_BREADY,
	control_pppL2_tb_S_AXI_ARADDR,
	control_pppL2_tb_S_AXI_ARVALID,
	control_pppL2_tb_S_AXI_ARREADY,
	control_pppL2_tb_S_AXI_RDATA,
	control_pppL2_tb_S_AXI_RRESP,
	control_pppL2_tb_S_AXI_RVALID,
	control_pppL2_tb_S_AXI_RREADY,
	control_extL2_tb_S_AXI_AWADDR,
	control_extL2_tb_S_AXI_AWVALID,
	control_extL2_tb_S_AXI_AWREADY,
	control_extL2_tb_S_AXI_WDATA,
	control_extL2_tb_S_AXI_WSTRB,
	control_extL2_tb_S_AXI_WVALID,
	control_extL2_tb_S_AXI_WREADY,
	control_extL2_tb_S_AXI_BRESP,
	control_extL2_tb_S_AXI_BVALID,
	control_extL2_tb_S_AXI_BREADY,
	control_extL2_tb_S_AXI_ARADDR,
	control_extL2_tb_S_AXI_ARVALID,
	control_extL2_tb_S_AXI_ARREADY,
	control_extL2_tb_S_AXI_RDATA,
	control_extL2_tb_S_AXI_RRESP,
	control_extL2_tb_S_AXI_RVALID,
	control_extL2_tb_S_AXI_RREADY,
	enable_processing,
	packet_out_outstream_TVALID,
	packet_out_outstream_TREADY,
	packet_out_outstream_TDATA,
	packet_out_outstream_TKEEP,
	packet_out_outstream_TLAST,
	tuple_out_flowstream_VALID,
	tuple_out_flowstream_DATA,
	clk_line_rst,
	clk_line,
	clk_packet_rst,
	clk_packet,
	clk_control_rst,
	clk_control,
	internal_rst_done
);

input [0:0] packet_in_instream_TVALID ;
output [0:0] packet_in_instream_TREADY ;
input [255:0] packet_in_instream_TDATA ;
input [31:0] packet_in_instream_TKEEP ;
input [0:0] packet_in_instream_TLAST ;
input [7:0] control_qinq_tb_S_AXI_AWADDR ;
input [0:0] control_qinq_tb_S_AXI_AWVALID ;
output [0:0] control_qinq_tb_S_AXI_AWREADY ;
input [31:0] control_qinq_tb_S_AXI_WDATA ;
input [3:0] control_qinq_tb_S_AXI_WSTRB ;
input [0:0] control_qinq_tb_S_AXI_WVALID ;
output [0:0] control_qinq_tb_S_AXI_WREADY ;
output [1:0] control_qinq_tb_S_AXI_BRESP ;
output [0:0] control_qinq_tb_S_AXI_BVALID ;
input [0:0] control_qinq_tb_S_AXI_BREADY ;
input [7:0] control_qinq_tb_S_AXI_ARADDR ;
input [0:0] control_qinq_tb_S_AXI_ARVALID ;
output [0:0] control_qinq_tb_S_AXI_ARREADY ;
output [31:0] control_qinq_tb_S_AXI_RDATA ;
output [1:0] control_qinq_tb_S_AXI_RRESP ;
output [0:0] control_qinq_tb_S_AXI_RVALID ;
input [0:0] control_qinq_tb_S_AXI_RREADY ;
input [7:0] control_domain_tb_S_AXI_AWADDR ;
input [0:0] control_domain_tb_S_AXI_AWVALID ;
output [0:0] control_domain_tb_S_AXI_AWREADY ;
input [31:0] control_domain_tb_S_AXI_WDATA ;
input [3:0] control_domain_tb_S_AXI_WSTRB ;
input [0:0] control_domain_tb_S_AXI_WVALID ;
output [0:0] control_domain_tb_S_AXI_WREADY ;
output [1:0] control_domain_tb_S_AXI_BRESP ;
output [0:0] control_domain_tb_S_AXI_BVALID ;
input [0:0] control_domain_tb_S_AXI_BREADY ;
input [7:0] control_domain_tb_S_AXI_ARADDR ;
input [0:0] control_domain_tb_S_AXI_ARVALID ;
output [0:0] control_domain_tb_S_AXI_ARREADY ;
output [31:0] control_domain_tb_S_AXI_RDATA ;
output [1:0] control_domain_tb_S_AXI_RRESP ;
output [0:0] control_domain_tb_S_AXI_RVALID ;
input [0:0] control_domain_tb_S_AXI_RREADY ;
input [7:0] control_l3_tb_S_AXI_AWADDR ;
input [0:0] control_l3_tb_S_AXI_AWVALID ;
output [0:0] control_l3_tb_S_AXI_AWREADY ;
input [31:0] control_l3_tb_S_AXI_WDATA ;
input [3:0] control_l3_tb_S_AXI_WSTRB ;
input [0:0] control_l3_tb_S_AXI_WVALID ;
output [0:0] control_l3_tb_S_AXI_WREADY ;
output [1:0] control_l3_tb_S_AXI_BRESP ;
output [0:0] control_l3_tb_S_AXI_BVALID ;
input [0:0] control_l3_tb_S_AXI_BREADY ;
input [7:0] control_l3_tb_S_AXI_ARADDR ;
input [0:0] control_l3_tb_S_AXI_ARVALID ;
output [0:0] control_l3_tb_S_AXI_ARREADY ;
output [31:0] control_l3_tb_S_AXI_RDATA ;
output [1:0] control_l3_tb_S_AXI_RRESP ;
output [0:0] control_l3_tb_S_AXI_RVALID ;
input [0:0] control_l3_tb_S_AXI_RREADY ;
input [7:0] control_pppL2_tb_S_AXI_AWADDR ;
input [0:0] control_pppL2_tb_S_AXI_AWVALID ;
output [0:0] control_pppL2_tb_S_AXI_AWREADY ;
input [31:0] control_pppL2_tb_S_AXI_WDATA ;
input [3:0] control_pppL2_tb_S_AXI_WSTRB ;
input [0:0] control_pppL2_tb_S_AXI_WVALID ;
output [0:0] control_pppL2_tb_S_AXI_WREADY ;
output [1:0] control_pppL2_tb_S_AXI_BRESP ;
output [0:0] control_pppL2_tb_S_AXI_BVALID ;
input [0:0] control_pppL2_tb_S_AXI_BREADY ;
input [7:0] control_pppL2_tb_S_AXI_ARADDR ;
input [0:0] control_pppL2_tb_S_AXI_ARVALID ;
output [0:0] control_pppL2_tb_S_AXI_ARREADY ;
output [31:0] control_pppL2_tb_S_AXI_RDATA ;
output [1:0] control_pppL2_tb_S_AXI_RRESP ;
output [0:0] control_pppL2_tb_S_AXI_RVALID ;
input [0:0] control_pppL2_tb_S_AXI_RREADY ;
input [7:0] control_extL2_tb_S_AXI_AWADDR ;
input [0:0] control_extL2_tb_S_AXI_AWVALID ;
output [0:0] control_extL2_tb_S_AXI_AWREADY ;
input [31:0] control_extL2_tb_S_AXI_WDATA ;
input [3:0] control_extL2_tb_S_AXI_WSTRB ;
input [0:0] control_extL2_tb_S_AXI_WVALID ;
output [0:0] control_extL2_tb_S_AXI_WREADY ;
output [1:0] control_extL2_tb_S_AXI_BRESP ;
output [0:0] control_extL2_tb_S_AXI_BVALID ;
input [0:0] control_extL2_tb_S_AXI_BREADY ;
input [7:0] control_extL2_tb_S_AXI_ARADDR ;
input [0:0] control_extL2_tb_S_AXI_ARVALID ;
output [0:0] control_extL2_tb_S_AXI_ARREADY ;
output [31:0] control_extL2_tb_S_AXI_RDATA ;
output [1:0] control_extL2_tb_S_AXI_RRESP ;
output [0:0] control_extL2_tb_S_AXI_RVALID ;
input [0:0] control_extL2_tb_S_AXI_RREADY ;
input [0:0] enable_processing ;
output [0:0] packet_out_outstream_TVALID ;
input [0:0] packet_out_outstream_TREADY ;
output [255:0] packet_out_outstream_TDATA ;
output [31:0] packet_out_outstream_TKEEP ;
output [0:0] packet_out_outstream_TLAST ;
output [0:0] tuple_out_flowstream_VALID ;
output [127:0] tuple_out_flowstream_DATA ;
input clk_line_rst ;
input clk_line ;
input clk_packet_rst ;
input clk_packet ;
input clk_control_rst ;
input clk_control ;
output [0:0] internal_rst_done ;

wire [0:0] packet_in_instream_TREADY ;
wire [0:0] control_qinq_tb_S_AXI_AWREADY ;
wire [0:0] control_qinq_tb_S_AXI_WREADY ;
wire [1:0] control_qinq_tb_S_AXI_BRESP ;
wire [0:0] control_qinq_tb_S_AXI_BVALID ;
wire [0:0] control_qinq_tb_S_AXI_ARREADY ;
wire [31:0] control_qinq_tb_S_AXI_RDATA ;
wire [1:0] control_qinq_tb_S_AXI_RRESP ;
wire [0:0] control_qinq_tb_S_AXI_RVALID ;
wire [0:0] control_domain_tb_S_AXI_AWREADY ;
wire [0:0] control_domain_tb_S_AXI_WREADY ;
wire [1:0] control_domain_tb_S_AXI_BRESP ;
wire [0:0] control_domain_tb_S_AXI_BVALID ;
wire [0:0] control_domain_tb_S_AXI_ARREADY ;
wire [31:0] control_domain_tb_S_AXI_RDATA ;
wire [1:0] control_domain_tb_S_AXI_RRESP ;
wire [0:0] control_domain_tb_S_AXI_RVALID ;
wire [0:0] control_l3_tb_S_AXI_AWREADY ;
wire [0:0] control_l3_tb_S_AXI_WREADY ;
wire [1:0] control_l3_tb_S_AXI_BRESP ;
wire [0:0] control_l3_tb_S_AXI_BVALID ;
wire [0:0] control_l3_tb_S_AXI_ARREADY ;
wire [31:0] control_l3_tb_S_AXI_RDATA ;
wire [1:0] control_l3_tb_S_AXI_RRESP ;
wire [0:0] control_l3_tb_S_AXI_RVALID ;
wire [0:0] control_pppL2_tb_S_AXI_AWREADY ;
wire [0:0] control_pppL2_tb_S_AXI_WREADY ;
wire [1:0] control_pppL2_tb_S_AXI_BRESP ;
wire [0:0] control_pppL2_tb_S_AXI_BVALID ;
wire [0:0] control_pppL2_tb_S_AXI_ARREADY ;
wire [31:0] control_pppL2_tb_S_AXI_RDATA ;
wire [1:0] control_pppL2_tb_S_AXI_RRESP ;
wire [0:0] control_pppL2_tb_S_AXI_RVALID ;
wire [0:0] control_extL2_tb_S_AXI_AWREADY ;
wire [0:0] control_extL2_tb_S_AXI_WREADY ;
wire [1:0] control_extL2_tb_S_AXI_BRESP ;
wire [0:0] control_extL2_tb_S_AXI_BVALID ;
wire [0:0] control_extL2_tb_S_AXI_ARREADY ;
wire [31:0] control_extL2_tb_S_AXI_RDATA ;
wire [1:0] control_extL2_tb_S_AXI_RRESP ;
wire [0:0] control_extL2_tb_S_AXI_RVALID ;
wire [0:0] packet_out_outstream_TVALID ;
wire [255:0] packet_out_outstream_TDATA ;
wire [31:0] packet_out_outstream_TKEEP ;
wire [0:0] packet_out_outstream_TLAST ;
wire [0:0] tuple_out_flowstream_VALID ;
wire [127:0] tuple_out_flowstream_DATA ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_VALID ;
wire [25:0] _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_DATA ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_SOF ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_EOF ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_VAL ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_RDY ;
wire [255:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_DAT ;
wire [5:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_CNT ;
wire [0:0] _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_ERR ;
wire [0:0] parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_VALID ;
wire [23:0] parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_VALID ;
wire [23:0] S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_DATA ;
wire [0:0] S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_VALID ;
wire [31:0] S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_DATA ;
wire [0:0] S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_VALID ;
wire [31:0] S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_DATA ;
wire [0:0] get_mac__tuple_out_mac_out_____2__connections_VALID ;
wire [47:0] get_mac__tuple_out_mac_out_____2__connections_DATA ;
wire [0:0] S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_DATA ;
wire [0:0] S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_DATA ;
wire [0:0] l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ;
wire [25:0] l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ;
wire [0:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ;
wire [0:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ;
wire [0:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ;
wire [0:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ;
wire [255:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ;
wire [5:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ;
wire [0:0] l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ;
wire [0:0] l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ;
wire [127:0] l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ;
wire [0:0] _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TVALID ;
wire [0:0] _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TREADY ;
wire [255:0] _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TDATA ;
wire [31:0] _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TKEEP ;
wire [0:0] _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TLAST ;
wire [0:0] qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_VALID ;
wire [1:0] qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_VALID ;
wire [1:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_DATA ;
wire [0:0] parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_VALID ;
wire [25:0] parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_VALID ;
wire [25:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_DATA ;
wire [0:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_SOF ;
wire [0:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_EOF ;
wire [0:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_VAL ;
wire [0:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_RDY ;
wire [255:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_DAT ;
wire [5:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_CNT ;
wire [0:0] parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_ERR ;
wire [0:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_SOF ;
wire [0:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_EOF ;
wire [0:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_VAL ;
wire [0:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_RDY ;
wire [255:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_DAT ;
wire [5:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_CNT ;
wire [0:0] S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_ERR ;
wire [0:0] parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_VALID ;
wire [31:0] parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_DATA ;
wire [0:0] parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_VALID ;
wire [3:0] parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_DATA ;
wire [0:0] parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_VALID ;
wire [199:0] parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_DATA ;
wire [0:0] parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_VALID ;
wire [31:0] parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_DATA ;
wire [0:0] parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_VALID ;
wire [63:0] parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_DATA ;
wire [0:0] qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_VALID ;
wire [25:0] qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_VALID ;
wire [25:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_DATA ;
wire [0:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_SOF ;
wire [0:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_EOF ;
wire [0:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_VAL ;
wire [0:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_RDY ;
wire [255:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_DAT ;
wire [5:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_CNT ;
wire [0:0] qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_ERR ;
wire [0:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_SOF ;
wire [0:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_EOF ;
wire [0:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_VAL ;
wire [0:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_RDY ;
wire [255:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_DAT ;
wire [5:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_CNT ;
wire [0:0] S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_ERR ;
wire [0:0] domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_VALID ;
wire [2:0] domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_VALID ;
wire [2:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_VALID ;
wire [3:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_VALID ;
wire [199:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_DATA ;
wire [0:0] domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_VALID ;
wire [25:0] domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_VALID ;
wire [25:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_DATA ;
wire [0:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_SOF ;
wire [0:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_EOF ;
wire [0:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_VAL ;
wire [0:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_RDY ;
wire [255:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_DAT ;
wire [5:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_CNT ;
wire [0:0] domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_ERR ;
wire [0:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_SOF ;
wire [0:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_EOF ;
wire [0:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_VAL ;
wire [0:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_RDY ;
wire [255:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_DAT ;
wire [5:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_CNT ;
wire [0:0] S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_ERR ;
wire [0:0] domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_VALID ;
wire [3:0] domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_VALID ;
wire [3:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_DATA ;
wire [0:0] l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_VALID ;
wire [115:0] l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_VALID ;
wire [115:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_DATA ;
wire [0:0] l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_VALID ;
wire [48:0] l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_VALID ;
wire [48:0] S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_DATA ;
wire [0:0] l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_VALID ;
wire [3:0] l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_DATA ;
wire [0:0] l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_VALID ;
wire [25:0] l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_DATA ;
wire [0:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_SOF ;
wire [0:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_EOF ;
wire [0:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_VAL ;
wire [0:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_RDY ;
wire [255:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_DAT ;
wire [5:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_CNT ;
wire [0:0] l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_ERR ;
wire [0:0] S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_VALID ;
wire [199:0] S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_DATA ;
wire [0:0] pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_VALID ;
wire [28:0] pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_VALID ;
wire [28:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_DATA ;
wire [0:0] extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_VALID ;
wire [28:0] extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_VALID ;
wire [28:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_DATA ;
wire [0:0] S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_VALID ;
wire [3:0] S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_VALID ;
wire [3:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_DATA ;
wire [0:0] S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_VALID ;
wire [25:0] S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_VALID ;
wire [25:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_DATA ;
wire [0:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_SOF ;
wire [0:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_EOF ;
wire [0:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_VAL ;
wire [0:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_RDY ;
wire [255:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_DAT ;
wire [5:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_CNT ;
wire [0:0] S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_ERR ;
wire [0:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_SOF ;
wire [0:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_EOF ;
wire [0:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_VAL ;
wire [0:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_RDY ;
wire [255:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_DAT ;
wire [5:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_CNT ;
wire [0:0] S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_ERR ;
wire [0:0] S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_VALID ;
wire [63:0] S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_DATA ;
wire [0:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_VALID ;
wire [63:0] S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_VALID ;
wire [31:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_VALID ;
wire [31:0] qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_VALID ;
wire [3:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_DATA ;
wire [0:0] qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_VALID ;
wire [3:0] qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_VALID ;
wire [199:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_DATA ;
wire [0:0] qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_VALID ;
wire [199:0] qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_VALID ;
wire [31:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_DATA ;
wire [0:0] qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_VALID ;
wire [31:0] qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_DATA ;
wire [0:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_VALID ;
wire [63:0] S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_DATA ;
wire [0:0] qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_VALID ;
wire [63:0] qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_VALID ;
wire [31:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_VALID ;
wire [31:0] domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_VALID ;
wire [63:0] S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_DATA ;
wire [0:0] domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_VALID ;
wire [63:0] domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_DATA ;
wire [0:0] domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_VALID ;
wire [199:0] domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_DATA ;
wire [0:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_VALID ;
wire [199:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_DATA ;
wire [0:0] l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_VALID ;
wire [199:0] l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_DATA ;
wire [0:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_VALID ;
wire [63:0] S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_DATA ;
wire [0:0] l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_VALID ;
wire [63:0] l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_DATA ;
wire clk_line_init_done ;
wire clk_line_rst_high ;
wire clk_line_rst_low /* unused */ ;
wire clk_packet_init_done ;
wire clk_packet_rst_high ;
wire clk_packet_rst_low /* unused */ ;
wire clk_control_init_done ;
wire clk_control_rst_high /* unused */ ;
wire clk_control_rst_low ;
wire [0:0] internal_rst_done ;
wire S_SYNCER_for_qinq_ac______IN__BACKPRESSURE ;
reg S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_1 ;
reg S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_2 ;
reg S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_3 ;
wire _source_zero_BACKPRESSURE /* unused */ ;
wire S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE ;
reg S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_1 ;
reg S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_2 ;
reg S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_3 ;
wire S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE ;
reg S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_1 ;
reg S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_2 ;
reg S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_3 ;
wire S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE ;
reg S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_1 ;
reg S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_2 ;
reg S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_3 ;
wire S_SYNCER_for__OUT______l2_ac_BACKPRESSURE ;
reg S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_1 ;
reg S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_2 ;
reg S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_3 ;
wire qinq_ac_____S_SYNCER_for_qinq_ac_BACKPRESSURE ;
wire domain_ac_____S_SYNCER_for_domain_ac_BACKPRESSURE ;
wire l3_ac_____S_SYNCER_for_l3_ac_BACKPRESSURE ;
wire S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE ;
reg S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_1 ;
reg S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_2 ;
reg S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_3 ;
wire l2_ac_____S_SYNCER_for_l2_ac_BACKPRESSURE ;

// black box
S_RESETTER
_RESET_clk_line
(
	.clk                 	( clk_line ),
	.rst                 	( clk_line_rst ),
	.reset_out_active_high	( clk_line_rst_high ),
	.reset_out_active_low	( clk_line_rst_low ),
	.init_done           	( clk_line_init_done )
);

// black box
S_RESETTER
_RESET_clk_packet
(
	.clk                 	( clk_packet ),
	.rst                 	( clk_packet_rst ),
	.reset_out_active_high	( clk_packet_rst_high ),
	.reset_out_active_low	( clk_packet_rst_low ),
	.init_done           	( clk_packet_init_done )
);

// black box
S_RESETTER
_RESET_clk_control
(
	.clk                 	( clk_control ),
	.rst                 	( clk_control_rst ),
	.reset_out_active_high	( clk_control_rst_high ),
	.reset_out_active_low	( clk_control_rst_low ),
	.init_done           	( clk_control_init_done )
);

assign internal_rst_done = ( ( clk_line_init_done && clk_packet_init_done ) && clk_control_init_done ) ;

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_1 <= S_SYNCER_for_qinq_ac______IN__BACKPRESSURE ;
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_2 <= S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_1 ;
		S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_3 <= S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_2 ;
	end
end

assign packet_in_instream_TREADY = ~S_SYNCER_for_qinq_ac______IN__BACKPRESSURE_3 ;

assign _source_zero_BACKPRESSURE = 1'd0 ;

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_1 <= S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE ;
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_2 <= S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_1 ;
		S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_3 <= S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_1 <= S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE ;
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_2 <= S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_1 ;
		S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_3 <= S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_1 <= S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE ;
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_2 <= S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_1 ;
		S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_3 <= S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_1 <= S_SYNCER_for__OUT______l2_ac_BACKPRESSURE ;
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_2 <= S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_1 ;
		S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_3 <= S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_1 <= S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE ;
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_2 <= S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_1 ;
		S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_3 <= S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_2 ;
	end
end

// black box
Parser
parser
(
	.tuple_in_control_VALID	( _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_DATA ),
	.packet_in_SOF       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_SOF ),
	.packet_in_EOF       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_EOF ),
	.packet_in_VAL       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_VAL ),
	.packet_in_RDY       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_RDY ),
	.packet_in_DAT       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_DAT ),
	.packet_in_CNT       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_CNT ),
	.packet_in_ERR       	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_ERR ),
	.tuple_out_qinq_tb_in_VALID	( parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_out_qinq_tb_in_DATA	( parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_DATA ),
	.tuple_out_control_VALID	( parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_VALID ),
	.tuple_out_control_DATA	( parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_DATA ),
	.packet_out_SOF      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_SOF ),
	.packet_out_EOF      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_EOF ),
	.packet_out_VAL      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_VAL ),
	.packet_out_RDY      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_RDY ),
	.packet_out_DAT      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_DAT ),
	.packet_out_CNT      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_CNT ),
	.packet_out_ERR      	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_ERR ),
	.tuple_out_domain_tb_in_VALID	( parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_VALID ),
	.tuple_out_domain_tb_in_DATA	( parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_DATA ),
	.tuple_out_domain_metadata_out_VALID	( parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_VALID ),
	.tuple_out_domain_metadata_out_DATA	( parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_DATA ),
	.tuple_out_metadata_VALID	( parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_VALID ),
	.tuple_out_metadata_DATA	( parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_DATA ),
	.tuple_out_l3_tb_in_VALID	( parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_VALID ),
	.tuple_out_l3_tb_in_DATA	( parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_DATA ),
	.tuple_out_header_metadata_VALID	( parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_VALID ),
	.tuple_out_header_metadata_DATA	( parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_DATA ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
Qinq_table
qinq_tb
(
	.tuple_in_request_VALID	( S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_response_DATA	( qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_DATA ),
	.control_S_AXI_AWADDR	( control_qinq_tb_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_qinq_tb_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_qinq_tb_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_qinq_tb_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_qinq_tb_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_qinq_tb_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_qinq_tb_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_qinq_tb_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_qinq_tb_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_qinq_tb_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_qinq_tb_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_qinq_tb_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_qinq_tb_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_qinq_tb_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_qinq_tb_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_qinq_tb_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_qinq_tb_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.clk_packet          	( clk_packet ),
	.clk_packet_rst_high 	( clk_packet_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
Qinq_action
qinq_ac
(
	.tuple_in_action_in_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_VALID ),
	.tuple_in_action_in_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_DATA ),
	.tuple_in_control_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_ERR ),
	.tuple_out_control_VALID	( qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_control_DATA	( qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_DATA ),
	.packet_out_SOF      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_SOF ),
	.packet_out_EOF      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_EOF ),
	.packet_out_VAL      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_VAL ),
	.packet_out_RDY      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_RDY ),
	.packet_out_DAT      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_DAT ),
	.packet_out_CNT      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_CNT ),
	.packet_out_ERR      	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_ERR ),
	.tuple_in_TUPLE0_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_out_TUPLE0_DATA	( qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_DATA ),
	.tuple_in_TUPLE1_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_VALID ),
	.tuple_out_TUPLE1_DATA	( qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_DATA ),
	.tuple_in_TUPLE2_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_VALID ),
	.tuple_out_TUPLE2_DATA	( qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_DATA ),
	.tuple_in_TUPLE3_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_VALID ),
	.tuple_out_TUPLE3_DATA	( qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE4_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_DATA ),
	.tuple_out_TUPLE4_VALID	( qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_VALID ),
	.tuple_out_TUPLE4_DATA	( qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_DATA ),
	.backpressure_in     	( S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE_3 ),
	.backpressure_out    	( qinq_ac_____S_SYNCER_for_qinq_ac_BACKPRESSURE ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
Domain_table
domain_tb
(
	.tuple_in_request_VALID	( S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_VALID ),
	.tuple_out_response_DATA	( domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_DATA ),
	.control_S_AXI_AWADDR	( control_domain_tb_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_domain_tb_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_domain_tb_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_domain_tb_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_domain_tb_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_domain_tb_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_domain_tb_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_domain_tb_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_domain_tb_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_domain_tb_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_domain_tb_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_domain_tb_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_domain_tb_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_domain_tb_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_domain_tb_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_domain_tb_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_domain_tb_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.clk_packet          	( clk_packet ),
	.clk_packet_rst_high 	( clk_packet_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
Domain_action
domain_ac
(
	.tuple_in_control_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_ERR ),
	.tuple_in_action_in_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_VALID ),
	.tuple_in_action_in_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_DATA ),
	.tuple_in_metadata_in_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_VALID ),
	.tuple_in_metadata_in_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_DATA ),
	.tuple_in_metadata_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_VALID ),
	.tuple_in_metadata_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_DATA ),
	.tuple_out_control_VALID	( domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_control_DATA	( domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_DATA ),
	.packet_out_SOF      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_SOF ),
	.packet_out_EOF      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_EOF ),
	.packet_out_VAL      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_VAL ),
	.packet_out_RDY      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_RDY ),
	.packet_out_DAT      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_DAT ),
	.packet_out_CNT      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_CNT ),
	.packet_out_ERR      	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_ERR ),
	.tuple_out_metadata_out_VALID	( domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_VALID ),
	.tuple_out_metadata_out_DATA	( domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_DATA ),
	.tuple_in_TUPLE0_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_out_TUPLE0_DATA	( domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_DATA ),
	.tuple_in_TUPLE1_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_VALID ),
	.tuple_out_TUPLE1_DATA	( domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE2_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_VALID ),
	.tuple_in_TUPLE2_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_DATA ),
	.tuple_out_TUPLE2_VALID	( domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_VALID ),
	.tuple_out_TUPLE2_DATA	( domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_DATA ),
	.backpressure_in     	( S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE_3 ),
	.backpressure_out    	( domain_ac_____S_SYNCER_for_domain_ac_BACKPRESSURE ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
L3_table
l3_tb
(
	.tuple_in_request_VALID	( S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_VALID ),
	.tuple_out_response_DATA	( l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_DATA ),
	.control_S_AXI_AWADDR	( control_l3_tb_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_l3_tb_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_l3_tb_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_l3_tb_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_l3_tb_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_l3_tb_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_l3_tb_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_l3_tb_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_l3_tb_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_l3_tb_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_l3_tb_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_l3_tb_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_l3_tb_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_l3_tb_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_l3_tb_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_l3_tb_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_l3_tb_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.clk_packet          	( clk_packet ),
	.clk_packet_rst_high 	( clk_packet_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
L3_action
l3_ac
(
	.tuple_in_control_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_ERR ),
	.tuple_in_metadata_in_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_VALID ),
	.tuple_in_metadata_in_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_DATA ),
	.tuple_in_action_in_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_VALID ),
	.tuple_in_action_in_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_DATA ),
	.tuple_out_mac_out_VALID	( l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_VALID ),
	.tuple_out_mac_out_DATA	( l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_DATA ),
	.tuple_out_metadata_out_VALID	( l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_VALID ),
	.tuple_out_metadata_out_DATA	( l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_DATA ),
	.tuple_out_control_VALID	( l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_VALID ),
	.tuple_out_control_DATA	( l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_DATA ),
	.packet_out_SOF      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_SOF ),
	.packet_out_EOF      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_EOF ),
	.packet_out_VAL      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_VAL ),
	.packet_out_RDY      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_RDY ),
	.packet_out_DAT      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_DAT ),
	.packet_out_CNT      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_CNT ),
	.packet_out_ERR      	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_ERR ),
	.tuple_in_TUPLE0_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_VALID ),
	.tuple_out_TUPLE0_DATA	( l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_DATA ),
	.tuple_in_TUPLE1_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_VALID ),
	.tuple_out_TUPLE1_DATA	( l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_DATA ),
	.backpressure_in     	( S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE_3 ),
	.backpressure_out    	( l3_ac_____S_SYNCER_for_l3_ac_BACKPRESSURE ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
Get_MAC
get_mac
(
	.tuple_out_mac_out_VALID	( get_mac__tuple_out_mac_out_____2__connections_VALID ),
	.tuple_out_mac_out_DATA	( get_mac__tuple_out_mac_out_____2__connections_DATA ),
	.tuple_in_l3_mac_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_VALID ),
	.tuple_in_l3_mac_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_DATA ),
	.tuple_in_origin_mac_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_VALID ),
	.tuple_in_origin_mac_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_DATA ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
pppL2_table
pppL2_tb
(
	.tuple_in_request_VALID	( S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_response_DATA	( pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_DATA ),
	.control_S_AXI_AWADDR	( control_pppL2_tb_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_pppL2_tb_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_pppL2_tb_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_pppL2_tb_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_pppL2_tb_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_pppL2_tb_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_pppL2_tb_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_pppL2_tb_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_pppL2_tb_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_pppL2_tb_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_pppL2_tb_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_pppL2_tb_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_pppL2_tb_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_pppL2_tb_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_pppL2_tb_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_pppL2_tb_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_pppL2_tb_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.clk_packet          	( clk_packet ),
	.clk_packet_rst_high 	( clk_packet_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
extL2_table
extL2_tb
(
	.tuple_in_request_VALID	( S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_VALID ),
	.tuple_out_response_DATA	( extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_DATA ),
	.control_S_AXI_AWADDR	( control_extL2_tb_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_extL2_tb_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_extL2_tb_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_extL2_tb_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_extL2_tb_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_extL2_tb_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_extL2_tb_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_extL2_tb_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_extL2_tb_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_extL2_tb_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_extL2_tb_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_extL2_tb_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_extL2_tb_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_extL2_tb_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_extL2_tb_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_extL2_tb_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_extL2_tb_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.clk_packet          	( clk_packet ),
	.clk_packet_rst_high 	( clk_packet_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
L2_action
l2_ac
(
	.tuple_out_control_VALID	( l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ),
	.tuple_out_control_DATA	( l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ),
	.packet_out_SOF      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ),
	.packet_out_EOF      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ),
	.packet_out_VAL      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ),
	.packet_out_RDY      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ),
	.packet_out_DAT      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ),
	.packet_out_CNT      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ),
	.packet_out_ERR      	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ),
	.tuple_out_output_tuple_VALID	( l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ),
	.tuple_out_output_tuple_DATA	( l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ),
	.tuple_in_pppL2_in_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_VALID ),
	.tuple_in_pppL2_in_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_DATA ),
	.tuple_in_extL2_in_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_VALID ),
	.tuple_in_extL2_in_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_DATA ),
	.tuple_in_metadata_in_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_VALID ),
	.tuple_in_metadata_in_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_DATA ),
	.tuple_in_control_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_ERR ),
	.tuple_in_header_metadata_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_VALID ),
	.tuple_in_header_metadata_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_DATA ),
	.backpressure_in     	( S_SYNCER_for__OUT______l2_ac_BACKPRESSURE_3 ),
	.backpressure_out    	( l2_ac_____S_SYNCER_for_l2_ac_BACKPRESSURE ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_PROTOCOL_ADAPTER_INGRESS
_PROTOCOL_ADAPTER_INGRESS
(
	.packet_in_TVALID    	( packet_in_instream_TVALID ),
	.packet_in_TREADY    	(  ),
	.packet_in_TDATA     	( packet_in_instream_TDATA ),
	.packet_in_TKEEP     	( packet_in_instream_TKEEP ),
	.packet_in_TLAST     	( packet_in_instream_TLAST ),
	.tuple_out_control_VALID	( _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_VALID ),
	.tuple_out_control_DATA	( _PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____parser__tuple_in_control_DATA ),
	.packet_out_SOF      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_SOF ),
	.packet_out_EOF      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_EOF ),
	.packet_out_VAL      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_VAL ),
	.packet_out_RDY      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_RDY ),
	.packet_out_DAT      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_DAT ),
	.packet_out_CNT      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_CNT ),
	.packet_out_ERR      	( _PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in__PROTOCOL_ADAPTER_INGRESS__packet_out_____parser__packet_in_ERR ),
	.plain_in_init       	( enable_processing ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_BRIDGER_for_qinq_tb_tuple_in_request
S_BRIDGER_for_qinq_tb_tuple_in_request
(
	.tuple_in_VALID      	( parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( parser__tuple_out_qinq_tb_in_____S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_qinq_tb_tuple_in_request__tuple_out_____qinq_tb__tuple_in_request_DATA ),
	.clk_line            	( clk_line ),
	.clk_packet          	( clk_packet ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_packet_rst_high 	( clk_packet_rst_high )
);

// black box
S_BRIDGER_for_domain_tb_tuple_in_request
S_BRIDGER_for_domain_tb_tuple_in_request
(
	.tuple_out_VALID     	( S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_domain_tb_tuple_in_request__tuple_out_____domain_tb__tuple_in_request_DATA ),
	.tuple_in_VALID      	( qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( qinq_ac__tuple_out_TUPLE0_____S_BRIDGER_for_domain_tb_tuple_in_request__tuple_in_DATA ),
	.clk_line            	( clk_line ),
	.clk_packet          	( clk_packet ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_packet_rst_high 	( clk_packet_rst_high )
);

// black box
S_BRIDGER_for_l3_tb_tuple_in_request
S_BRIDGER_for_l3_tb_tuple_in_request
(
	.tuple_out_VALID     	( S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_l3_tb_tuple_in_request__tuple_out_____l3_tb__tuple_in_request_DATA ),
	.tuple_in_VALID      	( domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( domain_ac__tuple_out_TUPLE0_____S_BRIDGER_for_l3_tb_tuple_in_request__tuple_in_DATA ),
	.clk_line            	( clk_line ),
	.clk_packet          	( clk_packet ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_packet_rst_high 	( clk_packet_rst_high )
);

// black box
S_BRIDGER_for_pppL2_tb_tuple_in_request
S_BRIDGER_for_pppL2_tb_tuple_in_request
(
	.tuple_in_VALID      	( get_mac__tuple_out_mac_out_____2__connections_VALID ),
	.tuple_in_DATA       	( get_mac__tuple_out_mac_out_____2__connections_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_pppL2_tb_tuple_in_request__tuple_out_____pppL2_tb__tuple_in_request_DATA ),
	.clk_line            	( clk_line ),
	.clk_packet          	( clk_packet ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_packet_rst_high 	( clk_packet_rst_high )
);

// black box
S_BRIDGER_for_extL2_tb_tuple_in_request
S_BRIDGER_for_extL2_tb_tuple_in_request
(
	.tuple_in_VALID      	( get_mac__tuple_out_mac_out_____2__connections_VALID ),
	.tuple_in_DATA       	( get_mac__tuple_out_mac_out_____2__connections_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_extL2_tb_tuple_in_request__tuple_out_____extL2_tb__tuple_in_request_DATA ),
	.clk_line            	( clk_line ),
	.clk_packet          	( clk_packet ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_packet_rst_high 	( clk_packet_rst_high )
);

// black box
S_PROTOCOL_ADAPTER_EGRESS
_PROTOCOL_ADAPTER_EGRESS
(
	.tuple_in_control_VALID	( l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( l2_ac__tuple_out_control______PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ),
	.packet_in_SOF       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ),
	.packet_in_EOF       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ),
	.packet_in_VAL       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ),
	.packet_in_RDY       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ),
	.packet_in_DAT       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ),
	.packet_in_CNT       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ),
	.packet_in_ERR       	( l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_l2_ac__packet_out______PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ),
	.packet_out_TVALID   	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TVALID ),
	.packet_out_TREADY   	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TREADY ),
	.packet_out_TDATA    	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TDATA ),
	.packet_out_TKEEP    	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TKEEP ),
	.packet_out_TLAST    	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TLAST ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_SYNCER_for__OUT_
S_SYNCER_for__OUT_
(
	.tuple_in_TUPLE0_VALID	( l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( l2_ac__tuple_out_output_tuple_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( tuple_out_flowstream_VALID ),
	.tuple_out_TUPLE0_DATA	( tuple_out_flowstream_DATA ),
	.packet_in_PACKET1_TVALID	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TVALID ),
	.packet_in_PACKET1_TREADY	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TREADY ),
	.packet_in_PACKET1_TDATA	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TDATA ),
	.packet_in_PACKET1_TKEEP	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TKEEP ),
	.packet_in_PACKET1_TLAST	( _PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1__PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET1_TLAST ),
	.packet_out_PACKET1_TVALID	( packet_out_outstream_TVALID ),
	.packet_out_PACKET1_TREADY	( packet_out_outstream_TREADY ),
	.packet_out_PACKET1_TDATA	( packet_out_outstream_TDATA ),
	.packet_out_PACKET1_TKEEP	( packet_out_outstream_TKEEP ),
	.packet_out_PACKET1_TLAST	( packet_out_outstream_TLAST ),
	.backpressure_in     	( ~packet_out_outstream_TREADY ),
	.backpressure_out    	( S_SYNCER_for__OUT______l2_ac_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_qinq_ac
S_SYNCER_for_qinq_ac
(
	.tuple_in_TUPLE0_VALID	( qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( qinq_tb__tuple_out_response_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE0_____qinq_ac__tuple_in_action_in_DATA ),
	.tuple_in_TUPLE1_VALID	( parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( parser__tuple_out_control_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE1_____qinq_ac__tuple_in_control_DATA ),
	.packet_in_PACKET2_SOF	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_SOF ),
	.packet_in_PACKET2_EOF	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_EOF ),
	.packet_in_PACKET2_VAL	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_VAL ),
	.packet_in_PACKET2_RDY	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_RDY ),
	.packet_in_PACKET2_DAT	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_DAT ),
	.packet_in_PACKET2_CNT	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_CNT ),
	.packet_in_PACKET2_ERR	( parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_parser__packet_out_____S_SYNCER_for_qinq_ac__packet_in_PACKET2_ERR ),
	.packet_out_PACKET2_SOF	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_SOF ),
	.packet_out_PACKET2_EOF	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_EOF ),
	.packet_out_PACKET2_VAL	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_VAL ),
	.packet_out_PACKET2_RDY	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_RDY ),
	.packet_out_PACKET2_DAT	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_DAT ),
	.packet_out_PACKET2_CNT	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_CNT ),
	.packet_out_PACKET2_ERR	( S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_S_SYNCER_for_qinq_ac__packet_out_PACKET2_____qinq_ac__packet_in_ERR ),
	.tuple_in_TUPLE3_VALID	( parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( parser__tuple_out_domain_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE3_DATA ),
	.tuple_in_TUPLE4_VALID	( parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( parser__tuple_out_domain_metadata_out_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE4_DATA ),
	.tuple_in_TUPLE5_VALID	( parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( parser__tuple_out_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE6_VALID	( parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_VALID ),
	.tuple_in_TUPLE6_DATA	( parser__tuple_out_l3_tb_in_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE6_DATA ),
	.tuple_in_TUPLE8_VALID	( parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_VALID ),
	.tuple_in_TUPLE8_DATA	( parser__tuple_out_header_metadata_____S_SYNCER_for_qinq_ac__tuple_in_TUPLE8_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE3_____qinq_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE4_____qinq_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE5_____qinq_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE6_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_VALID ),
	.tuple_out_TUPLE6_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE6_____qinq_ac__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE8_VALID	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_VALID ),
	.tuple_out_TUPLE8_DATA	( S_SYNCER_for_qinq_ac__tuple_out_TUPLE8_____qinq_ac__tuple_in_TUPLE4_DATA ),
	.backpressure_in     	( qinq_ac_____S_SYNCER_for_qinq_ac_BACKPRESSURE ),
	.backpressure_out    	( S_SYNCER_for_qinq_ac______IN__BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_packet ),
	.rst_in_1            	( clk_packet_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high ),
	.clk_in_6            	( clk_line ),
	.rst_in_6            	( clk_line_rst_high ),
	.clk_out_6           	( clk_line ),
	.rst_out_6           	( clk_line_rst_high ),
	.clk_in_7            	( clk_line ),
	.rst_in_7            	( clk_line_rst_high ),
	.clk_out_7           	( clk_line ),
	.rst_out_7           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_domain_ac
S_SYNCER_for_domain_ac
(
	.tuple_in_TUPLE0_VALID	( qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( qinq_ac__tuple_out_control_____S_SYNCER_for_domain_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE0_____domain_ac__tuple_in_control_DATA ),
	.packet_in_PACKET1_SOF	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_SOF ),
	.packet_in_PACKET1_EOF	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_EOF ),
	.packet_in_PACKET1_VAL	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_VAL ),
	.packet_in_PACKET1_RDY	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_RDY ),
	.packet_in_PACKET1_DAT	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_DAT ),
	.packet_in_PACKET1_CNT	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_CNT ),
	.packet_in_PACKET1_ERR	( qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_qinq_ac__packet_out_____S_SYNCER_for_domain_ac__packet_in_PACKET1_ERR ),
	.packet_out_PACKET1_SOF	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_SOF ),
	.packet_out_PACKET1_EOF	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_EOF ),
	.packet_out_PACKET1_VAL	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_VAL ),
	.packet_out_PACKET1_RDY	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_RDY ),
	.packet_out_PACKET1_DAT	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_DAT ),
	.packet_out_PACKET1_CNT	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_CNT ),
	.packet_out_PACKET1_ERR	( S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_S_SYNCER_for_domain_ac__packet_out_PACKET1_____domain_ac__packet_in_ERR ),
	.tuple_in_TUPLE2_VALID	( domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( domain_tb__tuple_out_response_____S_SYNCER_for_domain_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE2_____domain_ac__tuple_in_action_in_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE3_____domain_ac__tuple_in_metadata_in_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE4_____2__connections_DATA ),
	.tuple_in_TUPLE3_VALID	( qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( qinq_ac__tuple_out_TUPLE1_____S_SYNCER_for_domain_ac__tuple_in_TUPLE3_DATA ),
	.tuple_in_TUPLE4_VALID	( qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( qinq_ac__tuple_out_TUPLE2_____S_SYNCER_for_domain_ac__tuple_in_TUPLE4_DATA ),
	.tuple_in_TUPLE5_VALID	( qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( qinq_ac__tuple_out_TUPLE3_____S_SYNCER_for_domain_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE7_VALID	( qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_VALID ),
	.tuple_in_TUPLE7_DATA	( qinq_ac__tuple_out_TUPLE4_____S_SYNCER_for_domain_ac__tuple_in_TUPLE7_DATA ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE5_____domain_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE7_VALID	( S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_VALID ),
	.tuple_out_TUPLE7_DATA	( S_SYNCER_for_domain_ac__tuple_out_TUPLE7_____domain_ac__tuple_in_TUPLE1_DATA ),
	.backpressure_in     	( domain_ac_____S_SYNCER_for_domain_ac_BACKPRESSURE ),
	.backpressure_out    	( S_SYNCER_for_domain_ac_____qinq_ac_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_packet ),
	.rst_in_2            	( clk_packet_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high ),
	.clk_in_6            	( clk_line ),
	.rst_in_6            	( clk_line_rst_high ),
	.clk_out_6           	( clk_line ),
	.rst_out_6           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_l3_ac
S_SYNCER_for_l3_ac
(
	.tuple_in_TUPLE0_VALID	( domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( domain_ac__tuple_out_control_____S_SYNCER_for_l3_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE0_____l3_ac__tuple_in_control_DATA ),
	.packet_in_PACKET1_SOF	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_SOF ),
	.packet_in_PACKET1_EOF	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_EOF ),
	.packet_in_PACKET1_VAL	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_VAL ),
	.packet_in_PACKET1_RDY	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_RDY ),
	.packet_in_PACKET1_DAT	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_DAT ),
	.packet_in_PACKET1_CNT	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_CNT ),
	.packet_in_PACKET1_ERR	( domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_domain_ac__packet_out_____S_SYNCER_for_l3_ac__packet_in_PACKET1_ERR ),
	.packet_out_PACKET1_SOF	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_SOF ),
	.packet_out_PACKET1_EOF	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_EOF ),
	.packet_out_PACKET1_VAL	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_VAL ),
	.packet_out_PACKET1_RDY	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_RDY ),
	.packet_out_PACKET1_DAT	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_DAT ),
	.packet_out_PACKET1_CNT	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_CNT ),
	.packet_out_PACKET1_ERR	( S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_S_SYNCER_for_l3_ac__packet_out_PACKET1_____l3_ac__packet_in_ERR ),
	.tuple_in_TUPLE2_VALID	( domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( domain_ac__tuple_out_metadata_out_____S_SYNCER_for_l3_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE2_____l3_ac__tuple_in_metadata_in_DATA ),
	.tuple_in_TUPLE3_VALID	( l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( l3_tb__tuple_out_response_____S_SYNCER_for_l3_ac__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE3_____l3_ac__tuple_in_action_in_DATA ),
	.tuple_in_TUPLE5_VALID	( domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( domain_ac__tuple_out_TUPLE1_____S_SYNCER_for_l3_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE4_VALID	( domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( domain_ac__tuple_out_TUPLE2_____S_SYNCER_for_l3_ac__tuple_in_TUPLE4_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE4_____l3_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_l3_ac__tuple_out_TUPLE5_____l3_ac__tuple_in_TUPLE1_DATA ),
	.backpressure_in     	( l3_ac_____S_SYNCER_for_l3_ac_BACKPRESSURE ),
	.backpressure_out    	( S_SYNCER_for_l3_ac_____domain_ac_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_packet ),
	.rst_in_3            	( clk_packet_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_get_mac
S_SYNCER_for_get_mac
(
	.tuple_in_TUPLE0_VALID	( l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( l3_ac__tuple_out_mac_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE0_____get_mac__tuple_in_l3_mac_DATA ),
	.tuple_in_TUPLE1_VALID	( l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( l3_ac__tuple_out_metadata_out_____S_SYNCER_for_get_mac__tuple_in_TUPLE1_DATA ),
	.tuple_in_TUPLE2_VALID	( l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( l3_ac__tuple_out_control_____S_SYNCER_for_get_mac__tuple_in_TUPLE2_DATA ),
	.packet_in_PACKET3_SOF	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_SOF ),
	.packet_in_PACKET3_EOF	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_EOF ),
	.packet_in_PACKET3_VAL	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_VAL ),
	.packet_in_PACKET3_RDY	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_RDY ),
	.packet_in_PACKET3_DAT	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_DAT ),
	.packet_in_PACKET3_CNT	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_CNT ),
	.packet_in_PACKET3_ERR	( l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_l3_ac__packet_out_____S_SYNCER_for_get_mac__packet_in_PACKET3_ERR ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE4_____get_mac__tuple_in_origin_mac_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_DATA ),
	.packet_out_PACKET3_SOF	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_SOF ),
	.packet_out_PACKET3_EOF	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_EOF ),
	.packet_out_PACKET3_VAL	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_VAL ),
	.packet_out_PACKET3_RDY	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_RDY ),
	.packet_out_PACKET3_DAT	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_DAT ),
	.packet_out_PACKET3_CNT	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_CNT ),
	.packet_out_PACKET3_ERR	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_ERR ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_DATA ),
	.tuple_in_TUPLE4_VALID	( l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( l3_ac__tuple_out_TUPLE0_____S_SYNCER_for_get_mac__tuple_in_TUPLE4_DATA ),
	.tuple_in_TUPLE5_VALID	( l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( l3_ac__tuple_out_TUPLE1_____S_SYNCER_for_get_mac__tuple_in_TUPLE5_DATA ),
	.backpressure_in     	( S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE_3 ),
	.backpressure_out    	( S_SYNCER_for_get_mac_____l3_ac_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_l2_ac
S_SYNCER_for_l2_ac
(
	.tuple_in_TUPLE0_VALID	( pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( pppL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE0_____l2_ac__tuple_in_pppL2_in_DATA ),
	.tuple_in_TUPLE1_VALID	( extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( extL2_tb__tuple_out_response_____S_SYNCER_for_l2_ac__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE1_____l2_ac__tuple_in_extL2_in_DATA ),
	.tuple_in_TUPLE2_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE1_____S_SYNCER_for_l2_ac__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE2_____l2_ac__tuple_in_metadata_in_DATA ),
	.tuple_in_TUPLE3_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE2_____S_SYNCER_for_l2_ac__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE3_____l2_ac__tuple_in_control_DATA ),
	.packet_in_PACKET4_SOF	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_SOF ),
	.packet_in_PACKET4_EOF	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_EOF ),
	.packet_in_PACKET4_VAL	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_VAL ),
	.packet_in_PACKET4_RDY	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_RDY ),
	.packet_in_PACKET4_DAT	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_DAT ),
	.packet_in_PACKET4_CNT	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_CNT ),
	.packet_in_PACKET4_ERR	( S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_S_SYNCER_for_get_mac__packet_out_PACKET3_____S_SYNCER_for_l2_ac__packet_in_PACKET4_ERR ),
	.packet_out_PACKET4_SOF	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_SOF ),
	.packet_out_PACKET4_EOF	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_EOF ),
	.packet_out_PACKET4_VAL	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_VAL ),
	.packet_out_PACKET4_RDY	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_RDY ),
	.packet_out_PACKET4_DAT	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_DAT ),
	.packet_out_PACKET4_CNT	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_CNT ),
	.packet_out_PACKET4_ERR	( S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_S_SYNCER_for_l2_ac__packet_out_PACKET4_____l2_ac__packet_in_ERR ),
	.tuple_in_TUPLE5_VALID	( S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( S_SYNCER_for_get_mac__tuple_out_TUPLE5_____S_SYNCER_for_l2_ac__tuple_in_TUPLE5_DATA ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_l2_ac__tuple_out_TUPLE5_____l2_ac__tuple_in_header_metadata_DATA ),
	.backpressure_in     	( l2_ac_____S_SYNCER_for_l2_ac_BACKPRESSURE ),
	.backpressure_out    	( S_SYNCER_for_l2_ac_____S_SYNCER_for_get_mac_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_packet ),
	.rst_in_1            	( clk_packet_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_packet ),
	.rst_in_2            	( clk_packet_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:46
// by Barista HDL generation library, version TRUNK @ 1007984


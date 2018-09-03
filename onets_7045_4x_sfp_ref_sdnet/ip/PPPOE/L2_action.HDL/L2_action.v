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

 tx latency = 10 (cycles)
 min latency = 64 (cycles)
 max latency = 176 (cycles)

input/output tuple 'control'
	section 4-bit field @ [25:22]
	activeBank 1-bit field @ [21:21]
	offset 17-bit field @ [20:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

input tuple 'extL2_in'
	extL2_tb_list 3-bit field @ [28:26]
	port 2-bit field @ [25:24]
	svid 12-bit field @ [23:12]
	cvid 12-bit field @ [11:0]

input tuple 'pppL2_in'
	pppL2_tb_list 3-bit field @ [28:26]
	port 2-bit field @ [25:24]
	svid 12-bit field @ [23:12]
	cvid 12-bit field @ [11:0]

input tuple 'metadata_in'
	drop 1-bit field @ [3:3]
	L3 1-bit field @ [2:2]
	pppL2 1-bit field @ [1:1]
	extL2 1-bit field @ [0:0]

input tuple 'header_metadata'
	pkt_len 16-bit field @ [63:48]
	src_port 8-bit field @ [47:40]
	dst_port 8-bit field @ [39:32]
	pad 32-bit field @ [31:0]

output tuple 'output_tuple'
	pad 96-bit field @ [127:32]
	dst_port 8-bit field @ [31:24]
	src_port 8-bit field @ [23:16]
	pkt_len 16-bit field @ [15:0]

internal tuple 'l2_tuple'
	drop 1-bit field @ [29:29]
	L2_tb_list 3-bit field @ [28:26]
	port 2-bit field @ [25:24]
	svid 12-bit field @ [23:12]
	cvid 12-bit field @ [11:0]

*/

`timescale 1 ps / 1 ps

module L2_action (
	rst,
	clk_line,
	packet_in_RDY,
	packet_in_VAL,
	packet_in_SOF,
	packet_in_EOF,
	packet_in_ERR,
	packet_in_CNT,
	packet_in_DAT,
	tuple_in_control_VALID,
	tuple_in_control_DATA,
	tuple_in_extL2_in_VALID,
	tuple_in_extL2_in_DATA,
	tuple_in_pppL2_in_VALID,
	tuple_in_pppL2_in_DATA,
	tuple_in_metadata_in_VALID,
	tuple_in_metadata_in_DATA,
	tuple_in_header_metadata_VALID,
	tuple_in_header_metadata_DATA,
	packet_out_RDY,
	packet_out_VAL,
	packet_out_SOF,
	packet_out_EOF,
	packet_out_ERR,
	packet_out_CNT,
	packet_out_DAT,
	tuple_out_control_VALID,
	tuple_out_control_DATA,
	tuple_out_output_tuple_VALID,
	tuple_out_output_tuple_DATA,
	backpressure_in,
	backpressure_out
);

input rst ;
input clk_line ;
output packet_in_RDY ;
input packet_in_VAL ;
input packet_in_SOF ;
input packet_in_EOF ;
input packet_in_ERR ;
input [5:0] packet_in_CNT ;
input [255:0] packet_in_DAT ;
input tuple_in_control_VALID ;
input [25:0] tuple_in_control_DATA ;
input tuple_in_extL2_in_VALID /* unused */ ;
input [28:0] tuple_in_extL2_in_DATA ;
input tuple_in_pppL2_in_VALID /* unused */ ;
input [28:0] tuple_in_pppL2_in_DATA ;
input tuple_in_metadata_in_VALID /* unused */ ;
input [3:0] tuple_in_metadata_in_DATA ;
input tuple_in_header_metadata_VALID /* unused */ ;
input [63:0] tuple_in_header_metadata_DATA ;
input packet_out_RDY /* unused */ ;
output packet_out_VAL ;
output packet_out_SOF ;
output packet_out_EOF ;
output packet_out_ERR ;
output [5:0] packet_out_CNT ;
output [255:0] packet_out_DAT ;
output tuple_out_control_VALID ;
output [25:0] tuple_out_control_DATA ;
output tuple_out_output_tuple_VALID ;
output [127:0] tuple_out_output_tuple_DATA ;
input backpressure_in ;
output backpressure_out ;

wire packet_in_RDY ;
wire tuple_in_valid ;
reg [25:0] tuple_in_control_i ;
wire [28:0] tuple_in_extL2_in ;
wire [28:0] tuple_in_pppL2_in ;
wire [3:0] tuple_in_metadata_in ;
wire [63:0] tuple_in_header_metadata ;
wire packet_out_VAL ;
wire packet_out_SOF ;
wire packet_out_EOF ;
wire packet_out_ERR ;
wire [5:0] packet_out_CNT ;
wire [255:0] packet_out_DAT ;
wire tuple_out_control_VALID ;
wire tuple_out_valid ;
reg [25:0] tuple_out_control_DATA ;
wire [25:0] tuple_out_control_i ;
wire tuple_out_output_tuple_VALID ;
wire [127:0] tuple_out_output_tuple_DATA ;
wire [127:0] tuple_out_output_tuple ;
wire backpressure_out ;
wire RX_PKT_RDY ;
wire TX_PKT_RDY_i ;

assign tuple_in_valid = tuple_in_control_VALID ;

always @* begin
	tuple_in_control_i = tuple_in_control_DATA ;
	if ( ( ( tuple_in_control_DATA[3] == 0 ) && ( tuple_in_control_DATA[2:0] == 0 ) ) ) begin
		tuple_in_control_i[25:22] = 1 ;
	end
end

assign tuple_in_extL2_in = tuple_in_extL2_in_DATA ;

assign tuple_in_pppL2_in = tuple_in_pppL2_in_DATA ;

assign tuple_in_metadata_in = tuple_in_metadata_in_DATA ;

assign tuple_in_header_metadata = tuple_in_header_metadata_DATA ;

assign tuple_out_control_VALID = tuple_out_valid ;

always @* begin
	tuple_out_control_DATA = tuple_out_control_i ;
	tuple_out_control_DATA[3] = 0 ;
	tuple_out_control_DATA[25:22] = 0 ;
	tuple_out_control_DATA[20:4] = 0 ;
	if ( ( tuple_out_control_i[2:0] == 0 ) ) begin
		if ( ( ( tuple_out_control_i[3] == 0 ) || ( tuple_out_control_i[25:22] != 0 ) ) ) begin
			tuple_out_control_DATA[2:0] = 1 ;
		end
	end
end

assign tuple_out_output_tuple_VALID = tuple_out_valid ;

assign tuple_out_output_tuple_DATA = tuple_out_output_tuple ;

assign packet_in_RDY = RX_PKT_RDY ;

assign backpressure_out = ~RX_PKT_RDY ;

assign TX_PKT_RDY_i = ~backpressure_in ;

L2_action_Engine
L2_action_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	( tuple_out_control_i ),
	.RX_TUPLE_extL2_in   	( tuple_in_extL2_in ),
	.RX_TUPLE_pppL2_in   	( tuple_in_pppL2_in ),
	.RX_TUPLE_metadata_in	( tuple_in_metadata_in ),
	.RX_TUPLE_header_metadata	( tuple_in_header_metadata ),
	.TX_TUPLE_output_tuple	( tuple_out_output_tuple ),
	.RX_PKT_RDY          	( RX_PKT_RDY ),
	.TX_PKT_RDY          	( TX_PKT_RDY_i ),
	.RX_PKT_VLD          	( packet_in_VAL ),
	.RX_PKT_SOP          	( packet_in_SOF ),
	.RX_PKT_EOP          	( packet_in_EOF ),
	.RX_PKT_ERR          	( packet_in_ERR ),
	.RX_PKT_CNT          	( packet_in_CNT ),
	.RX_PKT_DAT          	( packet_in_DAT ),
	.TX_PKT_VLD          	( packet_out_VAL ),
	.TX_PKT_SOP          	( packet_out_SOF ),
	.TX_PKT_EOP          	( packet_out_EOF ),
	.TX_PKT_ERR          	( packet_out_ERR ),
	.TX_PKT_CNT          	( packet_out_CNT ),
	.TX_PKT_DAT          	( packet_out_DAT )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:40
// by Barista HDL generation library, version TRUNK @ 1007984


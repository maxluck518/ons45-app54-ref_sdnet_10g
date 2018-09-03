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

 tx latency = 37 (cycles)
 min latency = 36 (cycles)
 max latency = 36 (cycles)

input/output tuple 'control'
	section 4-bit field @ [25:22]
	activeBank 1-bit field @ [21:21]
	offset 17-bit field @ [20:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

output tuple 'metadata'
	eth_smac 48-bit field @ [199:152]
	eth_dmac 48-bit field @ [151:104]
	eth_type 16-bit field @ [103:88]
	sa 32-bit field @ [87:56]
	da 32-bit field @ [55:24]
	proto 8-bit field @ [23:16]
	ipv4_length 16-bit field @ [15:0]

output tuple 'header_metadata'
	pkt_len 16-bit field @ [63:48]
	src_port 8-bit field @ [47:40]
	dst_port 8-bit field @ [39:32]
	pad 32-bit field @ [31:0]

output tuple 'domain_metadata_out'
	drop 1-bit field @ [3:3]
	L3 1-bit field @ [2:2]
	pppL2 1-bit field @ [1:1]
	extL2 1-bit field @ [0:0]

output tuple 'qinq_tb_in'
	eth_type 16-bit field @ [23:8]
	pppoe_dis_code 8-bit field @ [7:0]

output tuple 'domain_tb_in'
	eth_type 16-bit field @ [31:16]
	ppp_protocol 16-bit field @ [15:0]

output tuple 'l3_tb_in'
	dst_ip 32-bit field @ [31:0]

*/

`timescale 1 ps / 1 ps

module Parser (
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
	packet_out_RDY,
	packet_out_VAL,
	packet_out_SOF,
	packet_out_EOF,
	packet_out_ERR,
	packet_out_CNT,
	packet_out_DAT,
	tuple_out_control_VALID,
	tuple_out_control_DATA,
	tuple_out_metadata_VALID,
	tuple_out_metadata_DATA,
	tuple_out_header_metadata_VALID,
	tuple_out_header_metadata_DATA,
	tuple_out_domain_metadata_out_VALID,
	tuple_out_domain_metadata_out_DATA,
	tuple_out_qinq_tb_in_VALID,
	tuple_out_qinq_tb_in_DATA,
	tuple_out_domain_tb_in_VALID,
	tuple_out_domain_tb_in_DATA,
	tuple_out_l3_tb_in_VALID,
	tuple_out_l3_tb_in_DATA
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
input packet_out_RDY /* unused */ ;
output packet_out_VAL ;
output packet_out_SOF ;
output packet_out_EOF ;
output packet_out_ERR ;
output [5:0] packet_out_CNT ;
output [255:0] packet_out_DAT ;
output tuple_out_control_VALID ;
output [25:0] tuple_out_control_DATA ;
output tuple_out_metadata_VALID ;
output [199:0] tuple_out_metadata_DATA ;
output tuple_out_header_metadata_VALID ;
output [63:0] tuple_out_header_metadata_DATA ;
output tuple_out_domain_metadata_out_VALID ;
output [3:0] tuple_out_domain_metadata_out_DATA ;
output tuple_out_qinq_tb_in_VALID ;
output [23:0] tuple_out_qinq_tb_in_DATA ;
output tuple_out_domain_tb_in_VALID ;
output [31:0] tuple_out_domain_tb_in_DATA ;
output tuple_out_l3_tb_in_VALID ;
output [31:0] tuple_out_l3_tb_in_DATA ;

wire packet_in_RDY ;
wire tuple_in_valid ;
reg [25:0] tuple_in_control_i ;
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
wire tuple_out_metadata_VALID ;
wire [199:0] tuple_out_metadata_DATA ;
wire [199:0] tuple_out_metadata ;
wire tuple_out_header_metadata_VALID ;
wire [63:0] tuple_out_header_metadata_DATA ;
wire [63:0] tuple_out_header_metadata ;
wire tuple_out_domain_metadata_out_VALID ;
wire [3:0] tuple_out_domain_metadata_out_DATA ;
wire [3:0] tuple_out_domain_metadata_out ;
wire tuple_out_qinq_tb_in_VALID ;
wire [23:0] tuple_out_qinq_tb_in_DATA ;
wire [23:0] tuple_out_qinq_tb_in ;
wire tuple_out_domain_tb_in_VALID ;
wire [31:0] tuple_out_domain_tb_in_DATA ;
wire [31:0] tuple_out_domain_tb_in ;
wire tuple_out_l3_tb_in_VALID ;
wire [31:0] tuple_out_l3_tb_in_DATA ;
wire [31:0] tuple_out_l3_tb_in ;

assign tuple_in_valid = tuple_in_control_VALID ;

always @* begin
	tuple_in_control_i = tuple_in_control_DATA ;
	if ( ( ( tuple_in_control_DATA[3] == 0 ) && ( tuple_in_control_DATA[2:0] == 0 ) ) ) begin
		tuple_in_control_i[25:22] = 1 ;
	end
end

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

assign tuple_out_metadata_VALID = tuple_out_valid ;

assign tuple_out_metadata_DATA = tuple_out_metadata ;

assign tuple_out_header_metadata_VALID = tuple_out_valid ;

assign tuple_out_header_metadata_DATA = tuple_out_header_metadata ;

assign tuple_out_domain_metadata_out_VALID = tuple_out_valid ;

assign tuple_out_domain_metadata_out_DATA = tuple_out_domain_metadata_out ;

assign tuple_out_qinq_tb_in_VALID = tuple_out_valid ;

assign tuple_out_qinq_tb_in_DATA = tuple_out_qinq_tb_in ;

assign tuple_out_domain_tb_in_VALID = tuple_out_valid ;

assign tuple_out_domain_tb_in_DATA = tuple_out_domain_tb_in ;

assign tuple_out_l3_tb_in_VALID = tuple_out_valid ;

assign tuple_out_l3_tb_in_DATA = tuple_out_l3_tb_in ;

Parser_Engine
Parser_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	( tuple_out_control_i ),
	.TX_TUPLE_metadata   	( tuple_out_metadata ),
	.TX_TUPLE_header_metadata	( tuple_out_header_metadata ),
	.TX_TUPLE_domain_metadata_out	( tuple_out_domain_metadata_out ),
	.TX_TUPLE_qinq_tb_in 	( tuple_out_qinq_tb_in ),
	.TX_TUPLE_domain_tb_in	( tuple_out_domain_tb_in ),
	.TX_TUPLE_l3_tb_in   	( tuple_out_l3_tb_in ),
	.RX_PKT_RDY          	( packet_in_RDY ),
	.TX_PKT_RDY          	( 1'd1 ),
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
// File created on 2017/07/31 12:13:38
// by Barista HDL generation library, version TRUNK @ 1007984


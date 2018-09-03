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

 tx latency = 7 (cycles)
 min latency = 6 (cycles)
 max latency = 6 (cycles)

input/output tuple 'control'
	section 4-bit field @ [25:22]
	activeBank 1-bit field @ [21:21]
	offset 17-bit field @ [20:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

input tuple 'l3_mac'
	hit 1-bit field @ [48:48]
	dmac 48-bit field @ [47:0]

input tuple 'origin_mac'
	eth_smac 48-bit field @ [199:152]
	eth_dmac 48-bit field @ [151:104]
	eth_type 16-bit field @ [103:88]
	sa 32-bit field @ [87:56]
	da 32-bit field @ [55:24]
	proto 8-bit field @ [23:16]
	ipv4_length 16-bit field @ [15:0]

output tuple 'mac_out'
	dmac 48-bit field @ [47:0]

*/

`timescale 1 ps / 1 ps

module Get_MAC (
	rst,
	clk_line,
	tuple_in_l3_mac_VALID,
	tuple_in_l3_mac_DATA,
	tuple_in_origin_mac_VALID,
	tuple_in_origin_mac_DATA,
	tuple_out_mac_out_VALID,
	tuple_out_mac_out_DATA
);

input rst ;
input clk_line ;
input tuple_in_l3_mac_VALID ;
input [48:0] tuple_in_l3_mac_DATA ;
input tuple_in_origin_mac_VALID /* unused */ ;
input [199:0] tuple_in_origin_mac_DATA ;
output tuple_out_mac_out_VALID ;
output [47:0] tuple_out_mac_out_DATA ;

wire [25:0] tuple_in_control_DATA ;
wire tuple_in_valid ;
reg [25:0] tuple_in_control_i ;
wire [48:0] tuple_in_l3_mac ;
wire [199:0] tuple_in_origin_mac ;
wire tuple_out_valid ;
wire tuple_out_mac_out_VALID ;
wire [47:0] tuple_out_mac_out_DATA ;
wire [47:0] tuple_out_mac_out ;

assign tuple_in_control_DATA = 0 ;

assign tuple_in_valid = tuple_in_l3_mac_VALID ;

always @* begin
	tuple_in_control_i = tuple_in_control_DATA ;
	if ( ( ( tuple_in_control_DATA[3] == 0 ) && ( tuple_in_control_DATA[2:0] == 0 ) ) ) begin
		tuple_in_control_i[25:22] = 1 ;
	end
end

assign tuple_in_l3_mac = tuple_in_l3_mac_DATA ;

assign tuple_in_origin_mac = tuple_in_origin_mac_DATA ;

assign tuple_out_mac_out_VALID = tuple_out_valid ;

assign tuple_out_mac_out_DATA = tuple_out_mac_out ;

Get_MAC_Engine
Get_MAC_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	(  ),
	.RX_TUPLE_l3_mac     	( tuple_in_l3_mac ),
	.RX_TUPLE_origin_mac 	( tuple_in_origin_mac ),
	.TX_TUPLE_mac_out    	( tuple_out_mac_out ),
	.RX_PKT_RDY          	(  ),
	.TX_PKT_RDY          	( 1'd1 ),
	.RX_PKT_VLD          	( tuple_in_valid ),
	.RX_PKT_SOP          	( tuple_in_valid ),
	.RX_PKT_EOP          	( tuple_in_valid ),
	.RX_PKT_ERR          	( 1'b0 ),
	.RX_PKT_CNT          	( 1'b0 ),
	.RX_PKT_DAT          	( 8'b0 ),
	.TX_PKT_VLD          	(  ),
	.TX_PKT_SOP          	(  ),
	.TX_PKT_EOP          	(  ),
	.TX_PKT_ERR          	(  ),
	.TX_PKT_CNT          	(  ),
	.TX_PKT_DAT          	(  )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:40
// by Barista HDL generation library, version TRUNK @ 1007984


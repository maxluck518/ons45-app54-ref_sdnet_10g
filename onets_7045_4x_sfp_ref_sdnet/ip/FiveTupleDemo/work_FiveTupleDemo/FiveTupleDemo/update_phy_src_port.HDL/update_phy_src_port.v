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
// Xilinx SDNet Compiler version 2017.4, build 2093981
//----------------------------------------------------------------------------
/*

 tx latency = 9 (cycles)
 min latency = 8 (cycles)
 max latency = 8 (cycles)

input/output tuple 'control'
	section 3-bit field @ [21:19]
	activeBank 1-bit field @ [18:18]
	offset 14-bit field @ [17:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

input/output tuple 'fields'
	phy_src_port 8-bit field @ [111:104]
	sa 32-bit field @ [103:72]
	da 32-bit field @ [71:40]
	proto 8-bit field @ [39:32]
	sp 16-bit field @ [31:16]
	dp 16-bit field @ [15:0]

input tuple 'metadata'
	pad 96-bit field @ [127:32]
	phy_dst_port 8-bit field @ [31:24]
	phy_src_port 8-bit field @ [23:16]
	pktlen 16-bit field @ [15:0]

*/

`timescale 1 ps / 1 ps

module update_phy_src_port (
	rst,
	clk_line,
	tuple_in_fields_VALID,
	tuple_in_fields_DATA,
	tuple_in_metadata_VALID,
	tuple_in_metadata_DATA,
	tuple_out_fields_VALID,
	tuple_out_fields_DATA
);

input rst ;
input clk_line ;
input tuple_in_fields_VALID ;
input [111:0] tuple_in_fields_DATA ;
input tuple_in_metadata_VALID /* unused */ ;
input [127:0] tuple_in_metadata_DATA ;
output tuple_out_fields_VALID ;
output [111:0] tuple_out_fields_DATA ;

wire [21:0] tuple_in_control_DATA ;
wire tuple_in_valid ;
reg [21:0] tuple_in_control_i ;
wire [111:0] tuple_in_fields ;
wire [127:0] tuple_in_metadata ;
wire tuple_out_valid ;
wire tuple_out_fields_VALID ;
wire [111:0] tuple_out_fields_DATA ;
wire [111:0] tuple_out_fields ;

assign tuple_in_control_DATA = 0 ;

assign tuple_in_valid = tuple_in_fields_VALID ;

always @* begin
	tuple_in_control_i = 0 ;
	if ( ( tuple_in_control_DATA[3] == 0 ) ) begin
		tuple_in_control_i[21:19] = 1 ;
	end
end

assign tuple_in_fields = tuple_in_fields_DATA ;

assign tuple_in_metadata = tuple_in_metadata_DATA ;

assign tuple_out_fields_VALID = tuple_out_valid ;

assign tuple_out_fields_DATA = tuple_out_fields ;

update_phy_src_port_Engine
update_phy_src_port_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	(  ),
	.RX_TUPLE_fields     	( tuple_in_fields ),
	.TX_TUPLE_fields     	( tuple_out_fields ),
	.RX_TUPLE_metadata   	( tuple_in_metadata ),
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
// File created on 2018/06/28 08:54:32
// by Barista HDL generation library, version TRUNK @ 1007984


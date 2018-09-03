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

module S_BRIDGER_for_l3_tb_tuple_in_request (
	clk_line,
	clk_packet,
	clk_line_rst_high,
	clk_packet_rst_high,
	tuple_in_VALID,
	tuple_in_DATA,
	tuple_out_VALID,
	tuple_out_DATA
);

input clk_line ;
input clk_packet ;
input clk_line_rst_high ;
input clk_packet_rst_high ;
input tuple_in_VALID ;
input [31:0] tuple_in_DATA ;
output tuple_out_VALID ;
output [31:0] tuple_out_DATA ;

wire empty ;
wire full /* unused */ ;
wire tuple_out_VALID ;
wire [31:0] tuple_out_DATA ;

S_BRIDGER_for_l3_tb_tuple_in_request_32w_512d
myFifo_i
(
	.wr_rst              	( clk_line_rst_high ),
	.wr_clk              	( clk_line ),
	.wr_enb              	( tuple_in_VALID ),
	.wr_data             	( tuple_in_DATA ),
	.empty               	( empty ),
	.full                	( full ),
	.rd_clk              	( clk_packet ),
	.rd_rst              	( clk_packet_rst_high ),
	.rd_enb              	( ~empty ),
	.rd_val              	( tuple_out_VALID ),
	.rd_data             	( tuple_out_DATA )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:41
// by Barista HDL generation library, version TRUNK @ 1007984


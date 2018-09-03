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
Stimulus Generation Module
*/

`timescale 1 ps / 1 ps

module TB_System_Stim (
	file_done,
	fw_done,
	rst,
	clk_n,
	stim_eof,
	tuple_in_valid,
	packet_in_instream_TREADY,
	packet_in_instream_TVALID,
	packet_in_instream_TLAST,
	packet_in_instream_TKEEP,
	packet_in_instream_TDATA
);

input file_done ;
input fw_done ;
input rst ;
input clk_n ;
output stim_eof ;
output tuple_in_valid ;
input packet_in_instream_TREADY ;
output packet_in_instream_TVALID ;
output packet_in_instream_TLAST ;
output [31:0] packet_in_instream_TKEEP ;
output [255:0] packet_in_instream_TDATA ;

reg [31:0] fd_tup /* unused */ ;
reg [31:0] fd_pkt ;
reg stim_eof ;
reg tuple_in_valid ;
reg packet_in_instream_TVALID ;
reg packet_in_instream_TLAST ;
reg [31:0] packet_in_instream_TKEEP ;
reg [255:0] packet_in_instream_TDATA ;
reg SOP /* unused */ ;

always @( posedge file_done ) begin
	fd_pkt <= $fopen("Packet_in.axi", "r") ;
	fd_tup <= $fopen("Tuple_in.txt", "r") ;
end

always @( posedge clk_n ) begin
	packet_in_instream_TVALID <= 0 ;
	tuple_in_valid <= 0 ;
	if ( rst ) begin
		SOP <= 1 ;
		stim_eof <= 0 ;
		packet_in_instream_TLAST <= 'hX ;
		packet_in_instream_TKEEP <= 'hX ;
		packet_in_instream_TDATA <= 'hX ;
	end
	else  begin
		if ( ( ( packet_in_instream_TREADY && fw_done ) && ~stim_eof ) ) begin
			if ( ( 32'h3 != $fscanf(fd_pkt, "%x %x %x", packet_in_instream_TLAST, packet_in_instream_TKEEP, packet_in_instream_TDATA) ) ) begin
				stim_eof <= 1 ;
				$display("[%0t]  INFO: finished packet stimulus file", $time);
				packet_in_instream_TLAST <= 'hX ;
				packet_in_instream_TKEEP <= 'hX ;
				packet_in_instream_TDATA <= 'hX ;
			end
			else  begin
				packet_in_instream_TVALID <= 1 ;
			end
		end
	end
end


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:46
// by Barista HDL generation library, version TRUNK @ 1007984


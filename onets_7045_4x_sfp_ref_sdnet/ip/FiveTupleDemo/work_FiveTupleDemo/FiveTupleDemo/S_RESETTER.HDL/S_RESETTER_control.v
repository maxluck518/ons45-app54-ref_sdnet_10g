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
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// File name: S_RESETTER_control.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_control (


     reset_out_active_high, 
     reset_out_active_low, 
     init_done, 

     clk, 
     rst 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 output		reset_out_active_high ;
 output		reset_out_active_low ;
 output	reg	init_done ;
 input		clk ;
 input		rst ;






 reg	slmkkt1jcpfo3jqc_729;	 initial slmkkt1jcpfo3jqc_729 = 1'b0 ;
 reg	gectdlmtbn17u2376c69qylspubs240q_802;	 initial gectdlmtbn17u2376c69qylspubs240q_802 = 1'b0 ;
 reg [4:0] nzkdxx8dd4uv8wzuj14vtfpmaa33_85;	 initial nzkdxx8dd4uv8wzuj14vtfpmaa33_85 = 5'b00000 ;
 reg [4:0] nav4bgzg30omzd7bedox2z6g0s5_521;	 initial nav4bgzg30omzd7bedox2z6g0s5_521 = 5'b00000 ;
 wire	awl9g9zc8v1dznp9ewe66xn0u21h0_692 ;
 reg	x7b99209dvun3u3uvt5hgltey8r_763;	 initial x7b99209dvun3u3uvt5hgltey8r_763 = 1'b1 ;
 reg	b5w6hh84xgi2un8w_416;	 initial b5w6hh84xgi2un8w_416 = 1'b0 ;
 reg	lbmtt7mroan6inusy4qpghays5x_500;	 initial lbmtt7mroan6inusy4qpghays5x_500 = 1'b1 ;
 reg	ddg2xpcdkdvpw5c9b_424;	 initial ddg2xpcdkdvpw5c9b_424 = 1'b0 ;
 wire [4:0] jbe1h6dlvve78z0zg2pkv8b7q_589 ;
 wire [4:0] eppsbfvfbk1wd8isze1wg_604 ;
 wire	n8t5xsdmbp0keyviyh5pk5k3yu_391 ;
 wire	dtcomq9l51lqlhhyrhqki7neq18_708 ;
 wire	zbs2txmn6i2og51zerr3bw7fwytoqh1_572 ;
 wire	wjb08lfmsonsqxhim46fchi7btd_153 ;
 wire	iuk148oyw8b0eulcxkl05k_877 ;
 wire	ryl5gy3wp7ac4uiv27cimoxc97_127 ;
 wire	gd76xebfqlnsqb8mgd_859 ;
 wire	dwodvyeall7en18memtk6cyi_290 ;
 wire	xx05a7oicjmag27nyecd_876 ;
 wire	wlp3df6mx4ez78q2_284 ;
 wire	lbsu48dy4o7rhh42awah_158 ;
 wire	ymy0u9cu5eb5qfww4tau_345 ;


 assign jbe1h6dlvve78z0zg2pkv8b7q_589 = 
	nzkdxx8dd4uv8wzuj14vtfpmaa33_85 + 1 ;
 assign eppsbfvfbk1wd8isze1wg_604 = 
	nav4bgzg30omzd7bedox2z6g0s5_521 + 1 ;
 assign n8t5xsdmbp0keyviyh5pk5k3yu_391 = (
	((nzkdxx8dd4uv8wzuj14vtfpmaa33_85 > 5'b00000))?1'b1:
	0)  ;
 assign dtcomq9l51lqlhhyrhqki7neq18_708 = 
	rst | gectdlmtbn17u2376c69qylspubs240q_802 ;
 assign zbs2txmn6i2og51zerr3bw7fwytoqh1_572 = 
	dtcomq9l51lqlhhyrhqki7neq18_708 | n8t5xsdmbp0keyviyh5pk5k3yu_391 ;
 assign wjb08lfmsonsqxhim46fchi7btd_153 = (
	((gectdlmtbn17u2376c69qylspubs240q_802 == 1'b1) && (ymy0u9cu5eb5qfww4tau_345 == 1'b1) && (nzkdxx8dd4uv8wzuj14vtfpmaa33_85 == 5'b00000))?1'b1:
	((nzkdxx8dd4uv8wzuj14vtfpmaa33_85 != 5'b00000) && (gectdlmtbn17u2376c69qylspubs240q_802 != 1'b1))?1'b1:
	0)  ;
 assign iuk148oyw8b0eulcxkl05k_877 = (
	((slmkkt1jcpfo3jqc_729 == 1'b1))?1'b1:
	0)  ;
 assign ryl5gy3wp7ac4uiv27cimoxc97_127 = (
	((nzkdxx8dd4uv8wzuj14vtfpmaa33_85 == 5'b01111) && (gectdlmtbn17u2376c69qylspubs240q_802 != 1'b1) && (ymy0u9cu5eb5qfww4tau_345 == 1'b1))?1'b1:
	((nav4bgzg30omzd7bedox2z6g0s5_521 != 5'b00000) && (nav4bgzg30omzd7bedox2z6g0s5_521 != 5'b01111) && (gectdlmtbn17u2376c69qylspubs240q_802 != 1'b1) && (ymy0u9cu5eb5qfww4tau_345 == 1'b1))?1'b1:
	0)  ;
 assign gd76xebfqlnsqb8mgd_859 = (
	((nav4bgzg30omzd7bedox2z6g0s5_521 == 5'b01111))?1'b1:
	0)  ;
 assign dwodvyeall7en18memtk6cyi_290 = 
	1'b1 ;
 assign xx05a7oicjmag27nyecd_876 = 
	1'b0 ;
 assign wlp3df6mx4ez78q2_284 = 
	 ~(awl9g9zc8v1dznp9ewe66xn0u21h0_692) ;
 assign lbsu48dy4o7rhh42awah_158 = (
	((nav4bgzg30omzd7bedox2z6g0s5_521 == 5'b01111))?1'b1:
	0)  ;
 assign ymy0u9cu5eb5qfww4tau_345 = 
	1'b1 ;
 assign reset_out_active_high 	= lbmtt7mroan6inusy4qpghays5x_500 ;
 assign reset_out_active_low 	= ddg2xpcdkdvpw5c9b_424 ;


assign awl9g9zc8v1dznp9ewe66xn0u21h0_692 = (
	((zbs2txmn6i2og51zerr3bw7fwytoqh1_572 == 1'b1) && (nzkdxx8dd4uv8wzuj14vtfpmaa33_85 < 5'b10000))?dwodvyeall7en18memtk6cyi_290 :
1'b0) ;



always @(posedge clk)
begin
		slmkkt1jcpfo3jqc_729 <= rst ;
		gectdlmtbn17u2376c69qylspubs240q_802 <= slmkkt1jcpfo3jqc_729 ;
	if (iuk148oyw8b0eulcxkl05k_877) 
	begin 
	  nzkdxx8dd4uv8wzuj14vtfpmaa33_85 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (wjb08lfmsonsqxhim46fchi7btd_153) 
		begin 
			nzkdxx8dd4uv8wzuj14vtfpmaa33_85 <= jbe1h6dlvve78z0zg2pkv8b7q_589 ;
		end 
	end 
	if (iuk148oyw8b0eulcxkl05k_877) 
	begin 
	  nav4bgzg30omzd7bedox2z6g0s5_521 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (ryl5gy3wp7ac4uiv27cimoxc97_127) 
		begin 
			nav4bgzg30omzd7bedox2z6g0s5_521 <= eppsbfvfbk1wd8isze1wg_604 ;
		end 
	end 
	if (rst) 
	begin 
	  x7b99209dvun3u3uvt5hgltey8r_763 <= 1'b1 ;
	 end 
	else 
	begin 
			x7b99209dvun3u3uvt5hgltey8r_763 <= awl9g9zc8v1dznp9ewe66xn0u21h0_692 ;
	end 
	if (rst) 
	begin 
	  b5w6hh84xgi2un8w_416 <= 1'b0 ;
	 end 
	else 
	begin 
			b5w6hh84xgi2un8w_416 <= wlp3df6mx4ez78q2_284 ;
	end 
	if (rst) 
	begin 
	  lbmtt7mroan6inusy4qpghays5x_500 <= 1'b1 ;
	 end 
	else 
	begin 
			lbmtt7mroan6inusy4qpghays5x_500 <= x7b99209dvun3u3uvt5hgltey8r_763 ;
	end 
	if (rst) 
	begin 
	  ddg2xpcdkdvpw5c9b_424 <= 1'b0 ;
	 end 
	else 
	begin 
			ddg2xpcdkdvpw5c9b_424 <= b5w6hh84xgi2un8w_416 ;
	end 
		init_done <= lbsu48dy4o7rhh42awah_158 ;
end

endmodule 

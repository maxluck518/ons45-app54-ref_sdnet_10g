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
// File name: S_RESETTER.v
// File created: 2017/07/31 12:13:46
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER (


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






 reg	owwdn2ap2qizz6qzwxufzyfsgyank_507 ;
 reg	xstvosywzg9nqgatvkj2njvdwjqh8_317 ;
 reg [4:0] k30ikv2xkk4368uxubjdgsnt6h_78 ;
 reg [4:0] lsodtb8csizdxm162ozk6_825 ;
 wire	t28w9gbj83jfn6sl_872 ;
 reg	lfoa71q4rayci1ytbo03fqm_851 ;
 reg	d709xza3x8547iof1vpyh7_651 ;
 reg	mjnqqctz3dt1mcnh5zmfbs4mj_467 ;
 reg	sbysw6npfwm4jejpjg87dt4sa_498 ;
 wire [4:0] mdicb3nudt6z6toiixke5_509 ;
 wire [4:0] o03p0x2xooe18eei33ayv1iukfew5ag_357 ;
 wire	abiq818jj0r00wpf_30 ;
 wire	ryj3exjpf5la610t_855 ;
 wire	h7dzbdmtiswuo0fpr3zkquxsdcr_412 ;
 wire	c9jfbbf0zxtjaqodsb8bpl5w_52 ;
 wire	z7a7p1w8tgi9bm44o3_654 ;
 wire	obybme24f6nwth8stqpgn_514 ;
 wire	oz6ewloo3r6iic4we0hwrzfji_532 ;
 wire	clhls9izssoa9cnsvuj_577 ;


 assign mdicb3nudt6z6toiixke5_509 = 
	k30ikv2xkk4368uxubjdgsnt6h_78 + 1 ;
 assign o03p0x2xooe18eei33ayv1iukfew5ag_357 = 
	lsodtb8csizdxm162ozk6_825 + 1 ;
 assign abiq818jj0r00wpf_30 = (
	((xstvosywzg9nqgatvkj2njvdwjqh8_317 == 1'b1) && (clhls9izssoa9cnsvuj_577 == 1'b1) && (k30ikv2xkk4368uxubjdgsnt6h_78 == 5'b00000))?1'b1:
	((k30ikv2xkk4368uxubjdgsnt6h_78 != 5'b00000) && (xstvosywzg9nqgatvkj2njvdwjqh8_317 != 1'b1))?1'b1:
	0)  ;
 assign ryj3exjpf5la610t_855 = (
	((owwdn2ap2qizz6qzwxufzyfsgyank_507 == 1'b1))?1'b1:
	0)  ;
 assign h7dzbdmtiswuo0fpr3zkquxsdcr_412 = (
	((k30ikv2xkk4368uxubjdgsnt6h_78 == 5'b10011) && (xstvosywzg9nqgatvkj2njvdwjqh8_317 != 1'b1) && (clhls9izssoa9cnsvuj_577 == 1'b1))?1'b1:
	((lsodtb8csizdxm162ozk6_825 != 5'b00000) && (lsodtb8csizdxm162ozk6_825 != 5'b10011) && (xstvosywzg9nqgatvkj2njvdwjqh8_317 != 1'b1) && (clhls9izssoa9cnsvuj_577 == 1'b1))?1'b1:
	0)  ;
 assign c9jfbbf0zxtjaqodsb8bpl5w_52 = (
	((lsodtb8csizdxm162ozk6_825 == 5'b10011))?1'b1:
	0)  ;
 assign z7a7p1w8tgi9bm44o3_654 = 
	1'b1 ;
 assign obybme24f6nwth8stqpgn_514 = 
	 ~(t28w9gbj83jfn6sl_872) ;
 assign oz6ewloo3r6iic4we0hwrzfji_532 = (
	((lsodtb8csizdxm162ozk6_825 == 5'b10011))?1'b1:
	0)  ;
 assign clhls9izssoa9cnsvuj_577 = 
	1'b1 ;
 assign reset_out_active_high 	= mjnqqctz3dt1mcnh5zmfbs4mj_467 ;
 assign reset_out_active_low 	= sbysw6npfwm4jejpjg87dt4sa_498 ;


assign t28w9gbj83jfn6sl_872 = (
	((k30ikv2xkk4368uxubjdgsnt6h_78 != 5'b00000) && (xstvosywzg9nqgatvkj2njvdwjqh8_317 != 1'b1))?z7a7p1w8tgi9bm44o3_654 :
1'b0) ;



always @(posedge clk)
begin
		owwdn2ap2qizz6qzwxufzyfsgyank_507 <= rst ;
		xstvosywzg9nqgatvkj2njvdwjqh8_317 <= owwdn2ap2qizz6qzwxufzyfsgyank_507 ;
	if (ryj3exjpf5la610t_855) 
	begin 
	  k30ikv2xkk4368uxubjdgsnt6h_78 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (abiq818jj0r00wpf_30) 
		begin 
			k30ikv2xkk4368uxubjdgsnt6h_78 <= mdicb3nudt6z6toiixke5_509 ;
		end 
	end 
	if (ryj3exjpf5la610t_855) 
	begin 
	  lsodtb8csizdxm162ozk6_825 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (h7dzbdmtiswuo0fpr3zkquxsdcr_412) 
		begin 
			lsodtb8csizdxm162ozk6_825 <= o03p0x2xooe18eei33ayv1iukfew5ag_357 ;
		end 
	end 
		lfoa71q4rayci1ytbo03fqm_851 <= t28w9gbj83jfn6sl_872 ;
		d709xza3x8547iof1vpyh7_651 <= obybme24f6nwth8stqpgn_514 ;
		mjnqqctz3dt1mcnh5zmfbs4mj_467 <= lfoa71q4rayci1ytbo03fqm_851 ;
		sbysw6npfwm4jejpjg87dt4sa_498 <= d709xza3x8547iof1vpyh7_651 ;
		init_done <= oz6ewloo3r6iic4we0hwrzfji_532 ;
end

endmodule 

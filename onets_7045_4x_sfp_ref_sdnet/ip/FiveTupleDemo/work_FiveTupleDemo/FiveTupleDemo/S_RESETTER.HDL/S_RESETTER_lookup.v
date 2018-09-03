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
// File name: S_RESETTER_lookup.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_lookup (


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






 reg	xcyad6kfj0a80wh73_173;	 initial xcyad6kfj0a80wh73_173 = 1'b0 ;
 reg	pv533iiftc4xkrngjcz3l1efbkmub_647;	 initial pv533iiftc4xkrngjcz3l1efbkmub_647 = 1'b0 ;
 reg [4:0] oo5ycoqmgaki3my95miujha2foyk98d3_596;	 initial oo5ycoqmgaki3my95miujha2foyk98d3_596 = 5'b00000 ;
 reg [4:0] h2f8c88i4nrlntuxqgwun5oi_186;	 initial h2f8c88i4nrlntuxqgwun5oi_186 = 5'b00000 ;
 wire	bqw2kzvogleotnl6rz_268 ;
 reg	y9wpspev1k0ej2jzj6vk_40;	 initial y9wpspev1k0ej2jzj6vk_40 = 1'b1 ;
 reg	ud26csrex4hilai7zq2gri4b_397;	 initial ud26csrex4hilai7zq2gri4b_397 = 1'b0 ;
 reg	ck7n89lw9zkm28yl_554;	 initial ck7n89lw9zkm28yl_554 = 1'b1 ;
 reg	jni8ri35wigt1ktrec14vbc3bggu2he_666;	 initial jni8ri35wigt1ktrec14vbc3bggu2he_666 = 1'b0 ;
 wire [4:0] imwlwnorke0jtnyf3bn8bg2tvjv3d3m_580 ;
 wire [4:0] mey002kcnk4c5c3d07ji2hjp_512 ;
 wire	wavbwvg961874eiuvz_719 ;
 wire	atihmhh2yu0b1006s_726 ;
 wire	hecqaaoqndx8gpoh9a3fx91uum6_441 ;
 wire	iuqgozsejvk0n6ao3_839 ;
 wire	pel2ri4udqh43b432218tyglykrc_59 ;
 wire	xehbicvw2zk7qxmqrbusr_775 ;
 wire	imnydh2imwd8akjsdtqc5_431 ;
 wire	ij5oygq31kz7qokndh1vctbk_310 ;
 wire	nqpp3y8fhlvy5wcfx7iuk8m4g127oi_597 ;
 wire	bt6bfyde26wolhk8sm09j_16 ;
 wire	ssprecwcsv3zycas_60 ;
 wire	brq5s24chgouo5y68jzslka753zimf_204 ;


 assign imwlwnorke0jtnyf3bn8bg2tvjv3d3m_580 = 
	oo5ycoqmgaki3my95miujha2foyk98d3_596 + 1 ;
 assign mey002kcnk4c5c3d07ji2hjp_512 = 
	h2f8c88i4nrlntuxqgwun5oi_186 + 1 ;
 assign wavbwvg961874eiuvz_719 = (
	((oo5ycoqmgaki3my95miujha2foyk98d3_596 > 5'b00000))?1'b1:
	0)  ;
 assign atihmhh2yu0b1006s_726 = 
	rst | pv533iiftc4xkrngjcz3l1efbkmub_647 ;
 assign hecqaaoqndx8gpoh9a3fx91uum6_441 = 
	atihmhh2yu0b1006s_726 | wavbwvg961874eiuvz_719 ;
 assign iuqgozsejvk0n6ao3_839 = (
	((pv533iiftc4xkrngjcz3l1efbkmub_647 == 1'b1) && (brq5s24chgouo5y68jzslka753zimf_204 == 1'b1) && (oo5ycoqmgaki3my95miujha2foyk98d3_596 == 5'b00000))?1'b1:
	((oo5ycoqmgaki3my95miujha2foyk98d3_596 != 5'b00000) && (pv533iiftc4xkrngjcz3l1efbkmub_647 != 1'b1))?1'b1:
	0)  ;
 assign pel2ri4udqh43b432218tyglykrc_59 = (
	((xcyad6kfj0a80wh73_173 == 1'b1))?1'b1:
	0)  ;
 assign xehbicvw2zk7qxmqrbusr_775 = (
	((oo5ycoqmgaki3my95miujha2foyk98d3_596 == 5'b01111) && (pv533iiftc4xkrngjcz3l1efbkmub_647 != 1'b1) && (brq5s24chgouo5y68jzslka753zimf_204 == 1'b1))?1'b1:
	((h2f8c88i4nrlntuxqgwun5oi_186 != 5'b00000) && (h2f8c88i4nrlntuxqgwun5oi_186 != 5'b01111) && (pv533iiftc4xkrngjcz3l1efbkmub_647 != 1'b1) && (brq5s24chgouo5y68jzslka753zimf_204 == 1'b1))?1'b1:
	0)  ;
 assign imnydh2imwd8akjsdtqc5_431 = (
	((h2f8c88i4nrlntuxqgwun5oi_186 == 5'b01111))?1'b1:
	0)  ;
 assign ij5oygq31kz7qokndh1vctbk_310 = 
	1'b1 ;
 assign nqpp3y8fhlvy5wcfx7iuk8m4g127oi_597 = 
	1'b0 ;
 assign bt6bfyde26wolhk8sm09j_16 = 
	 ~(bqw2kzvogleotnl6rz_268) ;
 assign ssprecwcsv3zycas_60 = (
	((h2f8c88i4nrlntuxqgwun5oi_186 == 5'b01111))?1'b1:
	0)  ;
 assign brq5s24chgouo5y68jzslka753zimf_204 = 
	1'b1 ;
 assign reset_out_active_high 	= ck7n89lw9zkm28yl_554 ;
 assign reset_out_active_low 	= jni8ri35wigt1ktrec14vbc3bggu2he_666 ;


assign bqw2kzvogleotnl6rz_268 = (
	((hecqaaoqndx8gpoh9a3fx91uum6_441 == 1'b1) && (oo5ycoqmgaki3my95miujha2foyk98d3_596 < 5'b10000))?ij5oygq31kz7qokndh1vctbk_310 :
1'b0) ;



always @(posedge clk)
begin
		xcyad6kfj0a80wh73_173 <= rst ;
		pv533iiftc4xkrngjcz3l1efbkmub_647 <= xcyad6kfj0a80wh73_173 ;
	if (pel2ri4udqh43b432218tyglykrc_59) 
	begin 
	  oo5ycoqmgaki3my95miujha2foyk98d3_596 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (iuqgozsejvk0n6ao3_839) 
		begin 
			oo5ycoqmgaki3my95miujha2foyk98d3_596 <= imwlwnorke0jtnyf3bn8bg2tvjv3d3m_580 ;
		end 
	end 
	if (pel2ri4udqh43b432218tyglykrc_59) 
	begin 
	  h2f8c88i4nrlntuxqgwun5oi_186 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (xehbicvw2zk7qxmqrbusr_775) 
		begin 
			h2f8c88i4nrlntuxqgwun5oi_186 <= mey002kcnk4c5c3d07ji2hjp_512 ;
		end 
	end 
	if (rst) 
	begin 
	  y9wpspev1k0ej2jzj6vk_40 <= 1'b1 ;
	 end 
	else 
	begin 
			y9wpspev1k0ej2jzj6vk_40 <= bqw2kzvogleotnl6rz_268 ;
	end 
	if (rst) 
	begin 
	  ud26csrex4hilai7zq2gri4b_397 <= 1'b0 ;
	 end 
	else 
	begin 
			ud26csrex4hilai7zq2gri4b_397 <= bt6bfyde26wolhk8sm09j_16 ;
	end 
	if (rst) 
	begin 
	  ck7n89lw9zkm28yl_554 <= 1'b1 ;
	 end 
	else 
	begin 
			ck7n89lw9zkm28yl_554 <= y9wpspev1k0ej2jzj6vk_40 ;
	end 
	if (rst) 
	begin 
	  jni8ri35wigt1ktrec14vbc3bggu2he_666 <= 1'b0 ;
	 end 
	else 
	begin 
			jni8ri35wigt1ktrec14vbc3bggu2he_666 <= ud26csrex4hilai7zq2gri4b_397 ;
	end 
		init_done <= ssprecwcsv3zycas_60 ;
end

endmodule 

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
// File name: S_RESETTER_line.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_line (


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






 reg	sex27ae8u2op8jnmmfeld2xu9aj_826;	 initial sex27ae8u2op8jnmmfeld2xu9aj_826 = 1'b0 ;
 reg	ryzkjppa8h4kducgwl1g80k7b19dxk42_292;	 initial ryzkjppa8h4kducgwl1g80k7b19dxk42_292 = 1'b0 ;
 reg [4:0] t321myetzj5zrhgvuj2940df_718;	 initial t321myetzj5zrhgvuj2940df_718 = 5'b00000 ;
 reg [4:0] nomg9nxlz0jzykinablbqx24s5txsun_702;	 initial nomg9nxlz0jzykinablbqx24s5txsun_702 = 5'b00000 ;
 wire	rycehkhuvnucnoz5j84m_255 ;
 reg	v7czh55tug3a2b7r9cy66n_34;	 initial v7czh55tug3a2b7r9cy66n_34 = 1'b1 ;
 reg	vuu2d8gz6ztrcm7scdx0_210;	 initial vuu2d8gz6ztrcm7scdx0_210 = 1'b0 ;
 reg	c95bdbck2mvebzv714f7_112;	 initial c95bdbck2mvebzv714f7_112 = 1'b1 ;
 reg	f40jql9razko7a22_50;	 initial f40jql9razko7a22_50 = 1'b0 ;
 wire [4:0] ttswsfeqcxplurzs3iqrvb_83 ;
 wire [4:0] yhq7dnx1dxrfjemietqpo2m_325 ;
 wire	jukbax5h0jmvdgc1l08lv24jh2ny_391 ;
 wire	n78vo243iq02k78vxg5st_382 ;
 wire	vuk6uiofy4cecsi7_455 ;
 wire	q6hywj7inkfkujea3_341 ;
 wire	mb44cbugwrtq357w08qwnj13o2no_150 ;
 wire	ntqzi6n0nhju9rmedd115c0rv499di_523 ;
 wire	upkah1b7n8t7q5e0yfwq037_356 ;
 wire	j5lb9pdxjai1vlya7bbk66_113 ;
 wire	f8v3cu4onsoqci25kde3g921bg_550 ;
 wire	obx12s4m2mqzoe67qnr16z9c_458 ;
 wire	ho6szbzfeca0md9e89s0m5gh21j3_654 ;
 wire	yx3tfwsplnny478pzm_884 ;


 assign ttswsfeqcxplurzs3iqrvb_83 = 
	t321myetzj5zrhgvuj2940df_718 + 1 ;
 assign yhq7dnx1dxrfjemietqpo2m_325 = 
	nomg9nxlz0jzykinablbqx24s5txsun_702 + 1 ;
 assign jukbax5h0jmvdgc1l08lv24jh2ny_391 = (
	((t321myetzj5zrhgvuj2940df_718 > 5'b00000))?1'b1:
	0)  ;
 assign n78vo243iq02k78vxg5st_382 = 
	rst | ryzkjppa8h4kducgwl1g80k7b19dxk42_292 ;
 assign vuk6uiofy4cecsi7_455 = 
	n78vo243iq02k78vxg5st_382 | jukbax5h0jmvdgc1l08lv24jh2ny_391 ;
 assign q6hywj7inkfkujea3_341 = (
	((ryzkjppa8h4kducgwl1g80k7b19dxk42_292 == 1'b1) && (yx3tfwsplnny478pzm_884 == 1'b1) && (t321myetzj5zrhgvuj2940df_718 == 5'b00000))?1'b1:
	((t321myetzj5zrhgvuj2940df_718 != 5'b00000) && (ryzkjppa8h4kducgwl1g80k7b19dxk42_292 != 1'b1))?1'b1:
	0)  ;
 assign mb44cbugwrtq357w08qwnj13o2no_150 = (
	((sex27ae8u2op8jnmmfeld2xu9aj_826 == 1'b1))?1'b1:
	0)  ;
 assign ntqzi6n0nhju9rmedd115c0rv499di_523 = (
	((t321myetzj5zrhgvuj2940df_718 == 5'b01111) && (ryzkjppa8h4kducgwl1g80k7b19dxk42_292 != 1'b1) && (yx3tfwsplnny478pzm_884 == 1'b1))?1'b1:
	((nomg9nxlz0jzykinablbqx24s5txsun_702 != 5'b00000) && (nomg9nxlz0jzykinablbqx24s5txsun_702 != 5'b01111) && (ryzkjppa8h4kducgwl1g80k7b19dxk42_292 != 1'b1) && (yx3tfwsplnny478pzm_884 == 1'b1))?1'b1:
	0)  ;
 assign upkah1b7n8t7q5e0yfwq037_356 = (
	((nomg9nxlz0jzykinablbqx24s5txsun_702 == 5'b01111))?1'b1:
	0)  ;
 assign j5lb9pdxjai1vlya7bbk66_113 = 
	1'b1 ;
 assign f8v3cu4onsoqci25kde3g921bg_550 = 
	1'b0 ;
 assign obx12s4m2mqzoe67qnr16z9c_458 = 
	 ~(rycehkhuvnucnoz5j84m_255) ;
 assign ho6szbzfeca0md9e89s0m5gh21j3_654 = (
	((nomg9nxlz0jzykinablbqx24s5txsun_702 == 5'b01111))?1'b1:
	0)  ;
 assign yx3tfwsplnny478pzm_884 = 
	1'b1 ;
 assign reset_out_active_high 	= c95bdbck2mvebzv714f7_112 ;
 assign reset_out_active_low 	= f40jql9razko7a22_50 ;


assign rycehkhuvnucnoz5j84m_255 = (
	((vuk6uiofy4cecsi7_455 == 1'b1) && (t321myetzj5zrhgvuj2940df_718 < 5'b10000))?j5lb9pdxjai1vlya7bbk66_113 :
1'b0) ;



always @(posedge clk)
begin
		sex27ae8u2op8jnmmfeld2xu9aj_826 <= rst ;
		ryzkjppa8h4kducgwl1g80k7b19dxk42_292 <= sex27ae8u2op8jnmmfeld2xu9aj_826 ;
	if (mb44cbugwrtq357w08qwnj13o2no_150) 
	begin 
	  t321myetzj5zrhgvuj2940df_718 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (q6hywj7inkfkujea3_341) 
		begin 
			t321myetzj5zrhgvuj2940df_718 <= ttswsfeqcxplurzs3iqrvb_83 ;
		end 
	end 
	if (mb44cbugwrtq357w08qwnj13o2no_150) 
	begin 
	  nomg9nxlz0jzykinablbqx24s5txsun_702 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (ntqzi6n0nhju9rmedd115c0rv499di_523) 
		begin 
			nomg9nxlz0jzykinablbqx24s5txsun_702 <= yhq7dnx1dxrfjemietqpo2m_325 ;
		end 
	end 
	if (rst) 
	begin 
	  v7czh55tug3a2b7r9cy66n_34 <= 1'b1 ;
	 end 
	else 
	begin 
			v7czh55tug3a2b7r9cy66n_34 <= rycehkhuvnucnoz5j84m_255 ;
	end 
	if (rst) 
	begin 
	  vuu2d8gz6ztrcm7scdx0_210 <= 1'b0 ;
	 end 
	else 
	begin 
			vuu2d8gz6ztrcm7scdx0_210 <= obx12s4m2mqzoe67qnr16z9c_458 ;
	end 
	if (rst) 
	begin 
	  c95bdbck2mvebzv714f7_112 <= 1'b1 ;
	 end 
	else 
	begin 
			c95bdbck2mvebzv714f7_112 <= v7czh55tug3a2b7r9cy66n_34 ;
	end 
	if (rst) 
	begin 
	  f40jql9razko7a22_50 <= 1'b0 ;
	 end 
	else 
	begin 
			f40jql9razko7a22_50 <= vuu2d8gz6ztrcm7scdx0_210 ;
	end 
		init_done <= ho6szbzfeca0md9e89s0m5gh21j3_654 ;
end

endmodule 

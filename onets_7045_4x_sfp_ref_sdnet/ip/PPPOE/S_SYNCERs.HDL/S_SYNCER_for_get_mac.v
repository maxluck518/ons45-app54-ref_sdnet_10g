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
// File name: S_SYNCER_for_get_mac.v
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_get_mac (
     packet_in_PACKET3_SOF, 
     packet_in_PACKET3_EOF, 
     packet_in_PACKET3_VAL, 
     packet_in_PACKET3_DAT, 
     packet_in_PACKET3_CNT, 
     packet_in_PACKET3_ERR, 
     packet_out_PACKET3_RDY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     tuple_in_TUPLE2_VALID, 
     tuple_in_TUPLE2_DATA, 
     tuple_in_TUPLE4_VALID, 
     tuple_in_TUPLE4_DATA, 
     tuple_in_TUPLE5_VALID, 
     tuple_in_TUPLE5_DATA, 
     backpressure_in, 


     packet_out_PACKET3_SOF, 
     packet_out_PACKET3_EOF, 
     packet_out_PACKET3_VAL, 
     packet_out_PACKET3_DAT, 
     packet_out_PACKET3_CNT, 
     packet_out_PACKET3_ERR, 
     packet_in_PACKET3_RDY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
     tuple_out_TUPLE1_VALID, 
     tuple_out_TUPLE1_DATA, 
     tuple_out_TUPLE2_VALID, 
     tuple_out_TUPLE2_DATA, 
     tuple_out_TUPLE4_VALID, 
     tuple_out_TUPLE4_DATA, 
     tuple_out_TUPLE5_VALID, 
     tuple_out_TUPLE5_DATA, 
     backpressure_out, 

     clk_in_0, 
     clk_out_0, 
     clk_in_1, 
     clk_out_1, 
     clk_in_2, 
     clk_out_2, 
     clk_in_3, 
     clk_out_3, 
     clk_in_4, 
     clk_out_4, 
     clk_in_5, 
     clk_out_5, 
     rst_in_0, 
     rst_out_0, 
     rst_in_1, 
     rst_out_1, 
     rst_in_2, 
     rst_out_2, 
     rst_in_3, 
     rst_out_3, 
     rst_in_4, 
     rst_out_4, 
     rst_in_5, 
     rst_out_5 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET3_SOF ;
 input		packet_in_PACKET3_EOF ;
 input		packet_in_PACKET3_VAL ;
 input	 [255:0] packet_in_PACKET3_DAT ;
 input	 [5:0] packet_in_PACKET3_CNT ;
 input		packet_in_PACKET3_ERR ;
 input		packet_out_PACKET3_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [48:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [3:0] tuple_in_TUPLE1_DATA ;
 input		tuple_in_TUPLE2_VALID ;
 input	 [25:0] tuple_in_TUPLE2_DATA ;
 input		tuple_in_TUPLE4_VALID ;
 input	 [199:0] tuple_in_TUPLE4_DATA ;
 input		tuple_in_TUPLE5_VALID ;
 input	 [63:0] tuple_in_TUPLE5_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET3_SOF ;
 output		packet_out_PACKET3_EOF ;
 output		packet_out_PACKET3_VAL ;
 output	 [255:0] packet_out_PACKET3_DAT ;
 output	 [5:0] packet_out_PACKET3_CNT ;
 output		packet_out_PACKET3_ERR ;
 output		packet_in_PACKET3_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [48:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [3:0] tuple_out_TUPLE1_DATA ;
 output		tuple_out_TUPLE2_VALID ;
 output	 [25:0] tuple_out_TUPLE2_DATA ;
 output		tuple_out_TUPLE4_VALID ;
 output	 [199:0] tuple_out_TUPLE4_DATA ;
 output		tuple_out_TUPLE5_VALID ;
 output	 [63:0] tuple_out_TUPLE5_DATA ;
 output	reg	backpressure_out ;
 input		clk_in_0 ;
 input		clk_out_0 ;
 input		clk_in_1 ;
 input		clk_out_1 ;
 input		clk_in_2 ;
 input		clk_out_2 ;
 input		clk_in_3 ;
 input		clk_out_3 ;
 input		clk_in_4 ;
 input		clk_out_4 ;
 input		clk_in_5 ;
 input		clk_out_5 ;
 input		rst_in_0 ;
 input		rst_out_0 ;
 input		rst_in_1 ;
 input		rst_out_1 ;
 input		rst_in_2 ;
 input		rst_out_2 ;
 input		rst_in_3 ;
 input		rst_out_3 ;
 input		rst_in_4 ;
 input		rst_out_4 ;
 input		rst_in_5 ;
 input		rst_out_5 ;






 wire	c3j2pwu8mu17mj5asr9u6z9aiml_209 ;
 wire [265:0] leu4q6zgncpzmilenh_270 ;
 wire	vqmfrzqpnzkd5kwov8z6za_777 ;
 wire	r65yhiefqqxqetpj3vf7gmrlgiy8h_285 ;
 wire	tf43glf7ui0o3rcdxgutsg2_143 ;
 reg	ttmgg03165l98slop2m_553 ;
 wire	aa4o0da7rbu1zh0i7yu36i7m_690 ;
 wire [0:0] lpxzx8166bg3wnjb_624 ;
 wire	ansreinyrdkcdlwwlieqll_809 ;
 wire	qb3sjqeu1rclrd80aphmpqxfvp42jg_323 ;
 wire [0:0] lsosh18mafuqxdid_141 ;
 wire	f4rmi7neqvpq6m9cpndxthbv_270 ;
 wire	drijtsgszukvdhm0_464 ;
 wire	qualqqxmxxyn5nz5n64snbhz60ajk_871 ;
 wire	n6wgbgakmthz0tspyqijh9y_525 ;
 wire [48:0] nzpldsyi9wxl1gzwd3liua1b_312 ;
 wire	dspv2dt9xuc28o3bwhxfgqkdk530896g_377 ;
 wire	vh4dlfguyhpm47gzc8_537 ;
 wire	zkhgbhjxv263r51ckj07jaboxvm9fs7_69 ;
 wire	zeue0bugfmo85dsvff8whcyxcxy_611 ;
 wire [3:0] z50fbce180yx8giwvx8m4_239 ;
 wire	o4tuumpexbnettx26w9ccity7nvn_739 ;
 wire	o574xwoc6zq9clq1q192gy6yhurcqz_186 ;
 wire	zzajr2bulmbz0oejgxdpu8w_486 ;
 wire	o8s7k34stra4yhzle9qfat8rhgwde_254 ;
 wire [25:0] ams6jf7r8hiz3jprmc99mefn2q22qm_508 ;
 wire	vmw9u647ndnczd4lnr1b3b6_418 ;
 wire	im5rvsfqtkavbv61kx4xv3tib1g_868 ;
 wire	hbp348eakbx63kzmmy8n7scxys_491 ;
 wire	ujo5gmwm12cn629c171ndcdwmh_350 ;
 wire [199:0] c7mxq1z7yi4fonjoa4yzx_133 ;
 wire	xzql0tdasazfnid50d_590 ;
 wire	jisxwh6hz8m6lk6etym8q0o_396 ;
 wire	xi10v4nyqso188j5_702 ;
 wire	yumx40kqirag24d3pzf05k_450 ;
 wire [63:0] c77fbu1sfz70padvlfvi0ep9sri_199 ;
 wire	dvtzw4qssc4k4np7pnc9f_472 ;
 wire	h6xcjqe6lrp52rlqt4aw5r_597 ;
 wire	fftr955nosq3zpq7i_87 ;
 reg	cvwcmif04kp34peq_430 ;
 reg	ndtmqnv6vn6pg7ja7_248 ;
 reg	au22nksjjuyc5fjt0az_27 ;
 reg	e05zpw0mbqtwcxegabutoc7tsv6tv_543 ;
 reg	qoxksqguoijxmnhjndul_85 ;
 reg	aafv8aidobp6i4ko3n_162 ;
 wire	xbn3s5b4z3ijvchp048dkkzs4y7fn4ow_703 ;
 wire [265:0] n1en77cal8ga7zns6_855 ;
 wire	ubp00m4c1p575v1y79b49c_457 ;
 wire [265:0] et1pk1yh8f730z9ue3bd_628 ;
 wire	c9u2ib3d32q3tavevf4o71ykyc_214 ;
 wire	pf7bifc57soboq47g3l3o72ukdbp77_392 ;
 wire	p6pogzes0n13mlyp_555 ;
 wire	k2arebo2i66ww9k7_604 ;
 wire	zant7zs01yvwm70vuz4od0dpuiun8t_117 ;
 wire [5:0] v7vvibevixt4ict825k5u9lq_224 ;
 wire [255:0] vlvl72mwr4xeu1nv2u3bzh0qadd2834k_484 ;
 wire	is0gmmrrmemcgbq6c2p_30 ;
 wire	zrner52u8wu4qwkd_319 ;
 wire	uwdgvshqlx9lhdzx58i4tffl22adzfju_188 ;
 wire	nhht87abwfurupyloi_591 ;
 wire	tpu5olgqlz0zaazh3v9l2xp3q_556 ;
 wire	xlkvey04hjzbz6hju_361 ;
 wire	a0i6ekdsupuaemivnzuirzz5oew1g_137 ;
 wire [0:0] d0xnbh3adk6xq7q2amxrz3n5bfrq_268 ;
 wire	dphs2r7me22t5yzfabxp485ch_822 ;
 wire	fuqledf1wy210llslto02a8i_451 ;
 wire	x0yu4zpxme5a506veea1w83m_838 ;
 wire	p3etvly23ts2ej574_660 ;
 wire	o4j3c18mb8cgmek4_427 ;
 wire	fo7rli0ao5ul967h864cqwgie0_432 ;
 wire [0:0] x5p1kshj5zm60wqx9_252 ;
 wire	k4n3bpvcg6m4uxwrk9pdir8bam0_814 ;
 wire	y3uxfy1ld4f6q6wvza41_331 ;
 wire	s2idw6p56bn0lqplwi_406 ;
 wire	i1bi25y663k3d1vvyyw5wr5qbh_187 ;
 wire	nvzn9c22qg4todehznlqohtse17q0u52_218 ;
 wire	jpbtevg8ptlc35qhrdo52c2d_787 ;
 wire [48:0] kwutur03nuuo6urnlyxmk4bq2zen_697 ;
 wire	n6kvci64hfjmwyjffnrigqv5s_698 ;
 wire [48:0] g9yjjwoocex67a9dbbbqc_289 ;
 wire	im3vlrtd1avyhdz2rk8zn6j7gpuyfz_334 ;
 wire	td317abvlk8cp86fo56mo3h_590 ;
 wire [3:0] wnuvxc45wejruwl56hejczr0ypuflop_177 ;
 wire	z8q08tdptc1ch2eso6ym83z4yg1jbn_679 ;
 wire [3:0] psloovzo1za5xil6jmie86ykacvczki_577 ;
 wire	b7cmbl21ee51blhy9vmdir5hpz_548 ;
 wire	bnefksdbsw1f3ynghzbp7dyy2_440 ;
 wire [25:0] xgrmygj2m5w2po9rmfjpmn8e_747 ;
 wire	ls36hc71qdf8v9eaykg22ssw145tuxdi_683 ;
 wire [25:0] q2jws0y9zglb585i75z_364 ;
 wire	y1csnzvwqtprixsaoo219r_398 ;
 wire	enchrhonnnm4vf3lz4032_416 ;
 wire [199:0] vhur3m1z8unre07e3ifs_423 ;
 wire	hem4ztdh4ow8yswl0spuq019x_470 ;
 wire [199:0] xaw0d01axbcyax6ap48dud5l6n0dzj3r_588 ;
 wire	iln9kzg9ic8nkn4lsj0nl_903 ;
 wire	rhqc35v3vzw18ti9w18ayu_226 ;
 wire [63:0] u70obw1m34u3pmxlgf8saxzrxj15rgeg_764 ;
 wire	w3tgkr6e41lakjid7bdszhvvr0lvjpw_887 ;
 wire [63:0] iqr6r7muwtkod28chno46oi_896 ;
 wire	u0zjzxy8i5azno0w8w7w1j61_812 ;
 wire	m7ecamwik3nui9oiez76kycrshon9_373 ;
 wire	rqa41reynxgmr68sse98fmgmp2sxp6c3_101 ;
 wire	c82yw504kwdr24rieefk74d5_781 ;


 assign xbn3s5b4z3ijvchp048dkkzs4y7fn4ow_703 = 
	 ~(backpressure_in) ;
 assign n1en77cal8ga7zns6_855 = 
	{packet_in_PACKET3_SOF, packet_in_PACKET3_EOF, packet_in_PACKET3_VAL, packet_in_PACKET3_DAT, packet_in_PACKET3_CNT, packet_in_PACKET3_ERR} ;
 assign ubp00m4c1p575v1y79b49c_457 	= packet_in_PACKET3_VAL ;
 assign et1pk1yh8f730z9ue3bd_628 	= n1en77cal8ga7zns6_855[265:0] ;
 assign c9u2ib3d32q3tavevf4o71ykyc_214 = 
	p3etvly23ts2ej574_660 | rqa41reynxgmr68sse98fmgmp2sxp6c3_101 ;
 assign pf7bifc57soboq47g3l3o72ukdbp77_392 = 
	xbn3s5b4z3ijvchp048dkkzs4y7fn4ow_703 & fuqledf1wy210llslto02a8i_451 & c9u2ib3d32q3tavevf4o71ykyc_214 ;
 assign p6pogzes0n13mlyp_555 	= pf7bifc57soboq47g3l3o72ukdbp77_392 ;
 assign k2arebo2i66ww9k7_604 = 
	 ~(vqmfrzqpnzkd5kwov8z6za_777) ;
 assign zant7zs01yvwm70vuz4od0dpuiun8t_117 	= leu4q6zgncpzmilenh_270[0] ;
 assign v7vvibevixt4ict825k5u9lq_224 	= leu4q6zgncpzmilenh_270[6:1] ;
 assign vlvl72mwr4xeu1nv2u3bzh0qadd2834k_484 	= leu4q6zgncpzmilenh_270[262:7] ;
 assign is0gmmrrmemcgbq6c2p_30 	= leu4q6zgncpzmilenh_270[263] ;
 assign zrner52u8wu4qwkd_319 	= leu4q6zgncpzmilenh_270[264] ;
 assign uwdgvshqlx9lhdzx58i4tffl22adzfju_188 	= leu4q6zgncpzmilenh_270[265] ;
 assign nhht87abwfurupyloi_591 = 
	ttmgg03165l98slop2m_553 & is0gmmrrmemcgbq6c2p_30 ;
 assign tpu5olgqlz0zaazh3v9l2xp3q_556 	= pf7bifc57soboq47g3l3o72ukdbp77_392 ;
 assign xlkvey04hjzbz6hju_361 	= tpu5olgqlz0zaazh3v9l2xp3q_556 ;
 assign a0i6ekdsupuaemivnzuirzz5oew1g_137 	= y3uxfy1ld4f6q6wvza41_331 ;
 assign d0xnbh3adk6xq7q2amxrz3n5bfrq_268 = s2idw6p56bn0lqplwi_406 ;
 assign dphs2r7me22t5yzfabxp485ch_822 	= i1bi25y663k3d1vvyyw5wr5qbh_187 ;
 assign fuqledf1wy210llslto02a8i_451 	= aa4o0da7rbu1zh0i7yu36i7m_690 ;
 assign x0yu4zpxme5a506veea1w83m_838 = lpxzx8166bg3wnjb_624 ;
 assign p3etvly23ts2ej574_660 = 
	 ~(x0yu4zpxme5a506veea1w83m_838) ;
 assign o4j3c18mb8cgmek4_427 	= ansreinyrdkcdlwwlieqll_809 ;
 assign fo7rli0ao5ul967h864cqwgie0_432 	= packet_in_PACKET3_VAL ;
 assign x5p1kshj5zm60wqx9_252 = packet_in_PACKET3_SOF ;
 assign k4n3bpvcg6m4uxwrk9pdir8bam0_814 	= o4j3c18mb8cgmek4_427 ;
 assign y3uxfy1ld4f6q6wvza41_331 	= qb3sjqeu1rclrd80aphmpqxfvp42jg_323 ;
 assign s2idw6p56bn0lqplwi_406 = lsosh18mafuqxdid_141 ;
 assign i1bi25y663k3d1vvyyw5wr5qbh_187 	= f4rmi7neqvpq6m9cpndxthbv_270 ;
 assign nvzn9c22qg4todehznlqohtse17q0u52_218 = 
	 ~(f4rmi7neqvpq6m9cpndxthbv_270) ;
 assign jpbtevg8ptlc35qhrdo52c2d_787 = 
	xbn3s5b4z3ijvchp048dkkzs4y7fn4ow_703 & rqa41reynxgmr68sse98fmgmp2sxp6c3_101 & fuqledf1wy210llslto02a8i_451 & x0yu4zpxme5a506veea1w83m_838 ;
 assign kwutur03nuuo6urnlyxmk4bq2zen_697 = 
	tuple_in_TUPLE0_DATA ;
 assign n6kvci64hfjmwyjffnrigqv5s_698 	= tuple_in_TUPLE0_VALID ;
 assign g9yjjwoocex67a9dbbbqc_289 	= kwutur03nuuo6urnlyxmk4bq2zen_697[48:0] ;
 assign im3vlrtd1avyhdz2rk8zn6j7gpuyfz_334 = 
	 ~(dspv2dt9xuc28o3bwhxfgqkdk530896g_377) ;
 assign td317abvlk8cp86fo56mo3h_590 	= jpbtevg8ptlc35qhrdo52c2d_787 ;
 assign wnuvxc45wejruwl56hejczr0ypuflop_177 = 
	tuple_in_TUPLE1_DATA ;
 assign z8q08tdptc1ch2eso6ym83z4yg1jbn_679 	= tuple_in_TUPLE1_VALID ;
 assign psloovzo1za5xil6jmie86ykacvczki_577 	= wnuvxc45wejruwl56hejczr0ypuflop_177[3:0] ;
 assign b7cmbl21ee51blhy9vmdir5hpz_548 = 
	 ~(o4tuumpexbnettx26w9ccity7nvn_739) ;
 assign bnefksdbsw1f3ynghzbp7dyy2_440 	= jpbtevg8ptlc35qhrdo52c2d_787 ;
 assign xgrmygj2m5w2po9rmfjpmn8e_747 = 
	tuple_in_TUPLE2_DATA ;
 assign ls36hc71qdf8v9eaykg22ssw145tuxdi_683 	= tuple_in_TUPLE2_VALID ;
 assign q2jws0y9zglb585i75z_364 	= xgrmygj2m5w2po9rmfjpmn8e_747[25:0] ;
 assign y1csnzvwqtprixsaoo219r_398 = 
	 ~(vmw9u647ndnczd4lnr1b3b6_418) ;
 assign enchrhonnnm4vf3lz4032_416 	= jpbtevg8ptlc35qhrdo52c2d_787 ;
 assign vhur3m1z8unre07e3ifs_423 = 
	tuple_in_TUPLE4_DATA ;
 assign hem4ztdh4ow8yswl0spuq019x_470 	= tuple_in_TUPLE4_VALID ;
 assign xaw0d01axbcyax6ap48dud5l6n0dzj3r_588 	= vhur3m1z8unre07e3ifs_423[199:0] ;
 assign iln9kzg9ic8nkn4lsj0nl_903 = 
	 ~(xzql0tdasazfnid50d_590) ;
 assign rhqc35v3vzw18ti9w18ayu_226 	= jpbtevg8ptlc35qhrdo52c2d_787 ;
 assign u70obw1m34u3pmxlgf8saxzrxj15rgeg_764 = 
	tuple_in_TUPLE5_DATA ;
 assign w3tgkr6e41lakjid7bdszhvvr0lvjpw_887 	= tuple_in_TUPLE5_VALID ;
 assign iqr6r7muwtkod28chno46oi_896 	= u70obw1m34u3pmxlgf8saxzrxj15rgeg_764[63:0] ;
 assign u0zjzxy8i5azno0w8w7w1j61_812 = 
	 ~(dvtzw4qssc4k4np7pnc9f_472) ;
 assign m7ecamwik3nui9oiez76kycrshon9_373 	= jpbtevg8ptlc35qhrdo52c2d_787 ;
 assign rqa41reynxgmr68sse98fmgmp2sxp6c3_101 = 
	k2arebo2i66ww9k7_604 & im3vlrtd1avyhdz2rk8zn6j7gpuyfz_334 & b7cmbl21ee51blhy9vmdir5hpz_548 & y1csnzvwqtprixsaoo219r_398 & iln9kzg9ic8nkn4lsj0nl_903 & u0zjzxy8i5azno0w8w7w1j61_812 ;
 assign c82yw504kwdr24rieefk74d5_781 = 
	cvwcmif04kp34peq_430 | ndtmqnv6vn6pg7ja7_248 | au22nksjjuyc5fjt0az_27 | e05zpw0mbqtwcxegabutoc7tsv6tv_543 | qoxksqguoijxmnhjndul_85 | aafv8aidobp6i4ko3n_162 ;
 assign packet_out_PACKET3_SOF 	= uwdgvshqlx9lhdzx58i4tffl22adzfju_188 ;
 assign packet_out_PACKET3_EOF 	= zrner52u8wu4qwkd_319 ;
 assign packet_out_PACKET3_VAL 	= nhht87abwfurupyloi_591 ;
 assign packet_out_PACKET3_DAT 	= vlvl72mwr4xeu1nv2u3bzh0qadd2834k_484[255:0] ;
 assign packet_out_PACKET3_CNT 	= v7vvibevixt4ict825k5u9lq_224[5:0] ;
 assign packet_out_PACKET3_ERR 	= zant7zs01yvwm70vuz4od0dpuiun8t_117 ;
 assign packet_in_PACKET3_RDY 	= packet_out_PACKET3_RDY ;
 assign tuple_out_TUPLE0_VALID 	= n6wgbgakmthz0tspyqijh9y_525 ;
 assign tuple_out_TUPLE0_DATA 	= nzpldsyi9wxl1gzwd3liua1b_312[48:0] ;
 assign tuple_out_TUPLE1_VALID 	= zeue0bugfmo85dsvff8whcyxcxy_611 ;
 assign tuple_out_TUPLE1_DATA 	= z50fbce180yx8giwvx8m4_239[3:0] ;
 assign tuple_out_TUPLE2_VALID 	= o8s7k34stra4yhzle9qfat8rhgwde_254 ;
 assign tuple_out_TUPLE2_DATA 	= ams6jf7r8hiz3jprmc99mefn2q22qm_508[25:0] ;
 assign tuple_out_TUPLE4_VALID 	= ujo5gmwm12cn629c171ndcdwmh_350 ;
 assign tuple_out_TUPLE4_DATA 	= c7mxq1z7yi4fonjoa4yzx_133[199:0] ;
 assign tuple_out_TUPLE5_VALID 	= yumx40kqirag24d3pzf05k_450 ;
 assign tuple_out_TUPLE5_DATA 	= c77fbu1sfz70padvlfvi0ep9sri_199[63:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	ttmgg03165l98slop2m_553 <= 1'b0 ;
	cvwcmif04kp34peq_430 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		ttmgg03165l98slop2m_553 <= pf7bifc57soboq47g3l3o72ukdbp77_392 ;
		cvwcmif04kp34peq_430 <= r65yhiefqqxqetpj3vf7gmrlgiy8h_285 ;
		backpressure_out <= c82yw504kwdr24rieefk74d5_781 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	ndtmqnv6vn6pg7ja7_248 <= 1'b0 ;
   end
  else
  begin
		ndtmqnv6vn6pg7ja7_248 <= vh4dlfguyhpm47gzc8_537 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	au22nksjjuyc5fjt0az_27 <= 1'b0 ;
   end
  else
  begin
		au22nksjjuyc5fjt0az_27 <= o574xwoc6zq9clq1q192gy6yhurcqz_186 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	e05zpw0mbqtwcxegabutoc7tsv6tv_543 <= 1'b0 ;
   end
  else
  begin
		e05zpw0mbqtwcxegabutoc7tsv6tv_543 <= im5rvsfqtkavbv61kx4xv3tib1g_868 ;
  end
end

always @(posedge clk_out_4)
begin
  if (rst_in_0) 
  begin
	qoxksqguoijxmnhjndul_85 <= 1'b0 ;
   end
  else
  begin
		qoxksqguoijxmnhjndul_85 <= jisxwh6hz8m6lk6etym8q0o_396 ;
  end
end

always @(posedge clk_out_5)
begin
  if (rst_in_0) 
  begin
	aafv8aidobp6i4ko3n_162 <= 1'b0 ;
   end
  else
  begin
		aafv8aidobp6i4ko3n_162 <= h6xcjqe6lrp52rlqt4aw5r_597 ;
  end
end

defparam lc9de03p7z6gbbgv2z39u8spo1qau_2326.DataBits = 266; 
defparam lc9de03p7z6gbbgv2z39u8spo1qau_2326.AddrBits = 9; 
defparam lc9de03p7z6gbbgv2z39u8spo1qau_2326.AFullAssert_0 = 17; 
defparam lc9de03p7z6gbbgv2z39u8spo1qau_2326.AFullNegate_0 = 17; 

PPP_SCFifo lc9de03p7z6gbbgv2z39u8spo1qau_2326 (
	.WrEnb(ubp00m4c1p575v1y79b49c_457),
	.WrData(et1pk1yh8f730z9ue3bd_628),
	.RdEnb(p6pogzes0n13mlyp_555),


	.RdVal(c3j2pwu8mu17mj5asr9u6z9aiml_209), 
	.RdData(leu4q6zgncpzmilenh_270), 
	.Empty(vqmfrzqpnzkd5kwov8z6za_777), 
	.AFull_0(r65yhiefqqxqetpj3vf7gmrlgiy8h_285), 
	.Full(tf43glf7ui0o3rcdxgutsg2_143), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam ihvaaib8qxne09dvmcex_1872.DscBits = 1; 
defparam ihvaaib8qxne09dvmcex_1872.BufSize = 512; 
defparam ihvaaib8qxne09dvmcex_1872.CntBits = 9; 

PPP_DscSCBuf ihvaaib8qxne09dvmcex_1872 (
	.DscSkip(xlkvey04hjzbz6hju_361),
	.RdVal(a0i6ekdsupuaemivnzuirzz5oew1g_137),
	.RdData(d0xnbh3adk6xq7q2amxrz3n5bfrq_268),
	.Empty(dphs2r7me22t5yzfabxp485ch_822),


	.DscVal(aa4o0da7rbu1zh0i7yu36i7m_690), 
	.DscData(lpxzx8166bg3wnjb_624), 
	.RdEnb(ansreinyrdkcdlwwlieqll_809), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam o1kfyxvur74t3kh5qtzavnu6a1_1330.DataBits = 1; 
defparam o1kfyxvur74t3kh5qtzavnu6a1_1330.AddrBits = 9; 
defparam o1kfyxvur74t3kh5qtzavnu6a1_1330.AFullAssert_0 = 256; 
defparam o1kfyxvur74t3kh5qtzavnu6a1_1330.AFullNegate_0 = 256; 

PPP_SCFifo o1kfyxvur74t3kh5qtzavnu6a1_1330 (
	.WrEnb(fo7rli0ao5ul967h864cqwgie0_432),
	.WrData(x5p1kshj5zm60wqx9_252),
	.RdEnb(k4n3bpvcg6m4uxwrk9pdir8bam0_814),


	.RdVal(qb3sjqeu1rclrd80aphmpqxfvp42jg_323), 
	.RdData(lsosh18mafuqxdid_141), 
	.Empty(f4rmi7neqvpq6m9cpndxthbv_270), 
	.AFull_0(drijtsgszukvdhm0_464), 
	.Full(qualqqxmxxyn5nz5n64snbhz60ajk_871), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam h0n753t6gf5k6ccmqdh2_1509.DataBits = 49; 
defparam h0n753t6gf5k6ccmqdh2_1509.AddrBits = 9; 
defparam h0n753t6gf5k6ccmqdh2_1509.AFullAssert_0 = 9; 
defparam h0n753t6gf5k6ccmqdh2_1509.AFullNegate_0 = 9; 

PPP_SCFifo h0n753t6gf5k6ccmqdh2_1509 (
	.WrEnb(n6kvci64hfjmwyjffnrigqv5s_698),
	.WrData(g9yjjwoocex67a9dbbbqc_289),
	.RdEnb(td317abvlk8cp86fo56mo3h_590),


	.RdVal(n6wgbgakmthz0tspyqijh9y_525), 
	.RdData(nzpldsyi9wxl1gzwd3liua1b_312), 
	.Empty(dspv2dt9xuc28o3bwhxfgqkdk530896g_377), 
	.AFull_0(vh4dlfguyhpm47gzc8_537), 
	.Full(zkhgbhjxv263r51ckj07jaboxvm9fs7_69), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

defparam l5jinod5iml3qidfy0_2175.DataBits = 4; 
defparam l5jinod5iml3qidfy0_2175.AddrBits = 9; 
defparam l5jinod5iml3qidfy0_2175.AFullAssert_0 = 9; 
defparam l5jinod5iml3qidfy0_2175.AFullNegate_0 = 9; 

PPP_SCFifo l5jinod5iml3qidfy0_2175 (
	.WrEnb(z8q08tdptc1ch2eso6ym83z4yg1jbn_679),
	.WrData(psloovzo1za5xil6jmie86ykacvczki_577),
	.RdEnb(bnefksdbsw1f3ynghzbp7dyy2_440),


	.RdVal(zeue0bugfmo85dsvff8whcyxcxy_611), 
	.RdData(z50fbce180yx8giwvx8m4_239), 
	.Empty(o4tuumpexbnettx26w9ccity7nvn_739), 
	.AFull_0(o574xwoc6zq9clq1q192gy6yhurcqz_186), 
	.Full(zzajr2bulmbz0oejgxdpu8w_486), 

	.WrClk(clk_in_2), 

	.RdClk(clk_out_2), 

	.WrRst(rst_in_2), 
	.RdRst(rst_out_2) 
); 

defparam f83l5pvp2vf21vsgzootm95vw2_452.DataBits = 26; 
defparam f83l5pvp2vf21vsgzootm95vw2_452.AddrBits = 9; 
defparam f83l5pvp2vf21vsgzootm95vw2_452.AFullAssert_0 = 9; 
defparam f83l5pvp2vf21vsgzootm95vw2_452.AFullNegate_0 = 9; 

PPP_SCFifo f83l5pvp2vf21vsgzootm95vw2_452 (
	.WrEnb(ls36hc71qdf8v9eaykg22ssw145tuxdi_683),
	.WrData(q2jws0y9zglb585i75z_364),
	.RdEnb(enchrhonnnm4vf3lz4032_416),


	.RdVal(o8s7k34stra4yhzle9qfat8rhgwde_254), 
	.RdData(ams6jf7r8hiz3jprmc99mefn2q22qm_508), 
	.Empty(vmw9u647ndnczd4lnr1b3b6_418), 
	.AFull_0(im5rvsfqtkavbv61kx4xv3tib1g_868), 
	.Full(hbp348eakbx63kzmmy8n7scxys_491), 

	.WrClk(clk_in_3), 

	.RdClk(clk_out_3), 

	.WrRst(rst_in_3), 
	.RdRst(rst_out_3) 
); 

defparam saujnn54l5k0ycv5g98_2224.DataBits = 200; 
defparam saujnn54l5k0ycv5g98_2224.AddrBits = 9; 
defparam saujnn54l5k0ycv5g98_2224.AFullAssert_0 = 9; 
defparam saujnn54l5k0ycv5g98_2224.AFullNegate_0 = 9; 

PPP_SCFifo saujnn54l5k0ycv5g98_2224 (
	.WrEnb(hem4ztdh4ow8yswl0spuq019x_470),
	.WrData(xaw0d01axbcyax6ap48dud5l6n0dzj3r_588),
	.RdEnb(rhqc35v3vzw18ti9w18ayu_226),


	.RdVal(ujo5gmwm12cn629c171ndcdwmh_350), 
	.RdData(c7mxq1z7yi4fonjoa4yzx_133), 
	.Empty(xzql0tdasazfnid50d_590), 
	.AFull_0(jisxwh6hz8m6lk6etym8q0o_396), 
	.Full(xi10v4nyqso188j5_702), 

	.WrClk(clk_in_4), 

	.RdClk(clk_out_4), 

	.WrRst(rst_in_4), 
	.RdRst(rst_out_4) 
); 

defparam a8a1znj67t1yxvi3ck_1463.DataBits = 64; 
defparam a8a1znj67t1yxvi3ck_1463.AddrBits = 9; 
defparam a8a1znj67t1yxvi3ck_1463.AFullAssert_0 = 9; 
defparam a8a1znj67t1yxvi3ck_1463.AFullNegate_0 = 9; 

PPP_SCFifo a8a1znj67t1yxvi3ck_1463 (
	.WrEnb(w3tgkr6e41lakjid7bdszhvvr0lvjpw_887),
	.WrData(iqr6r7muwtkod28chno46oi_896),
	.RdEnb(m7ecamwik3nui9oiez76kycrshon9_373),


	.RdVal(yumx40kqirag24d3pzf05k_450), 
	.RdData(c77fbu1sfz70padvlfvi0ep9sri_199), 
	.Empty(dvtzw4qssc4k4np7pnc9f_472), 
	.AFull_0(h6xcjqe6lrp52rlqt4aw5r_597), 
	.Full(fftr955nosq3zpq7i_87), 

	.WrClk(clk_in_5), 

	.RdClk(clk_out_5), 

	.WrRst(rst_in_5), 
	.RdRst(rst_out_5) 
); 

endmodule 

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
// File name: S_SYNCER_for_domain_ac.v
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_domain_ac (
     packet_in_PACKET1_SOF, 
     packet_in_PACKET1_EOF, 
     packet_in_PACKET1_VAL, 
     packet_in_PACKET1_DAT, 
     packet_in_PACKET1_CNT, 
     packet_in_PACKET1_ERR, 
     packet_out_PACKET1_RDY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE2_VALID, 
     tuple_in_TUPLE2_DATA, 
     tuple_in_TUPLE3_VALID, 
     tuple_in_TUPLE3_DATA, 
     tuple_in_TUPLE4_VALID, 
     tuple_in_TUPLE4_DATA, 
     tuple_in_TUPLE5_VALID, 
     tuple_in_TUPLE5_DATA, 
     tuple_in_TUPLE7_VALID, 
     tuple_in_TUPLE7_DATA, 
     backpressure_in, 


     packet_out_PACKET1_SOF, 
     packet_out_PACKET1_EOF, 
     packet_out_PACKET1_VAL, 
     packet_out_PACKET1_DAT, 
     packet_out_PACKET1_CNT, 
     packet_out_PACKET1_ERR, 
     packet_in_PACKET1_RDY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
     tuple_out_TUPLE2_VALID, 
     tuple_out_TUPLE2_DATA, 
     tuple_out_TUPLE3_VALID, 
     tuple_out_TUPLE3_DATA, 
     tuple_out_TUPLE4_VALID, 
     tuple_out_TUPLE4_DATA, 
     tuple_out_TUPLE5_VALID, 
     tuple_out_TUPLE5_DATA, 
     tuple_out_TUPLE7_VALID, 
     tuple_out_TUPLE7_DATA, 
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
     clk_in_6, 
     clk_out_6, 
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
     rst_out_5, 
     rst_in_6, 
     rst_out_6 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET1_SOF ;
 input		packet_in_PACKET1_EOF ;
 input		packet_in_PACKET1_VAL ;
 input	 [255:0] packet_in_PACKET1_DAT ;
 input	 [5:0] packet_in_PACKET1_CNT ;
 input		packet_in_PACKET1_ERR ;
 input		packet_out_PACKET1_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [25:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE2_VALID ;
 input	 [2:0] tuple_in_TUPLE2_DATA ;
 input		tuple_in_TUPLE3_VALID ;
 input	 [3:0] tuple_in_TUPLE3_DATA ;
 input		tuple_in_TUPLE4_VALID ;
 input	 [199:0] tuple_in_TUPLE4_DATA ;
 input		tuple_in_TUPLE5_VALID ;
 input	 [31:0] tuple_in_TUPLE5_DATA ;
 input		tuple_in_TUPLE7_VALID ;
 input	 [63:0] tuple_in_TUPLE7_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET1_SOF ;
 output		packet_out_PACKET1_EOF ;
 output		packet_out_PACKET1_VAL ;
 output	 [255:0] packet_out_PACKET1_DAT ;
 output	 [5:0] packet_out_PACKET1_CNT ;
 output		packet_out_PACKET1_ERR ;
 output		packet_in_PACKET1_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [25:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE2_VALID ;
 output	 [2:0] tuple_out_TUPLE2_DATA ;
 output		tuple_out_TUPLE3_VALID ;
 output	 [3:0] tuple_out_TUPLE3_DATA ;
 output		tuple_out_TUPLE4_VALID ;
 output	 [199:0] tuple_out_TUPLE4_DATA ;
 output		tuple_out_TUPLE5_VALID ;
 output	 [31:0] tuple_out_TUPLE5_DATA ;
 output		tuple_out_TUPLE7_VALID ;
 output	 [63:0] tuple_out_TUPLE7_DATA ;
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
 input		clk_in_6 ;
 input		clk_out_6 ;
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
 input		rst_in_6 ;
 input		rst_out_6 ;






 wire	nq7chab4x1nsulpterzsh7w0i6nwbtm_130 ;
 wire [265:0] zkop81cwbyenpltyy5_127 ;
 wire	lqvf4p5ci4q61u2uf_362 ;
 wire	bo3ih40yk7uy0cz18p9_25 ;
 wire	viqims1i8pez2ra16jc8vsbce4l6gtm_591 ;
 reg	n30wj35n35oyltr8_397 ;
 wire	xsawnh85htvzb9ql4eve9cafi28_251 ;
 wire [0:0] gif2jr7d7ouq9rt6259nupnq_872 ;
 wire	xh2f9veivvbqqd2nhzftkce7s4ql_134 ;
 wire	tsqg6iqc921fgncat2sjf_43 ;
 wire [0:0] eczrh7a6gjc2h6fqqe_375 ;
 wire	hggfmsi78nz5jp9s9jjboap8ug_880 ;
 wire	gafnxkx2p4ubhmdqm84uprrupp_794 ;
 wire	up2b13c3xsx52ul3wfe2_811 ;
 wire	nyoiqvefxxu57lc8w63_413 ;
 wire [25:0] cah8n0dq5995xq1q3_472 ;
 wire	qhvnedwp0qs2e7ygj64by_192 ;
 wire	lgxv0nycgivi1hd8wabpxbohna_666 ;
 wire	quhv1neoz7z7w02c3l_136 ;
 wire	v8gn23424h8yf5j05rekr2em_504 ;
 wire [2:0] hf44md7anhvc9hs7q70tuk0ym9_7 ;
 wire	kyk080laabh7b6y9ddzagnig1_467 ;
 wire	ihxb05ffd78zh3xfkh2a7prrghvbs_667 ;
 wire	lajljciq5bfsu3ph2ciaki7lw5aua_562 ;
 wire	ozazy1fk7zjzglmmsbzm_511 ;
 wire [3:0] wol40pdc1vxcbj6969ze345_807 ;
 wire	cmuqhoklir3ao9cld2piqcg18khkkp_475 ;
 wire	yggfrqpukm5u83y7ap8o4scqgnbun4m_39 ;
 wire	kl9h6cfekaedpf8gd2wil8rma_774 ;
 wire	tj2kd9fxoz97kh8kswul3z0mpj_324 ;
 wire [199:0] lc0aooqpez43rox85_88 ;
 wire	hldumcm9nevny6iqqqz_476 ;
 wire	j6qwzxg228xl008ouvy5cin8thj5w_768 ;
 wire	ff2i3suntzd8bzfhhcj05ga4n_596 ;
 wire	qg7uq7rz3so0x0pyfejm_617 ;
 wire [31:0] dpe4e0sfct8ru9jzoh1_606 ;
 wire	wbljwldapq4q45zp58yp1l5jtl_298 ;
 wire	vwq4todf69na2sn9wzuv_901 ;
 wire	nprcnusq7rh3ofzk9gqe3u1om0919_469 ;
 wire	w1uw93t3duqo5htw964yux_573 ;
 wire [63:0] nxvxxh547t6x5yss23uxos2vhy8suhqh_810 ;
 wire	cmjb5vm1eg97n48fw_41 ;
 wire	uw436znt1ywt8fljxqw5po_189 ;
 wire	ieqmtz68ajoy08166em7gwipsw3_300 ;
 reg	hdvez1jy61m6fmqrpbdg_849 ;
 reg	jqxom1du53je6v1e56c9vy1z93vbti_390 ;
 reg	zl2ubhagns9slgvfvx7esh3g3y1mcne4_111 ;
 reg	oowpxmje1k5q8sw85j4ae55ygqrai25_502 ;
 reg	yjqux5jt870nvsss8vmi5nv5wbzs3_474 ;
 reg	lz8hkbdfjxrajsepk2m57qydm169819j_497 ;
 reg	z9gf9kurq9moula24cgohdf6ah_654 ;
 wire	iuswg48u0q47eml657x0d5bqi3jk5zfs_540 ;
 wire [265:0] sbbtepon56fv1md5v222g5bbzbgw_330 ;
 wire	cgxeo2iun5602bvc05_422 ;
 wire [265:0] fukpmcgwdnraq1b4_557 ;
 wire	rn3cz6wi46hzwpmt_373 ;
 wire	mv50l8if3q2q6i4zh3a936et9z8yg74s_185 ;
 wire	bnc4tw3jol1q2ch5xa3_600 ;
 wire	nj52bvlzrb8duo6d09zn4_217 ;
 wire	s5ekpumnchksbvhtyii4235etav_319 ;
 wire [5:0] sr9y1ybkcwohevklbeymuekv0_517 ;
 wire [255:0] s66hcnucl1benzys_902 ;
 wire	rs1pyn3vh4qk5itz_192 ;
 wire	s31dx06d5m8s5iez1jv_137 ;
 wire	jalpeacqt1lo5p8qkw_704 ;
 wire	dt585ceaiub9xtb09fwf373_474 ;
 wire	swnwmy68c6b2jqfs9by38hl13j4_181 ;
 wire	q6ua1tmtidzbh00eopekchahfwr8u7am_118 ;
 wire	vf0q0a8u5lyl6tijnzes69taqcefv_459 ;
 wire [0:0] iv72l7szet2msmahzzxtesnrr_329 ;
 wire	sha0b8a0igjr2zmfz_82 ;
 wire	ul5unp241xyvt2gm_426 ;
 wire	n5ylg8qnpqjtf8coveb3x_270 ;
 wire	fm65wybk82x48k92srulrjpek2df_838 ;
 wire	h509p4c9m8peo7pde23rv_626 ;
 wire	swlvhvi9svw1bsof189n8cs_192 ;
 wire [0:0] ppyd38ur78s7yugq8do17qv50r_747 ;
 wire	tn78wjl0v8a5byemai9cktsuds3e9_889 ;
 wire	zizpxqr3rnjyy5b8u3sssg_518 ;
 wire	l7do9m2ux4waws4960_302 ;
 wire	snixhtdvsbu6ltzmm4_561 ;
 wire	gjytcxgf2yk27sq3glpm2x4dpz2_203 ;
 wire	isa1f7wi40phpt7v26glw_706 ;
 wire [25:0] grv1rlnepx50cj2u1pim75aot_131 ;
 wire	gctgtlq6epdf2fsje1pbh5n_616 ;
 wire [25:0] bwyrvnd2xggfjk3z8f7qz3i3rf5hy349_755 ;
 wire	dv71oz6jbw41a8ccmqsmgwjvu_494 ;
 wire	gmlz08cnofnelqdthww0mw2va1wbj6_29 ;
 wire [2:0] a4h79b6aic4f57p4mknpm6yfx_84 ;
 wire	qcxjhna7jm7g7u1y9nwst7478842d2_777 ;
 wire [2:0] m625xulfh91370wy0qqqmve_326 ;
 wire	v9vg1oxgeb1l8c50l3f6prbljg5b_141 ;
 wire	pktd4cf01q20eejt0a4n2t95ttuxq_582 ;
 wire [3:0] wspub3w1gov112ofj_785 ;
 wire	l2560p4yz362vsddv9kiug_519 ;
 wire [3:0] xqv03pkd27m5ebwf9g92wog9k0jtp_523 ;
 wire	ubi57ms3888f1ka86gtbuv65_577 ;
 wire	d6xtwh744s6282xy3auos2epnplsksb_209 ;
 wire [199:0] dw7bnrml9n1gehv6lmyc1syu1gb212_328 ;
 wire	g3nvhhizuq32jrqo0z5vl6oz_752 ;
 wire [199:0] l0l04sk9vt6727fp2j8qo9o4e_188 ;
 wire	p6j143fq4d5qyos5e4yo_639 ;
 wire	aka9xxp7h6jonp0g2mze8hrzvkxk6uv9_192 ;
 wire [31:0] h3443hxtnco3z80t2s_71 ;
 wire	ne807z138s1y9xiu_705 ;
 wire [31:0] sxubxzj5t08mcm9i2cut5iny_165 ;
 wire	d2g0opqusswyg31vq9n2zksc5niefzb_123 ;
 wire	dri9a2guc5k8ymxk4_141 ;
 wire [63:0] hgskbrd095kmf7n1188fr64bxyhv9bd_875 ;
 wire	wo0zsd7cmv0hn6gm5imfgsj8r8l_651 ;
 wire [63:0] po0gi3291xd0yki0gxpezv1v_629 ;
 wire	fbs44bvxdh4zkcs05jgffyql5_650 ;
 wire	m5w8bshuehfkl66ww_352 ;
 wire	w7kjx4ogg7bmj0et7227jo5sf48pcgpv_216 ;
 wire	b8jyjfqozghq87hn364xfj3jhvir73tg_668 ;


 assign iuswg48u0q47eml657x0d5bqi3jk5zfs_540 = 
	 ~(backpressure_in) ;
 assign sbbtepon56fv1md5v222g5bbzbgw_330 = 
	{packet_in_PACKET1_SOF, packet_in_PACKET1_EOF, packet_in_PACKET1_VAL, packet_in_PACKET1_DAT, packet_in_PACKET1_CNT, packet_in_PACKET1_ERR} ;
 assign cgxeo2iun5602bvc05_422 	= packet_in_PACKET1_VAL ;
 assign fukpmcgwdnraq1b4_557 	= sbbtepon56fv1md5v222g5bbzbgw_330[265:0] ;
 assign rn3cz6wi46hzwpmt_373 = 
	fm65wybk82x48k92srulrjpek2df_838 | w7kjx4ogg7bmj0et7227jo5sf48pcgpv_216 ;
 assign mv50l8if3q2q6i4zh3a936et9z8yg74s_185 = 
	iuswg48u0q47eml657x0d5bqi3jk5zfs_540 & ul5unp241xyvt2gm_426 & rn3cz6wi46hzwpmt_373 ;
 assign bnc4tw3jol1q2ch5xa3_600 	= mv50l8if3q2q6i4zh3a936et9z8yg74s_185 ;
 assign nj52bvlzrb8duo6d09zn4_217 = 
	 ~(lqvf4p5ci4q61u2uf_362) ;
 assign s5ekpumnchksbvhtyii4235etav_319 	= zkop81cwbyenpltyy5_127[0] ;
 assign sr9y1ybkcwohevklbeymuekv0_517 	= zkop81cwbyenpltyy5_127[6:1] ;
 assign s66hcnucl1benzys_902 	= zkop81cwbyenpltyy5_127[262:7] ;
 assign rs1pyn3vh4qk5itz_192 	= zkop81cwbyenpltyy5_127[263] ;
 assign s31dx06d5m8s5iez1jv_137 	= zkop81cwbyenpltyy5_127[264] ;
 assign jalpeacqt1lo5p8qkw_704 	= zkop81cwbyenpltyy5_127[265] ;
 assign dt585ceaiub9xtb09fwf373_474 = 
	n30wj35n35oyltr8_397 & rs1pyn3vh4qk5itz_192 ;
 assign swnwmy68c6b2jqfs9by38hl13j4_181 	= mv50l8if3q2q6i4zh3a936et9z8yg74s_185 ;
 assign q6ua1tmtidzbh00eopekchahfwr8u7am_118 	= swnwmy68c6b2jqfs9by38hl13j4_181 ;
 assign vf0q0a8u5lyl6tijnzes69taqcefv_459 	= zizpxqr3rnjyy5b8u3sssg_518 ;
 assign iv72l7szet2msmahzzxtesnrr_329 = l7do9m2ux4waws4960_302 ;
 assign sha0b8a0igjr2zmfz_82 	= snixhtdvsbu6ltzmm4_561 ;
 assign ul5unp241xyvt2gm_426 	= xsawnh85htvzb9ql4eve9cafi28_251 ;
 assign n5ylg8qnpqjtf8coveb3x_270 = gif2jr7d7ouq9rt6259nupnq_872 ;
 assign fm65wybk82x48k92srulrjpek2df_838 = 
	 ~(n5ylg8qnpqjtf8coveb3x_270) ;
 assign h509p4c9m8peo7pde23rv_626 	= xh2f9veivvbqqd2nhzftkce7s4ql_134 ;
 assign swlvhvi9svw1bsof189n8cs_192 	= packet_in_PACKET1_VAL ;
 assign ppyd38ur78s7yugq8do17qv50r_747 = packet_in_PACKET1_SOF ;
 assign tn78wjl0v8a5byemai9cktsuds3e9_889 	= h509p4c9m8peo7pde23rv_626 ;
 assign zizpxqr3rnjyy5b8u3sssg_518 	= tsqg6iqc921fgncat2sjf_43 ;
 assign l7do9m2ux4waws4960_302 = eczrh7a6gjc2h6fqqe_375 ;
 assign snixhtdvsbu6ltzmm4_561 	= hggfmsi78nz5jp9s9jjboap8ug_880 ;
 assign gjytcxgf2yk27sq3glpm2x4dpz2_203 = 
	 ~(hggfmsi78nz5jp9s9jjboap8ug_880) ;
 assign isa1f7wi40phpt7v26glw_706 = 
	iuswg48u0q47eml657x0d5bqi3jk5zfs_540 & w7kjx4ogg7bmj0et7227jo5sf48pcgpv_216 & ul5unp241xyvt2gm_426 & n5ylg8qnpqjtf8coveb3x_270 ;
 assign grv1rlnepx50cj2u1pim75aot_131 = 
	tuple_in_TUPLE0_DATA ;
 assign gctgtlq6epdf2fsje1pbh5n_616 	= tuple_in_TUPLE0_VALID ;
 assign bwyrvnd2xggfjk3z8f7qz3i3rf5hy349_755 	= grv1rlnepx50cj2u1pim75aot_131[25:0] ;
 assign dv71oz6jbw41a8ccmqsmgwjvu_494 = 
	 ~(qhvnedwp0qs2e7ygj64by_192) ;
 assign gmlz08cnofnelqdthww0mw2va1wbj6_29 	= isa1f7wi40phpt7v26glw_706 ;
 assign a4h79b6aic4f57p4mknpm6yfx_84 = 
	tuple_in_TUPLE2_DATA ;
 assign qcxjhna7jm7g7u1y9nwst7478842d2_777 	= tuple_in_TUPLE2_VALID ;
 assign m625xulfh91370wy0qqqmve_326 	= a4h79b6aic4f57p4mknpm6yfx_84[2:0] ;
 assign v9vg1oxgeb1l8c50l3f6prbljg5b_141 = 
	 ~(kyk080laabh7b6y9ddzagnig1_467) ;
 assign pktd4cf01q20eejt0a4n2t95ttuxq_582 	= isa1f7wi40phpt7v26glw_706 ;
 assign wspub3w1gov112ofj_785 = 
	tuple_in_TUPLE3_DATA ;
 assign l2560p4yz362vsddv9kiug_519 	= tuple_in_TUPLE3_VALID ;
 assign xqv03pkd27m5ebwf9g92wog9k0jtp_523 	= wspub3w1gov112ofj_785[3:0] ;
 assign ubi57ms3888f1ka86gtbuv65_577 = 
	 ~(cmuqhoklir3ao9cld2piqcg18khkkp_475) ;
 assign d6xtwh744s6282xy3auos2epnplsksb_209 	= isa1f7wi40phpt7v26glw_706 ;
 assign dw7bnrml9n1gehv6lmyc1syu1gb212_328 = 
	tuple_in_TUPLE4_DATA ;
 assign g3nvhhizuq32jrqo0z5vl6oz_752 	= tuple_in_TUPLE4_VALID ;
 assign l0l04sk9vt6727fp2j8qo9o4e_188 	= dw7bnrml9n1gehv6lmyc1syu1gb212_328[199:0] ;
 assign p6j143fq4d5qyos5e4yo_639 = 
	 ~(hldumcm9nevny6iqqqz_476) ;
 assign aka9xxp7h6jonp0g2mze8hrzvkxk6uv9_192 	= isa1f7wi40phpt7v26glw_706 ;
 assign h3443hxtnco3z80t2s_71 = 
	tuple_in_TUPLE5_DATA ;
 assign ne807z138s1y9xiu_705 	= tuple_in_TUPLE5_VALID ;
 assign sxubxzj5t08mcm9i2cut5iny_165 	= h3443hxtnco3z80t2s_71[31:0] ;
 assign d2g0opqusswyg31vq9n2zksc5niefzb_123 = 
	 ~(wbljwldapq4q45zp58yp1l5jtl_298) ;
 assign dri9a2guc5k8ymxk4_141 	= isa1f7wi40phpt7v26glw_706 ;
 assign hgskbrd095kmf7n1188fr64bxyhv9bd_875 = 
	tuple_in_TUPLE7_DATA ;
 assign wo0zsd7cmv0hn6gm5imfgsj8r8l_651 	= tuple_in_TUPLE7_VALID ;
 assign po0gi3291xd0yki0gxpezv1v_629 	= hgskbrd095kmf7n1188fr64bxyhv9bd_875[63:0] ;
 assign fbs44bvxdh4zkcs05jgffyql5_650 = 
	 ~(cmjb5vm1eg97n48fw_41) ;
 assign m5w8bshuehfkl66ww_352 	= isa1f7wi40phpt7v26glw_706 ;
 assign w7kjx4ogg7bmj0et7227jo5sf48pcgpv_216 = 
	nj52bvlzrb8duo6d09zn4_217 & dv71oz6jbw41a8ccmqsmgwjvu_494 & v9vg1oxgeb1l8c50l3f6prbljg5b_141 & ubi57ms3888f1ka86gtbuv65_577 & p6j143fq4d5qyos5e4yo_639 & d2g0opqusswyg31vq9n2zksc5niefzb_123 & fbs44bvxdh4zkcs05jgffyql5_650 ;
 assign b8jyjfqozghq87hn364xfj3jhvir73tg_668 = 
	hdvez1jy61m6fmqrpbdg_849 | jqxom1du53je6v1e56c9vy1z93vbti_390 | zl2ubhagns9slgvfvx7esh3g3y1mcne4_111 | oowpxmje1k5q8sw85j4ae55ygqrai25_502 | yjqux5jt870nvsss8vmi5nv5wbzs3_474 | lz8hkbdfjxrajsepk2m57qydm169819j_497 | z9gf9kurq9moula24cgohdf6ah_654 ;
 assign packet_out_PACKET1_SOF 	= jalpeacqt1lo5p8qkw_704 ;
 assign packet_out_PACKET1_EOF 	= s31dx06d5m8s5iez1jv_137 ;
 assign packet_out_PACKET1_VAL 	= dt585ceaiub9xtb09fwf373_474 ;
 assign packet_out_PACKET1_DAT 	= s66hcnucl1benzys_902[255:0] ;
 assign packet_out_PACKET1_CNT 	= sr9y1ybkcwohevklbeymuekv0_517[5:0] ;
 assign packet_out_PACKET1_ERR 	= s5ekpumnchksbvhtyii4235etav_319 ;
 assign packet_in_PACKET1_RDY 	= packet_out_PACKET1_RDY ;
 assign tuple_out_TUPLE0_VALID 	= nyoiqvefxxu57lc8w63_413 ;
 assign tuple_out_TUPLE0_DATA 	= cah8n0dq5995xq1q3_472[25:0] ;
 assign tuple_out_TUPLE2_VALID 	= v8gn23424h8yf5j05rekr2em_504 ;
 assign tuple_out_TUPLE2_DATA 	= hf44md7anhvc9hs7q70tuk0ym9_7[2:0] ;
 assign tuple_out_TUPLE3_VALID 	= ozazy1fk7zjzglmmsbzm_511 ;
 assign tuple_out_TUPLE3_DATA 	= wol40pdc1vxcbj6969ze345_807[3:0] ;
 assign tuple_out_TUPLE4_VALID 	= tj2kd9fxoz97kh8kswul3z0mpj_324 ;
 assign tuple_out_TUPLE4_DATA 	= lc0aooqpez43rox85_88[199:0] ;
 assign tuple_out_TUPLE5_VALID 	= qg7uq7rz3so0x0pyfejm_617 ;
 assign tuple_out_TUPLE5_DATA 	= dpe4e0sfct8ru9jzoh1_606[31:0] ;
 assign tuple_out_TUPLE7_VALID 	= w1uw93t3duqo5htw964yux_573 ;
 assign tuple_out_TUPLE7_DATA 	= nxvxxh547t6x5yss23uxos2vhy8suhqh_810[63:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	n30wj35n35oyltr8_397 <= 1'b0 ;
	hdvez1jy61m6fmqrpbdg_849 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		n30wj35n35oyltr8_397 <= mv50l8if3q2q6i4zh3a936et9z8yg74s_185 ;
		hdvez1jy61m6fmqrpbdg_849 <= bo3ih40yk7uy0cz18p9_25 ;
		backpressure_out <= b8jyjfqozghq87hn364xfj3jhvir73tg_668 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	jqxom1du53je6v1e56c9vy1z93vbti_390 <= 1'b0 ;
   end
  else
  begin
		jqxom1du53je6v1e56c9vy1z93vbti_390 <= lgxv0nycgivi1hd8wabpxbohna_666 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	zl2ubhagns9slgvfvx7esh3g3y1mcne4_111 <= 1'b0 ;
   end
  else
  begin
		zl2ubhagns9slgvfvx7esh3g3y1mcne4_111 <= ihxb05ffd78zh3xfkh2a7prrghvbs_667 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	oowpxmje1k5q8sw85j4ae55ygqrai25_502 <= 1'b0 ;
   end
  else
  begin
		oowpxmje1k5q8sw85j4ae55ygqrai25_502 <= yggfrqpukm5u83y7ap8o4scqgnbun4m_39 ;
  end
end

always @(posedge clk_out_4)
begin
  if (rst_in_0) 
  begin
	yjqux5jt870nvsss8vmi5nv5wbzs3_474 <= 1'b0 ;
   end
  else
  begin
		yjqux5jt870nvsss8vmi5nv5wbzs3_474 <= j6qwzxg228xl008ouvy5cin8thj5w_768 ;
  end
end

always @(posedge clk_out_5)
begin
  if (rst_in_0) 
  begin
	lz8hkbdfjxrajsepk2m57qydm169819j_497 <= 1'b0 ;
   end
  else
  begin
		lz8hkbdfjxrajsepk2m57qydm169819j_497 <= vwq4todf69na2sn9wzuv_901 ;
  end
end

always @(posedge clk_out_6)
begin
  if (rst_in_0) 
  begin
	z9gf9kurq9moula24cgohdf6ah_654 <= 1'b0 ;
   end
  else
  begin
		z9gf9kurq9moula24cgohdf6ah_654 <= uw436znt1ywt8fljxqw5po_189 ;
  end
end

defparam u33g0okx158thb3zvcbv58_2448.DataBits = 266; 
defparam u33g0okx158thb3zvcbv58_2448.AddrBits = 9; 
defparam u33g0okx158thb3zvcbv58_2448.AFullAssert_0 = 50; 
defparam u33g0okx158thb3zvcbv58_2448.AFullNegate_0 = 50; 

PPP_SCFifo u33g0okx158thb3zvcbv58_2448 (
	.WrEnb(cgxeo2iun5602bvc05_422),
	.WrData(fukpmcgwdnraq1b4_557),
	.RdEnb(bnc4tw3jol1q2ch5xa3_600),


	.RdVal(nq7chab4x1nsulpterzsh7w0i6nwbtm_130), 
	.RdData(zkop81cwbyenpltyy5_127), 
	.Empty(lqvf4p5ci4q61u2uf_362), 
	.AFull_0(bo3ih40yk7uy0cz18p9_25), 
	.Full(viqims1i8pez2ra16jc8vsbce4l6gtm_591), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam clfubqy79iep5mael7c_2143.DscBits = 1; 
defparam clfubqy79iep5mael7c_2143.BufSize = 512; 
defparam clfubqy79iep5mael7c_2143.CntBits = 9; 

PPP_DscSCBuf clfubqy79iep5mael7c_2143 (
	.DscSkip(q6ua1tmtidzbh00eopekchahfwr8u7am_118),
	.RdVal(vf0q0a8u5lyl6tijnzes69taqcefv_459),
	.RdData(iv72l7szet2msmahzzxtesnrr_329),
	.Empty(sha0b8a0igjr2zmfz_82),


	.DscVal(xsawnh85htvzb9ql4eve9cafi28_251), 
	.DscData(gif2jr7d7ouq9rt6259nupnq_872), 
	.RdEnb(xh2f9veivvbqqd2nhzftkce7s4ql_134), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam a2cd3g9mdsm84w04d7_2106.DataBits = 1; 
defparam a2cd3g9mdsm84w04d7_2106.AddrBits = 9; 
defparam a2cd3g9mdsm84w04d7_2106.AFullAssert_0 = 256; 
defparam a2cd3g9mdsm84w04d7_2106.AFullNegate_0 = 256; 

PPP_SCFifo a2cd3g9mdsm84w04d7_2106 (
	.WrEnb(swlvhvi9svw1bsof189n8cs_192),
	.WrData(ppyd38ur78s7yugq8do17qv50r_747),
	.RdEnb(tn78wjl0v8a5byemai9cktsuds3e9_889),


	.RdVal(tsqg6iqc921fgncat2sjf_43), 
	.RdData(eczrh7a6gjc2h6fqqe_375), 
	.Empty(hggfmsi78nz5jp9s9jjboap8ug_880), 
	.AFull_0(gafnxkx2p4ubhmdqm84uprrupp_794), 
	.Full(up2b13c3xsx52ul3wfe2_811), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam ypa7xctt86igv6xffz8_839.DataBits = 26; 
defparam ypa7xctt86igv6xffz8_839.AddrBits = 9; 
defparam ypa7xctt86igv6xffz8_839.AFullAssert_0 = 25; 
defparam ypa7xctt86igv6xffz8_839.AFullNegate_0 = 25; 

PPP_SCFifo ypa7xctt86igv6xffz8_839 (
	.WrEnb(gctgtlq6epdf2fsje1pbh5n_616),
	.WrData(bwyrvnd2xggfjk3z8f7qz3i3rf5hy349_755),
	.RdEnb(gmlz08cnofnelqdthww0mw2va1wbj6_29),


	.RdVal(nyoiqvefxxu57lc8w63_413), 
	.RdData(cah8n0dq5995xq1q3_472), 
	.Empty(qhvnedwp0qs2e7ygj64by_192), 
	.AFull_0(lgxv0nycgivi1hd8wabpxbohna_666), 
	.Full(quhv1neoz7z7w02c3l_136), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

defparam ag68pufbblme7a42m05sznd4365r83_2251.DataBits = 3; 
defparam ag68pufbblme7a42m05sznd4365r83_2251.AddrBits = 9; 
defparam ag68pufbblme7a42m05sznd4365r83_2251.AFullAssert_0 = 11; 
defparam ag68pufbblme7a42m05sznd4365r83_2251.AFullNegate_0 = 11; 

PPP_SCFifo ag68pufbblme7a42m05sznd4365r83_2251 (
	.WrEnb(qcxjhna7jm7g7u1y9nwst7478842d2_777),
	.WrData(m625xulfh91370wy0qqqmve_326),
	.RdEnb(pktd4cf01q20eejt0a4n2t95ttuxq_582),


	.RdVal(v8gn23424h8yf5j05rekr2em_504), 
	.RdData(hf44md7anhvc9hs7q70tuk0ym9_7), 
	.Empty(kyk080laabh7b6y9ddzagnig1_467), 
	.AFull_0(ihxb05ffd78zh3xfkh2a7prrghvbs_667), 
	.Full(lajljciq5bfsu3ph2ciaki7lw5aua_562), 

	.WrClk(clk_in_2), 

	.RdClk(clk_out_2), 

	.WrRst(rst_in_2), 
	.RdRst(rst_out_2) 
); 

defparam q4p3ghwvoi3s8x68u6ivx0asmd83nfi_2597.DataBits = 4; 
defparam q4p3ghwvoi3s8x68u6ivx0asmd83nfi_2597.AddrBits = 9; 
defparam q4p3ghwvoi3s8x68u6ivx0asmd83nfi_2597.AFullAssert_0 = 25; 
defparam q4p3ghwvoi3s8x68u6ivx0asmd83nfi_2597.AFullNegate_0 = 25; 

PPP_SCFifo q4p3ghwvoi3s8x68u6ivx0asmd83nfi_2597 (
	.WrEnb(l2560p4yz362vsddv9kiug_519),
	.WrData(xqv03pkd27m5ebwf9g92wog9k0jtp_523),
	.RdEnb(d6xtwh744s6282xy3auos2epnplsksb_209),


	.RdVal(ozazy1fk7zjzglmmsbzm_511), 
	.RdData(wol40pdc1vxcbj6969ze345_807), 
	.Empty(cmuqhoklir3ao9cld2piqcg18khkkp_475), 
	.AFull_0(yggfrqpukm5u83y7ap8o4scqgnbun4m_39), 
	.Full(kl9h6cfekaedpf8gd2wil8rma_774), 

	.WrClk(clk_in_3), 

	.RdClk(clk_out_3), 

	.WrRst(rst_in_3), 
	.RdRst(rst_out_3) 
); 

defparam qbrkjl4bgnqphf0b91616_885.DataBits = 200; 
defparam qbrkjl4bgnqphf0b91616_885.AddrBits = 9; 
defparam qbrkjl4bgnqphf0b91616_885.AFullAssert_0 = 25; 
defparam qbrkjl4bgnqphf0b91616_885.AFullNegate_0 = 25; 

PPP_SCFifo qbrkjl4bgnqphf0b91616_885 (
	.WrEnb(g3nvhhizuq32jrqo0z5vl6oz_752),
	.WrData(l0l04sk9vt6727fp2j8qo9o4e_188),
	.RdEnb(aka9xxp7h6jonp0g2mze8hrzvkxk6uv9_192),


	.RdVal(tj2kd9fxoz97kh8kswul3z0mpj_324), 
	.RdData(lc0aooqpez43rox85_88), 
	.Empty(hldumcm9nevny6iqqqz_476), 
	.AFull_0(j6qwzxg228xl008ouvy5cin8thj5w_768), 
	.Full(ff2i3suntzd8bzfhhcj05ga4n_596), 

	.WrClk(clk_in_4), 

	.RdClk(clk_out_4), 

	.WrRst(rst_in_4), 
	.RdRst(rst_out_4) 
); 

defparam mlcd530dpblipuhvrxvgzcjia42lm_2471.DataBits = 32; 
defparam mlcd530dpblipuhvrxvgzcjia42lm_2471.AddrBits = 9; 
defparam mlcd530dpblipuhvrxvgzcjia42lm_2471.AFullAssert_0 = 25; 
defparam mlcd530dpblipuhvrxvgzcjia42lm_2471.AFullNegate_0 = 25; 

PPP_SCFifo mlcd530dpblipuhvrxvgzcjia42lm_2471 (
	.WrEnb(ne807z138s1y9xiu_705),
	.WrData(sxubxzj5t08mcm9i2cut5iny_165),
	.RdEnb(dri9a2guc5k8ymxk4_141),


	.RdVal(qg7uq7rz3so0x0pyfejm_617), 
	.RdData(dpe4e0sfct8ru9jzoh1_606), 
	.Empty(wbljwldapq4q45zp58yp1l5jtl_298), 
	.AFull_0(vwq4todf69na2sn9wzuv_901), 
	.Full(nprcnusq7rh3ofzk9gqe3u1om0919_469), 

	.WrClk(clk_in_5), 

	.RdClk(clk_out_5), 

	.WrRst(rst_in_5), 
	.RdRst(rst_out_5) 
); 

defparam hl112htsrjvopz1mggc_2393.DataBits = 64; 
defparam hl112htsrjvopz1mggc_2393.AddrBits = 9; 
defparam hl112htsrjvopz1mggc_2393.AFullAssert_0 = 25; 
defparam hl112htsrjvopz1mggc_2393.AFullNegate_0 = 25; 

PPP_SCFifo hl112htsrjvopz1mggc_2393 (
	.WrEnb(wo0zsd7cmv0hn6gm5imfgsj8r8l_651),
	.WrData(po0gi3291xd0yki0gxpezv1v_629),
	.RdEnb(m5w8bshuehfkl66ww_352),


	.RdVal(w1uw93t3duqo5htw964yux_573), 
	.RdData(nxvxxh547t6x5yss23uxos2vhy8suhqh_810), 
	.Empty(cmjb5vm1eg97n48fw_41), 
	.AFull_0(uw436znt1ywt8fljxqw5po_189), 
	.Full(ieqmtz68ajoy08166em7gwipsw3_300), 

	.WrClk(clk_in_6), 

	.RdClk(clk_out_6), 

	.WrRst(rst_in_6), 
	.RdRst(rst_out_6) 
); 

endmodule 

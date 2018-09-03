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
// File name: S_SYNCER_for_qinq_ac.v
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_qinq_ac (
     packet_in_PACKET2_SOF, 
     packet_in_PACKET2_EOF, 
     packet_in_PACKET2_VAL, 
     packet_in_PACKET2_DAT, 
     packet_in_PACKET2_CNT, 
     packet_in_PACKET2_ERR, 
     packet_out_PACKET2_RDY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     tuple_in_TUPLE3_VALID, 
     tuple_in_TUPLE3_DATA, 
     tuple_in_TUPLE4_VALID, 
     tuple_in_TUPLE4_DATA, 
     tuple_in_TUPLE5_VALID, 
     tuple_in_TUPLE5_DATA, 
     tuple_in_TUPLE6_VALID, 
     tuple_in_TUPLE6_DATA, 
     tuple_in_TUPLE8_VALID, 
     tuple_in_TUPLE8_DATA, 
     backpressure_in, 


     packet_out_PACKET2_SOF, 
     packet_out_PACKET2_EOF, 
     packet_out_PACKET2_VAL, 
     packet_out_PACKET2_DAT, 
     packet_out_PACKET2_CNT, 
     packet_out_PACKET2_ERR, 
     packet_in_PACKET2_RDY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
     tuple_out_TUPLE1_VALID, 
     tuple_out_TUPLE1_DATA, 
     tuple_out_TUPLE3_VALID, 
     tuple_out_TUPLE3_DATA, 
     tuple_out_TUPLE4_VALID, 
     tuple_out_TUPLE4_DATA, 
     tuple_out_TUPLE5_VALID, 
     tuple_out_TUPLE5_DATA, 
     tuple_out_TUPLE6_VALID, 
     tuple_out_TUPLE6_DATA, 
     tuple_out_TUPLE8_VALID, 
     tuple_out_TUPLE8_DATA, 
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
     clk_in_7, 
     clk_out_7, 
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
     rst_out_6, 
     rst_in_7, 
     rst_out_7 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET2_SOF ;
 input		packet_in_PACKET2_EOF ;
 input		packet_in_PACKET2_VAL ;
 input	 [255:0] packet_in_PACKET2_DAT ;
 input	 [5:0] packet_in_PACKET2_CNT ;
 input		packet_in_PACKET2_ERR ;
 input		packet_out_PACKET2_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [1:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [25:0] tuple_in_TUPLE1_DATA ;
 input		tuple_in_TUPLE3_VALID ;
 input	 [31:0] tuple_in_TUPLE3_DATA ;
 input		tuple_in_TUPLE4_VALID ;
 input	 [3:0] tuple_in_TUPLE4_DATA ;
 input		tuple_in_TUPLE5_VALID ;
 input	 [199:0] tuple_in_TUPLE5_DATA ;
 input		tuple_in_TUPLE6_VALID ;
 input	 [31:0] tuple_in_TUPLE6_DATA ;
 input		tuple_in_TUPLE8_VALID ;
 input	 [63:0] tuple_in_TUPLE8_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET2_SOF ;
 output		packet_out_PACKET2_EOF ;
 output		packet_out_PACKET2_VAL ;
 output	 [255:0] packet_out_PACKET2_DAT ;
 output	 [5:0] packet_out_PACKET2_CNT ;
 output		packet_out_PACKET2_ERR ;
 output		packet_in_PACKET2_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [1:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [25:0] tuple_out_TUPLE1_DATA ;
 output		tuple_out_TUPLE3_VALID ;
 output	 [31:0] tuple_out_TUPLE3_DATA ;
 output		tuple_out_TUPLE4_VALID ;
 output	 [3:0] tuple_out_TUPLE4_DATA ;
 output		tuple_out_TUPLE5_VALID ;
 output	 [199:0] tuple_out_TUPLE5_DATA ;
 output		tuple_out_TUPLE6_VALID ;
 output	 [31:0] tuple_out_TUPLE6_DATA ;
 output		tuple_out_TUPLE8_VALID ;
 output	 [63:0] tuple_out_TUPLE8_DATA ;
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
 input		clk_in_7 ;
 input		clk_out_7 ;
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
 input		rst_in_7 ;
 input		rst_out_7 ;






 wire	avoei388wa5l2hst_679 ;
 wire [265:0] ysnekmx3upc8knb9s_41 ;
 wire	ae2dgjofzze8zsuos_765 ;
 wire	naucryabim1u8epkhbcmm_453 ;
 wire	z2xdl41ufdqy3y08la7vps5q9kr_572 ;
 reg	zxwof762bmi5kg2ddrcaurnf432mwr_248 ;
 wire	cdsf1jglrmv2i4qdbpkd_195 ;
 wire [0:0] xaw11ac0r5vws2yakh41x_862 ;
 wire	v77xmbcx1v1nf4jd81r0hh_745 ;
 wire	zsou8hnw3obohk9prr7n2i4oavwh6_481 ;
 wire [0:0] cbqjbcs5wuqmz0cbr40yjy_494 ;
 wire	etwydkwfowopzia2xa2rtlmz1_311 ;
 wire	gdby7l8vgly4zpayu4df45g5mu5dc26e_20 ;
 wire	b8gjitx981y34izdve3ihz3xvdy1_92 ;
 wire	m2irgweuo1vfp0qi7fdxx7_478 ;
 wire [1:0] shiqqilusospmwz3a5zbdk83hgw4fvun_496 ;
 wire	msd3a9npmk5frpeb3befiaeu0v02r7_239 ;
 wire	lh8o9b4syp1foisn63ol_159 ;
 wire	a8po233avwtz037l28ja9951hut9g_9 ;
 wire	vpw9yvc2rf0h0944nff_667 ;
 wire [25:0] q4ew4przg3lmbs60rlpmyugys_485 ;
 wire	mj4sub2iq3g9r2q4rf8hy1pwjwx_331 ;
 wire	ggm75cd8t46hmir6htdfrxyq74_39 ;
 wire	rdo80unnankk9u4epapeex5dv2h1x6hz_836 ;
 wire	rkuc1rrhgbowh2q4n6v3y24_661 ;
 wire [31:0] an86q86m8j0qct7m8om_224 ;
 wire	ksdu8n5gh3ub7d1z33_512 ;
 wire	wwzhd43j9a5k3ixqh_99 ;
 wire	sgc7nlwj6dws42zmr0ke7s8pkiow7vp_889 ;
 wire	bduzeggomtcbzo0vbfyfv_65 ;
 wire [3:0] xcdqkico71t9jtbjx4r8iprh2r_763 ;
 wire	rx4a063k4ekxwavppsfpuihqq_486 ;
 wire	eulv04p27ln9d087lg2p_542 ;
 wire	tenel0by8tee75hj6fv_219 ;
 wire	e242cpj8x2dsxakqs_516 ;
 wire [199:0] y1o7gx5z5poebzmrk9a4ftnu_4 ;
 wire	y9x5vfro6oqz7iobw5mfj_561 ;
 wire	j0u8x06ya3ac1xbg46kydoqmfo5s4ep_68 ;
 wire	khxjoqso3qwmupcoqu6_235 ;
 wire	iovqcfjhpr7fr69gx58x1e26v6j_243 ;
 wire [31:0] gxjmntju3a0n23nnkzinq7ly16b5_246 ;
 wire	vij1v8uifsul5tvybf8etexe_393 ;
 wire	qvdytbpjd0xg40et5qt2_837 ;
 wire	e8rp2h879ecjoaia5bou4q69x_441 ;
 wire	i8r1dzwzttkmjhbo56xfnn79ph0xtp_801 ;
 wire [63:0] tlyj5udb52u73yy0s_191 ;
 wire	ihow9yjbbkxxnwh55m33l4e_248 ;
 wire	khje8vbffnd160671ms1kppsqw4w_21 ;
 wire	zxu07npv4njd8ybu5_472 ;
 reg	rutjgi799f35a0br2nbbiul6_257 ;
 reg	as7bgmyshyo1vnu1nmrg8va7bn7d_736 ;
 reg	zm04ssdqdullr7eedbswrr_890 ;
 reg	v1vcxv4abyh6mwis3_681 ;
 reg	wkkysav90w5ruecjnwl5jfqiagn_211 ;
 reg	aknf4wivdoztcog1jlifz8l01_104 ;
 reg	yrelmtfujyabrt3e769_309 ;
 reg	vjndw90ghkux3v056zdet3luteko_53 ;
 wire	dw8w7vcddnkz7b7o8rfivo032ua90knm_559 ;
 wire [265:0] b562u4lkysj3op8esz1d9p7luwmxtd6_252 ;
 wire	nxwab5w5meg1jzqk_459 ;
 wire [265:0] no3pdu9xsuthkbfdea_403 ;
 wire	nt6zij78pxgot6910592ruko_264 ;
 wire	god35by6naggkk1t66wok_536 ;
 wire	jnjsw3eqjy01dq234ve560u_321 ;
 wire	fsj5v3g8dsh1xfkrgr5tmx4x8zub_410 ;
 wire	a9skedqoq7u4gwa03e8rlptcz2cxfq3_407 ;
 wire [5:0] dratni7h3ys7zqd1ic4f0a9fcou2_90 ;
 wire [255:0] czm53zfabv4t9opbvs_390 ;
 wire	oyb52zl87076wtzw8s_192 ;
 wire	imdf8yq2exsb9jc323z56bezg5wsm_615 ;
 wire	nmwum2z6kelxv2u21lzu1a82d75i_529 ;
 wire	z1vpib1djgse40oy4og28wtda8sq_176 ;
 wire	ewew9f8wjp0qbbidbf08_536 ;
 wire	zpd30rmswfc38krk_396 ;
 wire	kl8zcn2e3unj84xix0fswai_524 ;
 wire [0:0] xcogznhefj8awafo_524 ;
 wire	oi1734h4yhcpv456rcgvkkb_526 ;
 wire	h1kw3pyx5a8hwa6d_106 ;
 wire	pbbpo5w45bbls51u_607 ;
 wire	gym3j3yw98k4b5ym35e7u33_78 ;
 wire	lqzz3sypi1wpnz2obucinib3k_796 ;
 wire	g9p96icwo5jweg43a7df2zj_251 ;
 wire [0:0] z2ag8zrktbly9497_860 ;
 wire	bo2uw94ikar7d0nsnt1ax0g_148 ;
 wire	h2gsurymubub72lxqh549ckt6279k_745 ;
 wire	o4eank4vgbp8mkqrlu4xm13hj_604 ;
 wire	ua6o20xoopuk9cvwyo06gqn9qnh9ap_62 ;
 wire	t4avjc1fs1czr8hrmkucoy0b4b6l905_492 ;
 wire	e2gyww48j0gmwfgkl9r_619 ;
 wire [1:0] hmbaj59vvpu26c776dx9q1tqk9qb_731 ;
 wire	u6o9q5q2s30fbw70xqmvlw3wymy_582 ;
 wire [1:0] jgccc13q8ag9hfy7_438 ;
 wire	wircpugbry8v2axe9qrmdp1hjyt_420 ;
 wire	fpdxeajjji1w0i78zdvpg0o3_745 ;
 wire [25:0] hnaoomzkiu7owvzpgs_904 ;
 wire	yu02x82gf9ne3xljoob1zhzxy5ojs4by_731 ;
 wire [25:0] m7hfysriv3twvji0_518 ;
 wire	w3nffuzkhzhmpo59jw3e2idnt_46 ;
 wire	jshio6m4j4tz7l821k8jpg10fzxo_466 ;
 wire [31:0] ct3a2jmbih8uo6jl4q2bhu_733 ;
 wire	k0n63jhd32vwr1zigm3da_587 ;
 wire [31:0] s0jn70prc8t2rlu5qgn4srfxn7_663 ;
 wire	qngurpl8tpe1m3ik02e8nu5w_295 ;
 wire	i6rkie79vqj0vza1u277fq1y7owsvxo_882 ;
 wire [3:0] zz0jwmrwvo3dsmu6p3wl80y_275 ;
 wire	p4i634mri7jkhkwwbvmsf1l78xdcp02_655 ;
 wire [3:0] cuvpmo5ct96yl277lcs23_736 ;
 wire	uhjborcw14pcskuxs5hh6_861 ;
 wire	dezhlz372zxqldnpyybc_872 ;
 wire [199:0] u7bg9ha89yeakc3fuucgg7_558 ;
 wire	q5brirvp4ahf8lb6u_252 ;
 wire [199:0] h9b6q8k5co5f80frn9i284_873 ;
 wire	auo8tom90ks2i7cf12dhbk_407 ;
 wire	d1898b8kmf06u2yrqz4n_441 ;
 wire [31:0] hhargd6hikp3fao0ryukq_294 ;
 wire	ep0bvy5chqb9mgdvk3xd54mr_28 ;
 wire [31:0] fv7bex14zuzjaf5pyji5ohv84kx2_330 ;
 wire	vo8cqgriwptbx4yghfaz1q6sh69_638 ;
 wire	ioro8tw72nf2izyjyapt_200 ;
 wire [63:0] idsg5auwydiq1ciunrx2boxzaz17y_300 ;
 wire	u3oqvkfoqfmbkkee8pc5mb85_307 ;
 wire [63:0] ar4um0wp3vuptepxq03jgqlpqzy_66 ;
 wire	ht3pevomaoj7jlmz1fo_107 ;
 wire	p3pakwan1anpgks8o8z39w3ymtw4_35 ;
 wire	agj2ai79256wnz5s_446 ;
 wire	clo95txj8phijq10fjtmlwc8en_340 ;


 assign dw8w7vcddnkz7b7o8rfivo032ua90knm_559 = 
	 ~(backpressure_in) ;
 assign b562u4lkysj3op8esz1d9p7luwmxtd6_252 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign nxwab5w5meg1jzqk_459 	= packet_in_PACKET2_VAL ;
 assign no3pdu9xsuthkbfdea_403 	= b562u4lkysj3op8esz1d9p7luwmxtd6_252[265:0] ;
 assign nt6zij78pxgot6910592ruko_264 = 
	gym3j3yw98k4b5ym35e7u33_78 | agj2ai79256wnz5s_446 ;
 assign god35by6naggkk1t66wok_536 = 
	dw8w7vcddnkz7b7o8rfivo032ua90knm_559 & h1kw3pyx5a8hwa6d_106 & nt6zij78pxgot6910592ruko_264 ;
 assign jnjsw3eqjy01dq234ve560u_321 	= god35by6naggkk1t66wok_536 ;
 assign fsj5v3g8dsh1xfkrgr5tmx4x8zub_410 = 
	 ~(ae2dgjofzze8zsuos_765) ;
 assign a9skedqoq7u4gwa03e8rlptcz2cxfq3_407 	= ysnekmx3upc8knb9s_41[0] ;
 assign dratni7h3ys7zqd1ic4f0a9fcou2_90 	= ysnekmx3upc8knb9s_41[6:1] ;
 assign czm53zfabv4t9opbvs_390 	= ysnekmx3upc8knb9s_41[262:7] ;
 assign oyb52zl87076wtzw8s_192 	= ysnekmx3upc8knb9s_41[263] ;
 assign imdf8yq2exsb9jc323z56bezg5wsm_615 	= ysnekmx3upc8knb9s_41[264] ;
 assign nmwum2z6kelxv2u21lzu1a82d75i_529 	= ysnekmx3upc8knb9s_41[265] ;
 assign z1vpib1djgse40oy4og28wtda8sq_176 = 
	zxwof762bmi5kg2ddrcaurnf432mwr_248 & oyb52zl87076wtzw8s_192 ;
 assign ewew9f8wjp0qbbidbf08_536 	= god35by6naggkk1t66wok_536 ;
 assign zpd30rmswfc38krk_396 	= ewew9f8wjp0qbbidbf08_536 ;
 assign kl8zcn2e3unj84xix0fswai_524 	= h2gsurymubub72lxqh549ckt6279k_745 ;
 assign xcogznhefj8awafo_524 = o4eank4vgbp8mkqrlu4xm13hj_604 ;
 assign oi1734h4yhcpv456rcgvkkb_526 	= ua6o20xoopuk9cvwyo06gqn9qnh9ap_62 ;
 assign h1kw3pyx5a8hwa6d_106 	= cdsf1jglrmv2i4qdbpkd_195 ;
 assign pbbpo5w45bbls51u_607 = xaw11ac0r5vws2yakh41x_862 ;
 assign gym3j3yw98k4b5ym35e7u33_78 = 
	 ~(pbbpo5w45bbls51u_607) ;
 assign lqzz3sypi1wpnz2obucinib3k_796 	= v77xmbcx1v1nf4jd81r0hh_745 ;
 assign g9p96icwo5jweg43a7df2zj_251 	= packet_in_PACKET2_VAL ;
 assign z2ag8zrktbly9497_860 = packet_in_PACKET2_SOF ;
 assign bo2uw94ikar7d0nsnt1ax0g_148 	= lqzz3sypi1wpnz2obucinib3k_796 ;
 assign h2gsurymubub72lxqh549ckt6279k_745 	= zsou8hnw3obohk9prr7n2i4oavwh6_481 ;
 assign o4eank4vgbp8mkqrlu4xm13hj_604 = cbqjbcs5wuqmz0cbr40yjy_494 ;
 assign ua6o20xoopuk9cvwyo06gqn9qnh9ap_62 	= etwydkwfowopzia2xa2rtlmz1_311 ;
 assign t4avjc1fs1czr8hrmkucoy0b4b6l905_492 = 
	 ~(etwydkwfowopzia2xa2rtlmz1_311) ;
 assign e2gyww48j0gmwfgkl9r_619 = 
	dw8w7vcddnkz7b7o8rfivo032ua90knm_559 & agj2ai79256wnz5s_446 & h1kw3pyx5a8hwa6d_106 & pbbpo5w45bbls51u_607 ;
 assign hmbaj59vvpu26c776dx9q1tqk9qb_731 = 
	tuple_in_TUPLE0_DATA ;
 assign u6o9q5q2s30fbw70xqmvlw3wymy_582 	= tuple_in_TUPLE0_VALID ;
 assign jgccc13q8ag9hfy7_438 	= hmbaj59vvpu26c776dx9q1tqk9qb_731[1:0] ;
 assign wircpugbry8v2axe9qrmdp1hjyt_420 = 
	 ~(msd3a9npmk5frpeb3befiaeu0v02r7_239) ;
 assign fpdxeajjji1w0i78zdvpg0o3_745 	= e2gyww48j0gmwfgkl9r_619 ;
 assign hnaoomzkiu7owvzpgs_904 = 
	tuple_in_TUPLE1_DATA ;
 assign yu02x82gf9ne3xljoob1zhzxy5ojs4by_731 	= tuple_in_TUPLE1_VALID ;
 assign m7hfysriv3twvji0_518 	= hnaoomzkiu7owvzpgs_904[25:0] ;
 assign w3nffuzkhzhmpo59jw3e2idnt_46 = 
	 ~(mj4sub2iq3g9r2q4rf8hy1pwjwx_331) ;
 assign jshio6m4j4tz7l821k8jpg10fzxo_466 	= e2gyww48j0gmwfgkl9r_619 ;
 assign ct3a2jmbih8uo6jl4q2bhu_733 = 
	tuple_in_TUPLE3_DATA ;
 assign k0n63jhd32vwr1zigm3da_587 	= tuple_in_TUPLE3_VALID ;
 assign s0jn70prc8t2rlu5qgn4srfxn7_663 	= ct3a2jmbih8uo6jl4q2bhu_733[31:0] ;
 assign qngurpl8tpe1m3ik02e8nu5w_295 = 
	 ~(ksdu8n5gh3ub7d1z33_512) ;
 assign i6rkie79vqj0vza1u277fq1y7owsvxo_882 	= e2gyww48j0gmwfgkl9r_619 ;
 assign zz0jwmrwvo3dsmu6p3wl80y_275 = 
	tuple_in_TUPLE4_DATA ;
 assign p4i634mri7jkhkwwbvmsf1l78xdcp02_655 	= tuple_in_TUPLE4_VALID ;
 assign cuvpmo5ct96yl277lcs23_736 	= zz0jwmrwvo3dsmu6p3wl80y_275[3:0] ;
 assign uhjborcw14pcskuxs5hh6_861 = 
	 ~(rx4a063k4ekxwavppsfpuihqq_486) ;
 assign dezhlz372zxqldnpyybc_872 	= e2gyww48j0gmwfgkl9r_619 ;
 assign u7bg9ha89yeakc3fuucgg7_558 = 
	tuple_in_TUPLE5_DATA ;
 assign q5brirvp4ahf8lb6u_252 	= tuple_in_TUPLE5_VALID ;
 assign h9b6q8k5co5f80frn9i284_873 	= u7bg9ha89yeakc3fuucgg7_558[199:0] ;
 assign auo8tom90ks2i7cf12dhbk_407 = 
	 ~(y9x5vfro6oqz7iobw5mfj_561) ;
 assign d1898b8kmf06u2yrqz4n_441 	= e2gyww48j0gmwfgkl9r_619 ;
 assign hhargd6hikp3fao0ryukq_294 = 
	tuple_in_TUPLE6_DATA ;
 assign ep0bvy5chqb9mgdvk3xd54mr_28 	= tuple_in_TUPLE6_VALID ;
 assign fv7bex14zuzjaf5pyji5ohv84kx2_330 	= hhargd6hikp3fao0ryukq_294[31:0] ;
 assign vo8cqgriwptbx4yghfaz1q6sh69_638 = 
	 ~(vij1v8uifsul5tvybf8etexe_393) ;
 assign ioro8tw72nf2izyjyapt_200 	= e2gyww48j0gmwfgkl9r_619 ;
 assign idsg5auwydiq1ciunrx2boxzaz17y_300 = 
	tuple_in_TUPLE8_DATA ;
 assign u3oqvkfoqfmbkkee8pc5mb85_307 	= tuple_in_TUPLE8_VALID ;
 assign ar4um0wp3vuptepxq03jgqlpqzy_66 	= idsg5auwydiq1ciunrx2boxzaz17y_300[63:0] ;
 assign ht3pevomaoj7jlmz1fo_107 = 
	 ~(ihow9yjbbkxxnwh55m33l4e_248) ;
 assign p3pakwan1anpgks8o8z39w3ymtw4_35 	= e2gyww48j0gmwfgkl9r_619 ;
 assign agj2ai79256wnz5s_446 = 
	fsj5v3g8dsh1xfkrgr5tmx4x8zub_410 & wircpugbry8v2axe9qrmdp1hjyt_420 & w3nffuzkhzhmpo59jw3e2idnt_46 & qngurpl8tpe1m3ik02e8nu5w_295 & uhjborcw14pcskuxs5hh6_861 & auo8tom90ks2i7cf12dhbk_407 & vo8cqgriwptbx4yghfaz1q6sh69_638 & ht3pevomaoj7jlmz1fo_107 ;
 assign clo95txj8phijq10fjtmlwc8en_340 = 
	rutjgi799f35a0br2nbbiul6_257 | as7bgmyshyo1vnu1nmrg8va7bn7d_736 | zm04ssdqdullr7eedbswrr_890 | v1vcxv4abyh6mwis3_681 | wkkysav90w5ruecjnwl5jfqiagn_211 | aknf4wivdoztcog1jlifz8l01_104 | yrelmtfujyabrt3e769_309 | vjndw90ghkux3v056zdet3luteko_53 ;
 assign packet_out_PACKET2_SOF 	= nmwum2z6kelxv2u21lzu1a82d75i_529 ;
 assign packet_out_PACKET2_EOF 	= imdf8yq2exsb9jc323z56bezg5wsm_615 ;
 assign packet_out_PACKET2_VAL 	= z1vpib1djgse40oy4og28wtda8sq_176 ;
 assign packet_out_PACKET2_DAT 	= czm53zfabv4t9opbvs_390[255:0] ;
 assign packet_out_PACKET2_CNT 	= dratni7h3ys7zqd1ic4f0a9fcou2_90[5:0] ;
 assign packet_out_PACKET2_ERR 	= a9skedqoq7u4gwa03e8rlptcz2cxfq3_407 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= m2irgweuo1vfp0qi7fdxx7_478 ;
 assign tuple_out_TUPLE0_DATA 	= shiqqilusospmwz3a5zbdk83hgw4fvun_496[1:0] ;
 assign tuple_out_TUPLE1_VALID 	= vpw9yvc2rf0h0944nff_667 ;
 assign tuple_out_TUPLE1_DATA 	= q4ew4przg3lmbs60rlpmyugys_485[25:0] ;
 assign tuple_out_TUPLE3_VALID 	= rkuc1rrhgbowh2q4n6v3y24_661 ;
 assign tuple_out_TUPLE3_DATA 	= an86q86m8j0qct7m8om_224[31:0] ;
 assign tuple_out_TUPLE4_VALID 	= bduzeggomtcbzo0vbfyfv_65 ;
 assign tuple_out_TUPLE4_DATA 	= xcdqkico71t9jtbjx4r8iprh2r_763[3:0] ;
 assign tuple_out_TUPLE5_VALID 	= e242cpj8x2dsxakqs_516 ;
 assign tuple_out_TUPLE5_DATA 	= y1o7gx5z5poebzmrk9a4ftnu_4[199:0] ;
 assign tuple_out_TUPLE6_VALID 	= iovqcfjhpr7fr69gx58x1e26v6j_243 ;
 assign tuple_out_TUPLE6_DATA 	= gxjmntju3a0n23nnkzinq7ly16b5_246[31:0] ;
 assign tuple_out_TUPLE8_VALID 	= i8r1dzwzttkmjhbo56xfnn79ph0xtp_801 ;
 assign tuple_out_TUPLE8_DATA 	= tlyj5udb52u73yy0s_191[63:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	zxwof762bmi5kg2ddrcaurnf432mwr_248 <= 1'b0 ;
	rutjgi799f35a0br2nbbiul6_257 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		zxwof762bmi5kg2ddrcaurnf432mwr_248 <= god35by6naggkk1t66wok_536 ;
		rutjgi799f35a0br2nbbiul6_257 <= naucryabim1u8epkhbcmm_453 ;
		backpressure_out <= clo95txj8phijq10fjtmlwc8en_340 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	as7bgmyshyo1vnu1nmrg8va7bn7d_736 <= 1'b0 ;
   end
  else
  begin
		as7bgmyshyo1vnu1nmrg8va7bn7d_736 <= lh8o9b4syp1foisn63ol_159 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	zm04ssdqdullr7eedbswrr_890 <= 1'b0 ;
   end
  else
  begin
		zm04ssdqdullr7eedbswrr_890 <= ggm75cd8t46hmir6htdfrxyq74_39 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	v1vcxv4abyh6mwis3_681 <= 1'b0 ;
   end
  else
  begin
		v1vcxv4abyh6mwis3_681 <= wwzhd43j9a5k3ixqh_99 ;
  end
end

always @(posedge clk_out_4)
begin
  if (rst_in_0) 
  begin
	wkkysav90w5ruecjnwl5jfqiagn_211 <= 1'b0 ;
   end
  else
  begin
		wkkysav90w5ruecjnwl5jfqiagn_211 <= eulv04p27ln9d087lg2p_542 ;
  end
end

always @(posedge clk_out_5)
begin
  if (rst_in_0) 
  begin
	aknf4wivdoztcog1jlifz8l01_104 <= 1'b0 ;
   end
  else
  begin
		aknf4wivdoztcog1jlifz8l01_104 <= j0u8x06ya3ac1xbg46kydoqmfo5s4ep_68 ;
  end
end

always @(posedge clk_out_6)
begin
  if (rst_in_0) 
  begin
	yrelmtfujyabrt3e769_309 <= 1'b0 ;
   end
  else
  begin
		yrelmtfujyabrt3e769_309 <= qvdytbpjd0xg40et5qt2_837 ;
  end
end

always @(posedge clk_out_7)
begin
  if (rst_in_0) 
  begin
	vjndw90ghkux3v056zdet3luteko_53 <= 1'b0 ;
   end
  else
  begin
		vjndw90ghkux3v056zdet3luteko_53 <= khje8vbffnd160671ms1kppsqw4w_21 ;
  end
end

defparam gjgmlzpnz5bo4ef6wqkzbilx_2555.DataBits = 266; 
defparam gjgmlzpnz5bo4ef6wqkzbilx_2555.AddrBits = 9; 
defparam gjgmlzpnz5bo4ef6wqkzbilx_2555.AFullAssert_0 = 109; 
defparam gjgmlzpnz5bo4ef6wqkzbilx_2555.AFullNegate_0 = 109; 

PPP_SCFifo gjgmlzpnz5bo4ef6wqkzbilx_2555 (
	.WrEnb(nxwab5w5meg1jzqk_459),
	.WrData(no3pdu9xsuthkbfdea_403),
	.RdEnb(jnjsw3eqjy01dq234ve560u_321),


	.RdVal(avoei388wa5l2hst_679), 
	.RdData(ysnekmx3upc8knb9s_41), 
	.Empty(ae2dgjofzze8zsuos_765), 
	.AFull_0(naucryabim1u8epkhbcmm_453), 
	.Full(z2xdl41ufdqy3y08la7vps5q9kr_572), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam hwdip3hyo335tla36i1guzgmlb_1149.DscBits = 1; 
defparam hwdip3hyo335tla36i1guzgmlb_1149.BufSize = 512; 
defparam hwdip3hyo335tla36i1guzgmlb_1149.CntBits = 9; 

PPP_DscSCBuf hwdip3hyo335tla36i1guzgmlb_1149 (
	.DscSkip(zpd30rmswfc38krk_396),
	.RdVal(kl8zcn2e3unj84xix0fswai_524),
	.RdData(xcogznhefj8awafo_524),
	.Empty(oi1734h4yhcpv456rcgvkkb_526),


	.DscVal(cdsf1jglrmv2i4qdbpkd_195), 
	.DscData(xaw11ac0r5vws2yakh41x_862), 
	.RdEnb(v77xmbcx1v1nf4jd81r0hh_745), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam suvlf63ozlky3nn19a1f3vj7_1926.DataBits = 1; 
defparam suvlf63ozlky3nn19a1f3vj7_1926.AddrBits = 9; 
defparam suvlf63ozlky3nn19a1f3vj7_1926.AFullAssert_0 = 256; 
defparam suvlf63ozlky3nn19a1f3vj7_1926.AFullNegate_0 = 256; 

PPP_SCFifo suvlf63ozlky3nn19a1f3vj7_1926 (
	.WrEnb(g9p96icwo5jweg43a7df2zj_251),
	.WrData(z2ag8zrktbly9497_860),
	.RdEnb(bo2uw94ikar7d0nsnt1ax0g_148),


	.RdVal(zsou8hnw3obohk9prr7n2i4oavwh6_481), 
	.RdData(cbqjbcs5wuqmz0cbr40yjy_494), 
	.Empty(etwydkwfowopzia2xa2rtlmz1_311), 
	.AFull_0(gdby7l8vgly4zpayu4df45g5mu5dc26e_20), 
	.Full(b8gjitx981y34izdve3ihz3xvdy1_92), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam kebu3mbx57av5eavxeaaw9mu3jcf6q_1915.DataBits = 2; 
defparam kebu3mbx57av5eavxeaaw9mu3jcf6q_1915.AddrBits = 9; 
defparam kebu3mbx57av5eavxeaaw9mu3jcf6q_1915.AFullAssert_0 = 27; 
defparam kebu3mbx57av5eavxeaaw9mu3jcf6q_1915.AFullNegate_0 = 27; 

PPP_SCFifo kebu3mbx57av5eavxeaaw9mu3jcf6q_1915 (
	.WrEnb(u6o9q5q2s30fbw70xqmvlw3wymy_582),
	.WrData(jgccc13q8ag9hfy7_438),
	.RdEnb(fpdxeajjji1w0i78zdvpg0o3_745),


	.RdVal(m2irgweuo1vfp0qi7fdxx7_478), 
	.RdData(shiqqilusospmwz3a5zbdk83hgw4fvun_496), 
	.Empty(msd3a9npmk5frpeb3befiaeu0v02r7_239), 
	.AFull_0(lh8o9b4syp1foisn63ol_159), 
	.Full(a8po233avwtz037l28ja9951hut9g_9), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

defparam ov49q01yn7cekim1dgwznbc9_1338.DataBits = 26; 
defparam ov49q01yn7cekim1dgwznbc9_1338.AddrBits = 9; 
defparam ov49q01yn7cekim1dgwznbc9_1338.AFullAssert_0 = 55; 
defparam ov49q01yn7cekim1dgwznbc9_1338.AFullNegate_0 = 55; 

PPP_SCFifo ov49q01yn7cekim1dgwznbc9_1338 (
	.WrEnb(yu02x82gf9ne3xljoob1zhzxy5ojs4by_731),
	.WrData(m7hfysriv3twvji0_518),
	.RdEnb(jshio6m4j4tz7l821k8jpg10fzxo_466),


	.RdVal(vpw9yvc2rf0h0944nff_667), 
	.RdData(q4ew4przg3lmbs60rlpmyugys_485), 
	.Empty(mj4sub2iq3g9r2q4rf8hy1pwjwx_331), 
	.AFull_0(ggm75cd8t46hmir6htdfrxyq74_39), 
	.Full(rdo80unnankk9u4epapeex5dv2h1x6hz_836), 

	.WrClk(clk_in_2), 

	.RdClk(clk_out_2), 

	.WrRst(rst_in_2), 
	.RdRst(rst_out_2) 
); 

defparam u7ykb271lkzym3oyqdmzym_31.DataBits = 32; 
defparam u7ykb271lkzym3oyqdmzym_31.AddrBits = 9; 
defparam u7ykb271lkzym3oyqdmzym_31.AFullAssert_0 = 55; 
defparam u7ykb271lkzym3oyqdmzym_31.AFullNegate_0 = 55; 

PPP_SCFifo u7ykb271lkzym3oyqdmzym_31 (
	.WrEnb(k0n63jhd32vwr1zigm3da_587),
	.WrData(s0jn70prc8t2rlu5qgn4srfxn7_663),
	.RdEnb(i6rkie79vqj0vza1u277fq1y7owsvxo_882),


	.RdVal(rkuc1rrhgbowh2q4n6v3y24_661), 
	.RdData(an86q86m8j0qct7m8om_224), 
	.Empty(ksdu8n5gh3ub7d1z33_512), 
	.AFull_0(wwzhd43j9a5k3ixqh_99), 
	.Full(sgc7nlwj6dws42zmr0ke7s8pkiow7vp_889), 

	.WrClk(clk_in_3), 

	.RdClk(clk_out_3), 

	.WrRst(rst_in_3), 
	.RdRst(rst_out_3) 
); 

defparam ebgwrrpnze7p56nxcxeqq7l_828.DataBits = 4; 
defparam ebgwrrpnze7p56nxcxeqq7l_828.AddrBits = 9; 
defparam ebgwrrpnze7p56nxcxeqq7l_828.AFullAssert_0 = 55; 
defparam ebgwrrpnze7p56nxcxeqq7l_828.AFullNegate_0 = 55; 

PPP_SCFifo ebgwrrpnze7p56nxcxeqq7l_828 (
	.WrEnb(p4i634mri7jkhkwwbvmsf1l78xdcp02_655),
	.WrData(cuvpmo5ct96yl277lcs23_736),
	.RdEnb(dezhlz372zxqldnpyybc_872),


	.RdVal(bduzeggomtcbzo0vbfyfv_65), 
	.RdData(xcdqkico71t9jtbjx4r8iprh2r_763), 
	.Empty(rx4a063k4ekxwavppsfpuihqq_486), 
	.AFull_0(eulv04p27ln9d087lg2p_542), 
	.Full(tenel0by8tee75hj6fv_219), 

	.WrClk(clk_in_4), 

	.RdClk(clk_out_4), 

	.WrRst(rst_in_4), 
	.RdRst(rst_out_4) 
); 

defparam hvagpdtdkgjw0yt3y95zty_2396.DataBits = 200; 
defparam hvagpdtdkgjw0yt3y95zty_2396.AddrBits = 9; 
defparam hvagpdtdkgjw0yt3y95zty_2396.AFullAssert_0 = 55; 
defparam hvagpdtdkgjw0yt3y95zty_2396.AFullNegate_0 = 55; 

PPP_SCFifo hvagpdtdkgjw0yt3y95zty_2396 (
	.WrEnb(q5brirvp4ahf8lb6u_252),
	.WrData(h9b6q8k5co5f80frn9i284_873),
	.RdEnb(d1898b8kmf06u2yrqz4n_441),


	.RdVal(e242cpj8x2dsxakqs_516), 
	.RdData(y1o7gx5z5poebzmrk9a4ftnu_4), 
	.Empty(y9x5vfro6oqz7iobw5mfj_561), 
	.AFull_0(j0u8x06ya3ac1xbg46kydoqmfo5s4ep_68), 
	.Full(khxjoqso3qwmupcoqu6_235), 

	.WrClk(clk_in_5), 

	.RdClk(clk_out_5), 

	.WrRst(rst_in_5), 
	.RdRst(rst_out_5) 
); 

defparam bnockv57jy80ungts_2163.DataBits = 32; 
defparam bnockv57jy80ungts_2163.AddrBits = 9; 
defparam bnockv57jy80ungts_2163.AFullAssert_0 = 55; 
defparam bnockv57jy80ungts_2163.AFullNegate_0 = 55; 

PPP_SCFifo bnockv57jy80ungts_2163 (
	.WrEnb(ep0bvy5chqb9mgdvk3xd54mr_28),
	.WrData(fv7bex14zuzjaf5pyji5ohv84kx2_330),
	.RdEnb(ioro8tw72nf2izyjyapt_200),


	.RdVal(iovqcfjhpr7fr69gx58x1e26v6j_243), 
	.RdData(gxjmntju3a0n23nnkzinq7ly16b5_246), 
	.Empty(vij1v8uifsul5tvybf8etexe_393), 
	.AFull_0(qvdytbpjd0xg40et5qt2_837), 
	.Full(e8rp2h879ecjoaia5bou4q69x_441), 

	.WrClk(clk_in_6), 

	.RdClk(clk_out_6), 

	.WrRst(rst_in_6), 
	.RdRst(rst_out_6) 
); 

defparam q0yj6zsebjm2xz00lxjszb49le13_1354.DataBits = 64; 
defparam q0yj6zsebjm2xz00lxjszb49le13_1354.AddrBits = 9; 
defparam q0yj6zsebjm2xz00lxjszb49le13_1354.AFullAssert_0 = 55; 
defparam q0yj6zsebjm2xz00lxjszb49le13_1354.AFullNegate_0 = 55; 

PPP_SCFifo q0yj6zsebjm2xz00lxjszb49le13_1354 (
	.WrEnb(u3oqvkfoqfmbkkee8pc5mb85_307),
	.WrData(ar4um0wp3vuptepxq03jgqlpqzy_66),
	.RdEnb(p3pakwan1anpgks8o8z39w3ymtw4_35),


	.RdVal(i8r1dzwzttkmjhbo56xfnn79ph0xtp_801), 
	.RdData(tlyj5udb52u73yy0s_191), 
	.Empty(ihow9yjbbkxxnwh55m33l4e_248), 
	.AFull_0(khje8vbffnd160671ms1kppsqw4w_21), 
	.Full(zxu07npv4njd8ybu5_472), 

	.WrClk(clk_in_7), 

	.RdClk(clk_out_7), 

	.WrRst(rst_in_7), 
	.RdRst(rst_out_7) 
); 

endmodule 

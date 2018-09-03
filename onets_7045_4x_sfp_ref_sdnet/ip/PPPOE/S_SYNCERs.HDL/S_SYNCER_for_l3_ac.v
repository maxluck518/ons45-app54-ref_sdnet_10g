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
// File name: S_SYNCER_for_l3_ac.v
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_l3_ac (
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
 input	 [3:0] tuple_in_TUPLE2_DATA ;
 input		tuple_in_TUPLE3_VALID ;
 input	 [115:0] tuple_in_TUPLE3_DATA ;
 input		tuple_in_TUPLE4_VALID ;
 input	 [199:0] tuple_in_TUPLE4_DATA ;
 input		tuple_in_TUPLE5_VALID ;
 input	 [63:0] tuple_in_TUPLE5_DATA ;
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
 output	 [3:0] tuple_out_TUPLE2_DATA ;
 output		tuple_out_TUPLE3_VALID ;
 output	 [115:0] tuple_out_TUPLE3_DATA ;
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






 wire	hmkbrn0f8zdzliec64sd95ous_243 ;
 wire [265:0] d3sxwdv5q1ykjte1kf0ejau8etzx9_288 ;
 wire	qw5fbmt8hbvsp0bldomkn4_270 ;
 wire	ie8cu8coko1li7tngr53vubr437h5_477 ;
 wire	sf9ig9z6bt94lv0rrkbh5u_125 ;
 reg	tktbydcxu2em96qhzk6m0_554 ;
 wire	piiwx59z2khb4te2_116 ;
 wire [0:0] sp209kjvocdij2h720hkqw_244 ;
 wire	zdll50xsnc9wzq1zg_164 ;
 wire	fptuf2xzabo7fp1c02jkfwfkgriqd_459 ;
 wire [0:0] f5m1b1471qkgejb0x84quvb4a5sn7_801 ;
 wire	q43tsicatdf55xfidn1ljdi9tyko_199 ;
 wire	r0wjybfq92y247vdwkruhdwt_715 ;
 wire	e7boe80pyjennts5gcwft_773 ;
 wire	gdlscwzcccrxw0k4i7p4oq985dcc3fji_351 ;
 wire [25:0] eb0r0cos4l0wp4kqu68veepejcl_704 ;
 wire	b1vp76e1tm9o1759ts5sbts7iex5ro9_433 ;
 wire	i3yi50yjxoeio5kdiv9tr90c_548 ;
 wire	d32kpzv79foln9s7silvbdnzgev_255 ;
 wire	kebx63fnaxi36fe8zv_175 ;
 wire [3:0] o6xk4wpk9c1hl44pr5xy1zeypsafmp_898 ;
 wire	jqkm751ukxzxahl3lhw_682 ;
 wire	xjonorjw67stxifffl57zoufl_197 ;
 wire	fjiwkkizc8x067m2kkzajq_304 ;
 wire	v1tfcwqt034t1prxig1m45_155 ;
 wire [115:0] uhfzfy3nudj3vdi4hai_344 ;
 wire	ymc187wgjeuremgmujy6qx4_754 ;
 wire	hng9bxj8hp577jt3xjz31yf_673 ;
 wire	uyoo2npt8aaeexivqe_134 ;
 wire	mhd0i1wymo5rjxh485lf8v_607 ;
 wire [199:0] f5hgjxqvr40rh066wfk23q4u55v_814 ;
 wire	qbdfkld089mfbeyls0t6_374 ;
 wire	m4nvauge4fzynl9oo_105 ;
 wire	w03yll5q833h1oi6jl1hijuwv_687 ;
 wire	nz3zbxntehhjg88mqoda700d8_732 ;
 wire [63:0] vwyppvglx6vr91jse9p3_864 ;
 wire	e18nui085mr1u9r5nr7_661 ;
 wire	z17ieoub7ljoov8t4rof_151 ;
 wire	wa0pgd3ymkar3q9unq1qo2c9nac_844 ;
 reg	dgsylv2ju7jeydjgdei4oghgdzwnkps5_655 ;
 reg	y11qc45i39msdxslfipv_296 ;
 reg	r1vux83ea79edh35z_62 ;
 reg	ue5h31vh5jd6qyhu0z_26 ;
 reg	z9fhlplsfsvgl7tn2_64 ;
 reg	q86z1r8zikws3t3b2x3w1cx7ah6h5v_748 ;
 wire	s3k3jun5pfhe2zrgo88rx8sh5_69 ;
 wire [265:0] rk2ci0h48zdsrjt0ozllp7x25it9v3_834 ;
 wire	geoiwvlr034oh6dvs2rps0teiymm_98 ;
 wire [265:0] gb2z8u363ai3dazqp7u_731 ;
 wire	npwrd1cfbemjddub6g4022kl_133 ;
 wire	vo00cvzpz2ed0rus_846 ;
 wire	zxg6az9hfqu2g6nnqutam_122 ;
 wire	mko1itakhufqc6392uzlbz_833 ;
 wire	pp48bbng5ngf8jfxmoltvnc_839 ;
 wire [5:0] k1glx5dkdjztutz8_387 ;
 wire [255:0] vhjjkdoh29rejwqr5mmlzpui_766 ;
 wire	zzq1wupouag8dev7_872 ;
 wire	dbpynrm759t6h9tssc811owg_614 ;
 wire	swij6j069uny15wvblzpo7sp763g_702 ;
 wire	ooumtmwrs3o2msttum2gx46_492 ;
 wire	bgll1ywgn4y2yc8ewrvj4v6ls02afw3t_84 ;
 wire	tjbcnncoft9p10s2q1mixrif68ey_320 ;
 wire	x4bdxt53zbvftusk0_853 ;
 wire [0:0] w9iijxhuor71cu6sx0tw_108 ;
 wire	ljvjkfquxp0qwuv7nwbmsiqlw6nfwr_844 ;
 wire	krzoq2st096vfnbmmrhqup_421 ;
 wire	yq0w1sgsizrn4d0d_214 ;
 wire	ji74djw6fnl0cnxuc_876 ;
 wire	d4g85d8k3t2wfm96z10pczbnl_455 ;
 wire	s51npaopyb2hfukhcp8m3g1y6nun7z3_825 ;
 wire [0:0] expwg77pgd2gonblubv4n62t_565 ;
 wire	b7xf2s3s2rt7b6ccg_429 ;
 wire	t2587fejckds8aoa8_465 ;
 wire	mghnp0vflh61cxpxbd5w7y563_686 ;
 wire	ygy8bfxikm9eewppuc9fyt06gz_576 ;
 wire	funvw9zsf1p9ries19o5xhcv9atxw6_347 ;
 wire	l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 wire [25:0] bm2yt4q78zsqjci2zgqh_835 ;
 wire	q056top9hkzecj5zewl_177 ;
 wire [25:0] x0hq51d2do92oclqe_761 ;
 wire	zrlavtewuhwtiarznv52b6_163 ;
 wire	kyowilipspwpi3jb12ywcsa9z038_523 ;
 wire [3:0] pif6xi6cv6wdygbtdl_43 ;
 wire	xco5gf7hz1k1p38s8mx1a_265 ;
 wire [3:0] inrkece5fb2lihbxq01p9jhe68b9_404 ;
 wire	k5g52y4gghqsonaui806dz78q_672 ;
 wire	hzlt4k5t1enizkbwxy61_879 ;
 wire [115:0] bd9qcv2qmd718h2c5dm5s3c01z3b75_332 ;
 wire	obbuc3r7l2qgcvlgi_285 ;
 wire [115:0] pdffcia379o0tzpfkvciztprhgr68bt_694 ;
 wire	hb8q1vu6hn72mql0oq1a54ffx0irn_317 ;
 wire	vy3669nkuiuoj36fwienbggzwm7z1k69_569 ;
 wire [199:0] dyweckj55yhcku41ew_408 ;
 wire	j76d9doaqxhklqvcdhdq_875 ;
 wire [199:0] btxdor3w7s0wz6a01w2h64ttw7_595 ;
 wire	fw4fqai1g9vavyqtixxxl7m5620hsk_324 ;
 wire	gk4u03uezyfxqzhe3sck19ipe912npub_345 ;
 wire [63:0] wtqnh0mfbqeldg9z676_347 ;
 wire	pl7z8watqow23khqs6qntw1_293 ;
 wire [63:0] bc1bfmnp875e17jhwk6d_869 ;
 wire	cfd8chqw6l8qffsy_657 ;
 wire	kdl94tme92hwtyx3x9ecsu_562 ;
 wire	t3hpjyi2desejf6t8i5sfoxeoyr_78 ;
 wire	fgp7wrmdq7lr9ncr6naqmx8liax_452 ;


 assign s3k3jun5pfhe2zrgo88rx8sh5_69 = 
	 ~(backpressure_in) ;
 assign rk2ci0h48zdsrjt0ozllp7x25it9v3_834 = 
	{packet_in_PACKET1_SOF, packet_in_PACKET1_EOF, packet_in_PACKET1_VAL, packet_in_PACKET1_DAT, packet_in_PACKET1_CNT, packet_in_PACKET1_ERR} ;
 assign geoiwvlr034oh6dvs2rps0teiymm_98 	= packet_in_PACKET1_VAL ;
 assign gb2z8u363ai3dazqp7u_731 	= rk2ci0h48zdsrjt0ozllp7x25it9v3_834[265:0] ;
 assign npwrd1cfbemjddub6g4022kl_133 = 
	ji74djw6fnl0cnxuc_876 | t3hpjyi2desejf6t8i5sfoxeoyr_78 ;
 assign vo00cvzpz2ed0rus_846 = 
	s3k3jun5pfhe2zrgo88rx8sh5_69 & krzoq2st096vfnbmmrhqup_421 & npwrd1cfbemjddub6g4022kl_133 ;
 assign zxg6az9hfqu2g6nnqutam_122 	= vo00cvzpz2ed0rus_846 ;
 assign mko1itakhufqc6392uzlbz_833 = 
	 ~(qw5fbmt8hbvsp0bldomkn4_270) ;
 assign pp48bbng5ngf8jfxmoltvnc_839 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[0] ;
 assign k1glx5dkdjztutz8_387 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[6:1] ;
 assign vhjjkdoh29rejwqr5mmlzpui_766 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[262:7] ;
 assign zzq1wupouag8dev7_872 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[263] ;
 assign dbpynrm759t6h9tssc811owg_614 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[264] ;
 assign swij6j069uny15wvblzpo7sp763g_702 	= d3sxwdv5q1ykjte1kf0ejau8etzx9_288[265] ;
 assign ooumtmwrs3o2msttum2gx46_492 = 
	tktbydcxu2em96qhzk6m0_554 & zzq1wupouag8dev7_872 ;
 assign bgll1ywgn4y2yc8ewrvj4v6ls02afw3t_84 	= vo00cvzpz2ed0rus_846 ;
 assign tjbcnncoft9p10s2q1mixrif68ey_320 	= bgll1ywgn4y2yc8ewrvj4v6ls02afw3t_84 ;
 assign x4bdxt53zbvftusk0_853 	= t2587fejckds8aoa8_465 ;
 assign w9iijxhuor71cu6sx0tw_108 = mghnp0vflh61cxpxbd5w7y563_686 ;
 assign ljvjkfquxp0qwuv7nwbmsiqlw6nfwr_844 	= ygy8bfxikm9eewppuc9fyt06gz_576 ;
 assign krzoq2st096vfnbmmrhqup_421 	= piiwx59z2khb4te2_116 ;
 assign yq0w1sgsizrn4d0d_214 = sp209kjvocdij2h720hkqw_244 ;
 assign ji74djw6fnl0cnxuc_876 = 
	 ~(yq0w1sgsizrn4d0d_214) ;
 assign d4g85d8k3t2wfm96z10pczbnl_455 	= zdll50xsnc9wzq1zg_164 ;
 assign s51npaopyb2hfukhcp8m3g1y6nun7z3_825 	= packet_in_PACKET1_VAL ;
 assign expwg77pgd2gonblubv4n62t_565 = packet_in_PACKET1_SOF ;
 assign b7xf2s3s2rt7b6ccg_429 	= d4g85d8k3t2wfm96z10pczbnl_455 ;
 assign t2587fejckds8aoa8_465 	= fptuf2xzabo7fp1c02jkfwfkgriqd_459 ;
 assign mghnp0vflh61cxpxbd5w7y563_686 = f5m1b1471qkgejb0x84quvb4a5sn7_801 ;
 assign ygy8bfxikm9eewppuc9fyt06gz_576 	= q43tsicatdf55xfidn1ljdi9tyko_199 ;
 assign funvw9zsf1p9ries19o5xhcv9atxw6_347 = 
	 ~(q43tsicatdf55xfidn1ljdi9tyko_199) ;
 assign l6ghlqsh9zkatqob6i1u1ikfcj_629 = 
	s3k3jun5pfhe2zrgo88rx8sh5_69 & t3hpjyi2desejf6t8i5sfoxeoyr_78 & krzoq2st096vfnbmmrhqup_421 & yq0w1sgsizrn4d0d_214 ;
 assign bm2yt4q78zsqjci2zgqh_835 = 
	tuple_in_TUPLE0_DATA ;
 assign q056top9hkzecj5zewl_177 	= tuple_in_TUPLE0_VALID ;
 assign x0hq51d2do92oclqe_761 	= bm2yt4q78zsqjci2zgqh_835[25:0] ;
 assign zrlavtewuhwtiarznv52b6_163 = 
	 ~(b1vp76e1tm9o1759ts5sbts7iex5ro9_433) ;
 assign kyowilipspwpi3jb12ywcsa9z038_523 	= l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 assign pif6xi6cv6wdygbtdl_43 = 
	tuple_in_TUPLE2_DATA ;
 assign xco5gf7hz1k1p38s8mx1a_265 	= tuple_in_TUPLE2_VALID ;
 assign inrkece5fb2lihbxq01p9jhe68b9_404 	= pif6xi6cv6wdygbtdl_43[3:0] ;
 assign k5g52y4gghqsonaui806dz78q_672 = 
	 ~(jqkm751ukxzxahl3lhw_682) ;
 assign hzlt4k5t1enizkbwxy61_879 	= l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 assign bd9qcv2qmd718h2c5dm5s3c01z3b75_332 = 
	tuple_in_TUPLE3_DATA ;
 assign obbuc3r7l2qgcvlgi_285 	= tuple_in_TUPLE3_VALID ;
 assign pdffcia379o0tzpfkvciztprhgr68bt_694 	= bd9qcv2qmd718h2c5dm5s3c01z3b75_332[115:0] ;
 assign hb8q1vu6hn72mql0oq1a54ffx0irn_317 = 
	 ~(ymc187wgjeuremgmujy6qx4_754) ;
 assign vy3669nkuiuoj36fwienbggzwm7z1k69_569 	= l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 assign dyweckj55yhcku41ew_408 = 
	tuple_in_TUPLE4_DATA ;
 assign j76d9doaqxhklqvcdhdq_875 	= tuple_in_TUPLE4_VALID ;
 assign btxdor3w7s0wz6a01w2h64ttw7_595 	= dyweckj55yhcku41ew_408[199:0] ;
 assign fw4fqai1g9vavyqtixxxl7m5620hsk_324 = 
	 ~(qbdfkld089mfbeyls0t6_374) ;
 assign gk4u03uezyfxqzhe3sck19ipe912npub_345 	= l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 assign wtqnh0mfbqeldg9z676_347 = 
	tuple_in_TUPLE5_DATA ;
 assign pl7z8watqow23khqs6qntw1_293 	= tuple_in_TUPLE5_VALID ;
 assign bc1bfmnp875e17jhwk6d_869 	= wtqnh0mfbqeldg9z676_347[63:0] ;
 assign cfd8chqw6l8qffsy_657 = 
	 ~(e18nui085mr1u9r5nr7_661) ;
 assign kdl94tme92hwtyx3x9ecsu_562 	= l6ghlqsh9zkatqob6i1u1ikfcj_629 ;
 assign t3hpjyi2desejf6t8i5sfoxeoyr_78 = 
	mko1itakhufqc6392uzlbz_833 & zrlavtewuhwtiarznv52b6_163 & k5g52y4gghqsonaui806dz78q_672 & hb8q1vu6hn72mql0oq1a54ffx0irn_317 & fw4fqai1g9vavyqtixxxl7m5620hsk_324 & cfd8chqw6l8qffsy_657 ;
 assign fgp7wrmdq7lr9ncr6naqmx8liax_452 = 
	dgsylv2ju7jeydjgdei4oghgdzwnkps5_655 | y11qc45i39msdxslfipv_296 | r1vux83ea79edh35z_62 | ue5h31vh5jd6qyhu0z_26 | z9fhlplsfsvgl7tn2_64 | q86z1r8zikws3t3b2x3w1cx7ah6h5v_748 ;
 assign packet_out_PACKET1_SOF 	= swij6j069uny15wvblzpo7sp763g_702 ;
 assign packet_out_PACKET1_EOF 	= dbpynrm759t6h9tssc811owg_614 ;
 assign packet_out_PACKET1_VAL 	= ooumtmwrs3o2msttum2gx46_492 ;
 assign packet_out_PACKET1_DAT 	= vhjjkdoh29rejwqr5mmlzpui_766[255:0] ;
 assign packet_out_PACKET1_CNT 	= k1glx5dkdjztutz8_387[5:0] ;
 assign packet_out_PACKET1_ERR 	= pp48bbng5ngf8jfxmoltvnc_839 ;
 assign packet_in_PACKET1_RDY 	= packet_out_PACKET1_RDY ;
 assign tuple_out_TUPLE0_VALID 	= gdlscwzcccrxw0k4i7p4oq985dcc3fji_351 ;
 assign tuple_out_TUPLE0_DATA 	= eb0r0cos4l0wp4kqu68veepejcl_704[25:0] ;
 assign tuple_out_TUPLE2_VALID 	= kebx63fnaxi36fe8zv_175 ;
 assign tuple_out_TUPLE2_DATA 	= o6xk4wpk9c1hl44pr5xy1zeypsafmp_898[3:0] ;
 assign tuple_out_TUPLE3_VALID 	= v1tfcwqt034t1prxig1m45_155 ;
 assign tuple_out_TUPLE3_DATA 	= uhfzfy3nudj3vdi4hai_344[115:0] ;
 assign tuple_out_TUPLE4_VALID 	= mhd0i1wymo5rjxh485lf8v_607 ;
 assign tuple_out_TUPLE4_DATA 	= f5hgjxqvr40rh066wfk23q4u55v_814[199:0] ;
 assign tuple_out_TUPLE5_VALID 	= nz3zbxntehhjg88mqoda700d8_732 ;
 assign tuple_out_TUPLE5_DATA 	= vwyppvglx6vr91jse9p3_864[63:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	tktbydcxu2em96qhzk6m0_554 <= 1'b0 ;
	dgsylv2ju7jeydjgdei4oghgdzwnkps5_655 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		tktbydcxu2em96qhzk6m0_554 <= vo00cvzpz2ed0rus_846 ;
		dgsylv2ju7jeydjgdei4oghgdzwnkps5_655 <= ie8cu8coko1li7tngr53vubr437h5_477 ;
		backpressure_out <= fgp7wrmdq7lr9ncr6naqmx8liax_452 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	y11qc45i39msdxslfipv_296 <= 1'b0 ;
   end
  else
  begin
		y11qc45i39msdxslfipv_296 <= i3yi50yjxoeio5kdiv9tr90c_548 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	r1vux83ea79edh35z_62 <= 1'b0 ;
   end
  else
  begin
		r1vux83ea79edh35z_62 <= xjonorjw67stxifffl57zoufl_197 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	ue5h31vh5jd6qyhu0z_26 <= 1'b0 ;
   end
  else
  begin
		ue5h31vh5jd6qyhu0z_26 <= hng9bxj8hp577jt3xjz31yf_673 ;
  end
end

always @(posedge clk_out_4)
begin
  if (rst_in_0) 
  begin
	z9fhlplsfsvgl7tn2_64 <= 1'b0 ;
   end
  else
  begin
		z9fhlplsfsvgl7tn2_64 <= m4nvauge4fzynl9oo_105 ;
  end
end

always @(posedge clk_out_5)
begin
  if (rst_in_0) 
  begin
	q86z1r8zikws3t3b2x3w1cx7ah6h5v_748 <= 1'b0 ;
   end
  else
  begin
		q86z1r8zikws3t3b2x3w1cx7ah6h5v_748 <= z17ieoub7ljoov8t4rof_151 ;
  end
end

defparam ts1prb8qzklvte7514xd7t0aw5tqfuw_1616.DataBits = 266; 
defparam ts1prb8qzklvte7514xd7t0aw5tqfuw_1616.AddrBits = 9; 
defparam ts1prb8qzklvte7514xd7t0aw5tqfuw_1616.AFullAssert_0 = 50; 
defparam ts1prb8qzklvte7514xd7t0aw5tqfuw_1616.AFullNegate_0 = 50; 

PPP_SCFifo ts1prb8qzklvte7514xd7t0aw5tqfuw_1616 (
	.WrEnb(geoiwvlr034oh6dvs2rps0teiymm_98),
	.WrData(gb2z8u363ai3dazqp7u_731),
	.RdEnb(zxg6az9hfqu2g6nnqutam_122),


	.RdVal(hmkbrn0f8zdzliec64sd95ous_243), 
	.RdData(d3sxwdv5q1ykjte1kf0ejau8etzx9_288), 
	.Empty(qw5fbmt8hbvsp0bldomkn4_270), 
	.AFull_0(ie8cu8coko1li7tngr53vubr437h5_477), 
	.Full(sf9ig9z6bt94lv0rrkbh5u_125), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam ji3f7r11d7u159xdk4uejv4l783335y_2089.DscBits = 1; 
defparam ji3f7r11d7u159xdk4uejv4l783335y_2089.BufSize = 512; 
defparam ji3f7r11d7u159xdk4uejv4l783335y_2089.CntBits = 9; 

PPP_DscSCBuf ji3f7r11d7u159xdk4uejv4l783335y_2089 (
	.DscSkip(tjbcnncoft9p10s2q1mixrif68ey_320),
	.RdVal(x4bdxt53zbvftusk0_853),
	.RdData(w9iijxhuor71cu6sx0tw_108),
	.Empty(ljvjkfquxp0qwuv7nwbmsiqlw6nfwr_844),


	.DscVal(piiwx59z2khb4te2_116), 
	.DscData(sp209kjvocdij2h720hkqw_244), 
	.RdEnb(zdll50xsnc9wzq1zg_164), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam wz6gnhq8w7cf0jemwjyn_60.DataBits = 1; 
defparam wz6gnhq8w7cf0jemwjyn_60.AddrBits = 9; 
defparam wz6gnhq8w7cf0jemwjyn_60.AFullAssert_0 = 256; 
defparam wz6gnhq8w7cf0jemwjyn_60.AFullNegate_0 = 256; 

PPP_SCFifo wz6gnhq8w7cf0jemwjyn_60 (
	.WrEnb(s51npaopyb2hfukhcp8m3g1y6nun7z3_825),
	.WrData(expwg77pgd2gonblubv4n62t_565),
	.RdEnb(b7xf2s3s2rt7b6ccg_429),


	.RdVal(fptuf2xzabo7fp1c02jkfwfkgriqd_459), 
	.RdData(f5m1b1471qkgejb0x84quvb4a5sn7_801), 
	.Empty(q43tsicatdf55xfidn1ljdi9tyko_199), 
	.AFull_0(r0wjybfq92y247vdwkruhdwt_715), 
	.Full(e7boe80pyjennts5gcwft_773), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam guoneg1mc8v73vyy0r_1916.DataBits = 26; 
defparam guoneg1mc8v73vyy0r_1916.AddrBits = 9; 
defparam guoneg1mc8v73vyy0r_1916.AFullAssert_0 = 25; 
defparam guoneg1mc8v73vyy0r_1916.AFullNegate_0 = 25; 

PPP_SCFifo guoneg1mc8v73vyy0r_1916 (
	.WrEnb(q056top9hkzecj5zewl_177),
	.WrData(x0hq51d2do92oclqe_761),
	.RdEnb(kyowilipspwpi3jb12ywcsa9z038_523),


	.RdVal(gdlscwzcccrxw0k4i7p4oq985dcc3fji_351), 
	.RdData(eb0r0cos4l0wp4kqu68veepejcl_704), 
	.Empty(b1vp76e1tm9o1759ts5sbts7iex5ro9_433), 
	.AFull_0(i3yi50yjxoeio5kdiv9tr90c_548), 
	.Full(d32kpzv79foln9s7silvbdnzgev_255), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

defparam cpfmu7g31y2exjro_815.DataBits = 4; 
defparam cpfmu7g31y2exjro_815.AddrBits = 9; 
defparam cpfmu7g31y2exjro_815.AFullAssert_0 = 25; 
defparam cpfmu7g31y2exjro_815.AFullNegate_0 = 25; 

PPP_SCFifo cpfmu7g31y2exjro_815 (
	.WrEnb(xco5gf7hz1k1p38s8mx1a_265),
	.WrData(inrkece5fb2lihbxq01p9jhe68b9_404),
	.RdEnb(hzlt4k5t1enizkbwxy61_879),


	.RdVal(kebx63fnaxi36fe8zv_175), 
	.RdData(o6xk4wpk9c1hl44pr5xy1zeypsafmp_898), 
	.Empty(jqkm751ukxzxahl3lhw_682), 
	.AFull_0(xjonorjw67stxifffl57zoufl_197), 
	.Full(fjiwkkizc8x067m2kkzajq_304), 

	.WrClk(clk_in_2), 

	.RdClk(clk_out_2), 

	.WrRst(rst_in_2), 
	.RdRst(rst_out_2) 
); 

defparam mc7nn5vt08xdapoh0yjpkqmm3_1546.DataBits = 116; 
defparam mc7nn5vt08xdapoh0yjpkqmm3_1546.AddrBits = 9; 
defparam mc7nn5vt08xdapoh0yjpkqmm3_1546.AFullAssert_0 = 11; 
defparam mc7nn5vt08xdapoh0yjpkqmm3_1546.AFullNegate_0 = 11; 

PPP_SCFifo mc7nn5vt08xdapoh0yjpkqmm3_1546 (
	.WrEnb(obbuc3r7l2qgcvlgi_285),
	.WrData(pdffcia379o0tzpfkvciztprhgr68bt_694),
	.RdEnb(vy3669nkuiuoj36fwienbggzwm7z1k69_569),


	.RdVal(v1tfcwqt034t1prxig1m45_155), 
	.RdData(uhfzfy3nudj3vdi4hai_344), 
	.Empty(ymc187wgjeuremgmujy6qx4_754), 
	.AFull_0(hng9bxj8hp577jt3xjz31yf_673), 
	.Full(uyoo2npt8aaeexivqe_134), 

	.WrClk(clk_in_3), 

	.RdClk(clk_out_3), 

	.WrRst(rst_in_3), 
	.RdRst(rst_out_3) 
); 

defparam vieyceln9ytxzdssju9hyx2x7b0_1934.DataBits = 200; 
defparam vieyceln9ytxzdssju9hyx2x7b0_1934.AddrBits = 9; 
defparam vieyceln9ytxzdssju9hyx2x7b0_1934.AFullAssert_0 = 25; 
defparam vieyceln9ytxzdssju9hyx2x7b0_1934.AFullNegate_0 = 25; 

PPP_SCFifo vieyceln9ytxzdssju9hyx2x7b0_1934 (
	.WrEnb(j76d9doaqxhklqvcdhdq_875),
	.WrData(btxdor3w7s0wz6a01w2h64ttw7_595),
	.RdEnb(gk4u03uezyfxqzhe3sck19ipe912npub_345),


	.RdVal(mhd0i1wymo5rjxh485lf8v_607), 
	.RdData(f5hgjxqvr40rh066wfk23q4u55v_814), 
	.Empty(qbdfkld089mfbeyls0t6_374), 
	.AFull_0(m4nvauge4fzynl9oo_105), 
	.Full(w03yll5q833h1oi6jl1hijuwv_687), 

	.WrClk(clk_in_4), 

	.RdClk(clk_out_4), 

	.WrRst(rst_in_4), 
	.RdRst(rst_out_4) 
); 

defparam a3icztxzoprc2rczs9v5y10yptq_1810.DataBits = 64; 
defparam a3icztxzoprc2rczs9v5y10yptq_1810.AddrBits = 9; 
defparam a3icztxzoprc2rczs9v5y10yptq_1810.AFullAssert_0 = 25; 
defparam a3icztxzoprc2rczs9v5y10yptq_1810.AFullNegate_0 = 25; 

PPP_SCFifo a3icztxzoprc2rczs9v5y10yptq_1810 (
	.WrEnb(pl7z8watqow23khqs6qntw1_293),
	.WrData(bc1bfmnp875e17jhwk6d_869),
	.RdEnb(kdl94tme92hwtyx3x9ecsu_562),


	.RdVal(nz3zbxntehhjg88mqoda700d8_732), 
	.RdData(vwyppvglx6vr91jse9p3_864), 
	.Empty(e18nui085mr1u9r5nr7_661), 
	.AFull_0(z17ieoub7ljoov8t4rof_151), 
	.Full(wa0pgd3ymkar3q9unq1qo2c9nac_844), 

	.WrClk(clk_in_5), 

	.RdClk(clk_out_5), 

	.WrRst(rst_in_5), 
	.RdRst(rst_out_5) 
); 

endmodule 

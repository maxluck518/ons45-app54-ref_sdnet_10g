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
// File name: S_SYNCER_for__OUT_.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for__OUT_ (
     packet_in_PACKET0_TVALID, 
     packet_in_PACKET0_TDATA, 
     packet_in_PACKET0_TKEEP, 
     packet_in_PACKET0_TLAST, 
     packet_out_PACKET0_TREADY, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     backpressure_in, 


     packet_out_PACKET0_TVALID, 
     packet_out_PACKET0_TDATA, 
     packet_out_PACKET0_TKEEP, 
     packet_out_PACKET0_TLAST, 
     packet_in_PACKET0_TREADY, 
     tuple_out_TUPLE1_VALID, 
     tuple_out_TUPLE1_DATA, 
     backpressure_out, 

     clk_in_0, 
     clk_out_0, 
     clk_in_1, 
     clk_out_1, 
     rst_in_0, 
     rst_out_0, 
     rst_in_1, 
     rst_out_1 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET0_TVALID ;
 input	 [255:0] packet_in_PACKET0_TDATA ;
 input	 [31:0] packet_in_PACKET0_TKEEP ;
 input		packet_in_PACKET0_TLAST ;
 input		packet_out_PACKET0_TREADY ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [127:0] tuple_in_TUPLE1_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET0_TVALID ;
 output	 [255:0] packet_out_PACKET0_TDATA ;
 output	 [31:0] packet_out_PACKET0_TKEEP ;
 output		packet_out_PACKET0_TLAST ;
 output		packet_in_PACKET0_TREADY ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [127:0] tuple_out_TUPLE1_DATA ;
 output	reg	backpressure_out ;
 input		clk_in_0 ;
 input		clk_out_0 ;
 input		clk_in_1 ;
 input		clk_out_1 ;
 input		rst_in_0 ;
 input		rst_out_0 ;
 input		rst_in_1 ;
 input		rst_out_1 ;






 reg	lybckl3sd0qfn8fn6ro53npgzizimy_23;	 initial lybckl3sd0qfn8fn6ro53npgzizimy_23 = 1'b0 ;
 wire	kn8l95jbtmq4uy78vp4evaj_35 ;
 wire [289:0] hpu04l5o0h8il5md_602 ;
 wire	pes2t8ulhpbhawrhzi89hkwsky_280 ;
 wire	l3h1brqdnhnfnngbs_782 ;
 wire	l3b39a397g8n61ty_250 ;
 wire [8:0] kj4sx0hpfotinrwbrmic5v8boehi_338 ;
 wire [8:0] xdby1b4bvamliazlz1r_741 ;
 wire	w3ewic1z61xcql0z9phk2u5g_713 ;
 wire	v676o6v7z5ad222iih244hnme5r2qdf_671 ;
 wire	uu26s2rhtcrf25vv4m7yg_730 ;
 wire	s65vbozf1n19r3zulhguohfeggvlch_149 ;
 wire	pztzw1wlucd1c1u8w_143 ;
 wire	xzz3sjhuhdd4b6m1ntfe8xprq_187 ;
 wire	dv8ahh26vlym9e8x5nc66h2_566 ;
 reg	txh6ehmax2wzb9c818s1oz7l_718;	 initial txh6ehmax2wzb9c818s1oz7l_718 = 1'b0 ;
 wire	esw1ty4lbqsnd6a0alej0e3rmen_18 ;
 reg	esl6dgtwgzuyd2jl98_633;	 initial esl6dgtwgzuyd2jl98_633 = 1'b0 ;
 reg	zjc65fe77w80oixmcgptv87rhyc51zt_674;	 initial zjc65fe77w80oixmcgptv87rhyc51zt_674 = 1'b0 ;
 wire	m75nx25u3utp0m4va670ix_779 ;
 wire [0:0] pq4k0m5srl62i05nd6w3wwyez9syqr_557 ;
 wire	jgpom3n1m7i86fb2795scxlde_499 ;
 wire	v5v2765o17l5uk7bng5jdv48943z9_306 ;
 wire	ordt4dq3hm7u2cv9rzyacpxvj74tm0bj_283 ;
 wire [8:0] zct335qx2f569sdljvwzd_700 ;
 wire [8:0] hzt32gnotp7atpu7o_493 ;
 wire	wzjl5xjzk1bift32rlvnkl0sq2pjnd_259 ;
 wire	amf6sl24h9tno4jlm7jvd37hotlg_394 ;
 wire	kxqhus72ktqoage9tykap4w3tm_14 ;
 wire	thvm023bf2cycyeypxvtxmc_130 ;
 wire	r9x749dxsz8zlfdwc_382 ;
 wire	zlnf3djklonvp3wdlkx2_378 ;
 reg	npt4hbl5qbv35oedonee_805;	 initial npt4hbl5qbv35oedonee_805 = 1'b0 ;
 reg	soet71y2rbvh2d1b333o00gykk_853;	 initial soet71y2rbvh2d1b333o00gykk_853 = 1'b1 ;
 reg [8:0] bv52quttdwa9lav5qrkoa9yimfom_566;	 initial bv52quttdwa9lav5qrkoa9yimfom_566 = 9'b000000000 ;
 reg	mw33lxw8p7um2qtk056hl_726;	 initial mw33lxw8p7um2qtk056hl_726 = 1'b0 ;
 wire	xyeiscz453o25a5nihcp_580 ;
 wire [127:0] xmng0yjzgv7bbx0uepwonll2cetruhx_807 ;
 wire	mfzok1ja5fw7eexmcnt00aww_354 ;
 wire	p7j1sho0swmlmx3p687_137 ;
 wire	z7a89n93eq2yj21zddnvtpt_182 ;
 wire [7:0] t97p6nitkqpuvwo9wios0bup0r7_656 ;
 wire [7:0] cem8mof8ugd98wdd8xv8_602 ;
 wire	yjf9lepwmaxgogvkiva10t3qrjo_869 ;
 wire	yr8tqsx3kihm134t1nmnkzsly7g3h3f_204 ;
 wire	tochmvc0lxvgckoiazxxgx6u7g_654 ;
 wire	bhuydnrwuq0e222glvfvrf_369 ;
 wire	ndv5gs071anvk182o0u9zimi_727 ;
 wire	xv7s78oyhnvbnqolxhoi55ovnm7j_802 ;
 reg	mae9swk2p2wz3akipacg683nt6uz_349;	 initial mae9swk2p2wz3akipacg683nt6uz_349 = 1'b0 ;
 reg	m8rdxeueqfn491rlth9kldc_616;	 initial m8rdxeueqfn491rlth9kldc_616 = 1'b0 ;
 wire	d9dk79ajed8bptomey1ejr_748 ;
 wire [289:0] pbkokqio4ok7rbdi22rxoud80fcujlrc_395 ;
 wire	qyw8ein9jw0bctvjcdinb8c6sasm9nly_715 ;
 wire [289:0] ib7ufeg6cep4wnegu9qi3e_546 ;
 wire	vlhgsnzwbr22i9er6p4y6had_757 ;
 wire	rd008nvzqywhean2eo_892 ;
 wire	styr2jo1ti9j2nqby_188 ;
 wire	iymyoi0ns00ugaxc6ka534r74_112 ;
 wire	u295nbvzgsor3v6vtrlq5w9vb28lf_536 ;
 wire	rvfinbh5ajdjdbs7k0_716 ;
 wire	cafn6952zxa2xyoirpc9l4m86mtj_194 ;
 wire	olhu3cu0o6mucz478m0yhwy5jqi_740 ;
 wire	tg047sluhnds5u95m3ry5qmiq2gs_375 ;
 wire	xg5haqgcf357akoodm3e7qmvnocbqjnk_624 ;
 wire	syeqg4gktymm51j625i5k9_429 ;
 wire	cos26cb6te62lreb9wp122fz_190 ;
 wire	sm521cbmnimeimmvj4vv_678 ;
 wire	k1cs5j2fib0n040vi9f0b3fwmo_443 ;
 wire [31:0] ep93uf9n678amyf6fybqoqcefevosh_326 ;
 wire [255:0] an4l8w95rvnvpyo4_728 ;
 wire	y5vakp6n2p61cccjxjyxsfy_589 ;
 wire	zbc42a1bs5t596tcndu6agp45mibnu_768 ;
 wire	pxzhume3vgao8muco_653 ;
 wire	clnnh2x4lfunkg60qhgg7o_497 ;
 wire	bqw5erjmln1zu7u0z8s0ule_143 ;
 wire	jb9ide70un6giz0r18ufva2_262 ;
 wire	hh2v2yfuklrtgahlcqlsyrvc0_884 ;
 wire	kwgjqik418k3y9f1mo9ceobpr_879 ;
 wire	idotiawf8ljcro78vd3x1ieqfi_495 ;
 wire	lf671q2jgm5g77rea5e63dc1gxe5v_133 ;
 wire	k5ljrqtc2taxv3ze9t5dliax3mg9_698 ;
 wire	az1thzbgu8s9rixsqwzjg_635 ;
 wire	rm700cnn8ij75ay8dio_498 ;
 wire	diu9n9y7yovifj69no_493 ;
 wire	fi5snlax2w5igkceizxg6yeh_439 ;
 wire	dild4gjkh84ya2wlbzawj_339 ;
 wire [0:0] patjfc0y0ew9e529db6odi_384 ;
 wire	tho2oax51kymnddrkahvjbppi50ijwa_270 ;
 wire	mtmzm8n0wh794bdq4uf4w3red75b_193 ;
 wire [8:0] lxyn7lnv5o4tatr5rk2zrkzn0l316a8k_773 ;
 wire	e2j2n0de54e4vlit_6 ;
 wire	jxvxblj2c9vgy3k02r7c1o6jyq_536 ;
 wire	mjum7jzfx4byzlo8rsebxya4sug_820 ;
 wire	sfzlrzuz98pz5p5bdwu03jaqz_328 ;
 wire	y7nu5k219oqspssvim0i_565 ;
 wire	m21bj1zplc1uq760lujkwp_463 ;
 wire	n4szp2ddf1pjnpurm4gdqs_515 ;
 wire [127:0] chiw8g1h69brvewj698tr7z5_166 ;
 wire	e49mucq3h1c4xh25imhbbd4i_890 ;
 wire [127:0] kgaskq2dzg3v9utk6a24_266 ;
 wire	xgiv2xna7sl3y09l16v9hpxp3wp82ld_668 ;
 wire	hk4lzngs2na8iz0ziylpqeycy0_623 ;
 wire	duuzqyk2w3f9jt1r0rih0zlyq5y4_400 ;
 wire	sggy2tddnyg416vwptwec6_103 ;
 wire	sep5e99mwyaqwlmm7h5mw8hwc5w6r_96 ;


 assign d9dk79ajed8bptomey1ejr_748 = 
	 ~(backpressure_in) ;
 assign pbkokqio4ok7rbdi22rxoud80fcujlrc_395 = 
	{packet_in_PACKET0_TVALID, packet_in_PACKET0_TDATA, packet_in_PACKET0_TKEEP, packet_in_PACKET0_TLAST} ;
 assign qyw8ein9jw0bctvjcdinb8c6sasm9nly_715 	= packet_in_PACKET0_TVALID ;
 assign ib7ufeg6cep4wnegu9qi3e_546 	= pbkokqio4ok7rbdi22rxoud80fcujlrc_395[289:0] ;
 assign vlhgsnzwbr22i9er6p4y6had_757 = 
	sfzlrzuz98pz5p5bdwu03jaqz_328 | sggy2tddnyg416vwptwec6_103 ;
 assign rd008nvzqywhean2eo_892 = 
	1'b0 ;
 assign styr2jo1ti9j2nqby_188 = 
	1'b1 ;
 assign iymyoi0ns00ugaxc6ka534r74_112 = 
	 ~(esw1ty4lbqsnd6a0alej0e3rmen_18) ;
 assign u295nbvzgsor3v6vtrlq5w9vb28lf_536 = 
	m21bj1zplc1uq760lujkwp_463 & vlhgsnzwbr22i9er6p4y6had_757 & sm521cbmnimeimmvj4vv_678 ;
 assign rvfinbh5ajdjdbs7k0_716 = 
	iymyoi0ns00ugaxc6ka534r74_112 & txh6ehmax2wzb9c818s1oz7l_718 & sm521cbmnimeimmvj4vv_678 & sfzlrzuz98pz5p5bdwu03jaqz_328 & m21bj1zplc1uq760lujkwp_463 ;
 assign cafn6952zxa2xyoirpc9l4m86mtj_194 = 
	u295nbvzgsor3v6vtrlq5w9vb28lf_536 | rvfinbh5ajdjdbs7k0_716 ;
 assign olhu3cu0o6mucz478m0yhwy5jqi_740 = 
	d9dk79ajed8bptomey1ejr_748 & cafn6952zxa2xyoirpc9l4m86mtj_194 ;
 assign tg047sluhnds5u95m3ry5qmiq2gs_375 = 
	backpressure_in & lybckl3sd0qfn8fn6ro53npgzizimy_23 & m21bj1zplc1uq760lujkwp_463 & mjum7jzfx4byzlo8rsebxya4sug_820 & sggy2tddnyg416vwptwec6_103 & iymyoi0ns00ugaxc6ka534r74_112 ;
 assign xg5haqgcf357akoodm3e7qmvnocbqjnk_624 = 
	olhu3cu0o6mucz478m0yhwy5jqi_740 | tg047sluhnds5u95m3ry5qmiq2gs_375 ;
 assign syeqg4gktymm51j625i5k9_429 	= xg5haqgcf357akoodm3e7qmvnocbqjnk_624 ;
 assign cos26cb6te62lreb9wp122fz_190 = 
	1'b0 ;
 assign sm521cbmnimeimmvj4vv_678 = 
	 ~(pes2t8ulhpbhawrhzi89hkwsky_280) ;
 assign k1cs5j2fib0n040vi9f0b3fwmo_443 	= hpu04l5o0h8il5md_602[0] ;
 assign ep93uf9n678amyf6fybqoqcefevosh_326 	= hpu04l5o0h8il5md_602[32:1] ;
 assign an4l8w95rvnvpyo4_728 	= hpu04l5o0h8il5md_602[288:33] ;
 assign y5vakp6n2p61cccjxjyxsfy_589 	= hpu04l5o0h8il5md_602[289] ;
 assign zbc42a1bs5t596tcndu6agp45mibnu_768 = 
	lybckl3sd0qfn8fn6ro53npgzizimy_23 | zjc65fe77w80oixmcgptv87rhyc51zt_674 ;
 assign pxzhume3vgao8muco_653 = 
	esl6dgtwgzuyd2jl98_633 | sm521cbmnimeimmvj4vv_678 ;
 assign clnnh2x4lfunkg60qhgg7o_497 = 
	pxzhume3vgao8muco_653 & m21bj1zplc1uq760lujkwp_463 & vlhgsnzwbr22i9er6p4y6had_757 ;
 assign bqw5erjmln1zu7u0z8s0ule_143 = 
	clnnh2x4lfunkg60qhgg7o_497 | txh6ehmax2wzb9c818s1oz7l_718 ;
 assign jb9ide70un6giz0r18ufva2_262 = 
	backpressure_in & y5vakp6n2p61cccjxjyxsfy_589 & bqw5erjmln1zu7u0z8s0ule_143 ;
 assign hh2v2yfuklrtgahlcqlsyrvc0_884 = 
	mjum7jzfx4byzlo8rsebxya4sug_820 & mw33lxw8p7um2qtk056hl_726 ;
 assign kwgjqik418k3y9f1mo9ceobpr_879 = 
	hh2v2yfuklrtgahlcqlsyrvc0_884 | sfzlrzuz98pz5p5bdwu03jaqz_328 | k1cs5j2fib0n040vi9f0b3fwmo_443 ;
 assign idotiawf8ljcro78vd3x1ieqfi_495 = 
	d9dk79ajed8bptomey1ejr_748 & txh6ehmax2wzb9c818s1oz7l_718 & y5vakp6n2p61cccjxjyxsfy_589 & kwgjqik418k3y9f1mo9ceobpr_879 ;
 assign lf671q2jgm5g77rea5e63dc1gxe5v_133 	= txh6ehmax2wzb9c818s1oz7l_718 ;
 assign k5ljrqtc2taxv3ze9t5dliax3mg9_698 	= packet_in_PACKET0_TVALID ;
 assign az1thzbgu8s9rixsqwzjg_635 = 
	1'b0 ;
 assign rm700cnn8ij75ay8dio_498 = 
	1'b1 ;
 assign diu9n9y7yovifj69no_493 = (
	((npt4hbl5qbv35oedonee_805 == 1'b1) && (packet_in_PACKET0_TVALID == 1'b1))?1'b1:
	((soet71y2rbvh2d1b333o00gykk_853 == 1'b1) && (packet_in_PACKET0_TVALID == 1'b1))?1'b1:
	0)  ;
 assign fi5snlax2w5igkceizxg6yeh_439 = (
	((packet_in_PACKET0_TVALID == 1'b1) && (packet_in_PACKET0_TLAST == 1'b1))?1'b1:
	0)  ;
 assign dild4gjkh84ya2wlbzawj_339 = (
	((packet_in_PACKET0_TVALID == 1'b1) && (packet_in_PACKET0_TLAST == 1'b0))?1'b1:
	0)  ;
 assign patjfc0y0ew9e529db6odi_384 = diu9n9y7yovifj69no_493 ;
 assign tho2oax51kymnddrkahvjbppi50ijwa_270 	= xg5haqgcf357akoodm3e7qmvnocbqjnk_624 ;
 assign mtmzm8n0wh794bdq4uf4w3red75b_193 = 
	1'b0 ;
 assign lxyn7lnv5o4tatr5rk2zrkzn0l316a8k_773 	= zct335qx2f569sdljvwzd_700[8:0] ;
 assign e2j2n0de54e4vlit_6 = (
	((lxyn7lnv5o4tatr5rk2zrkzn0l316a8k_773 != bv52quttdwa9lav5qrkoa9yimfom_566))?1'b1:
	0)  ;
 assign jxvxblj2c9vgy3k02r7c1o6jyq_536 = pq4k0m5srl62i05nd6w3wwyez9syqr_557 ;
 assign mjum7jzfx4byzlo8rsebxya4sug_820 = pq4k0m5srl62i05nd6w3wwyez9syqr_557 ;
 assign sfzlrzuz98pz5p5bdwu03jaqz_328 = 
	 ~(mjum7jzfx4byzlo8rsebxya4sug_820) ;
 assign y7nu5k219oqspssvim0i_565 	= jgpom3n1m7i86fb2795scxlde_499 ;
 assign m21bj1zplc1uq760lujkwp_463 = 
	 ~(jgpom3n1m7i86fb2795scxlde_499) ;
 assign n4szp2ddf1pjnpurm4gdqs_515 = 
	sggy2tddnyg416vwptwec6_103 & m21bj1zplc1uq760lujkwp_463 & jxvxblj2c9vgy3k02r7c1o6jyq_536 & xg5haqgcf357akoodm3e7qmvnocbqjnk_624 ;
 assign chiw8g1h69brvewj698tr7z5_166 = 
	tuple_in_TUPLE1_DATA ;
 assign e49mucq3h1c4xh25imhbbd4i_890 	= tuple_in_TUPLE1_VALID ;
 assign kgaskq2dzg3v9utk6a24_266 	= chiw8g1h69brvewj698tr7z5_166[127:0] ;
 assign xgiv2xna7sl3y09l16v9hpxp3wp82ld_668 = 
	 ~(mfzok1ja5fw7eexmcnt00aww_354) ;
 assign hk4lzngs2na8iz0ziylpqeycy0_623 	= n4szp2ddf1pjnpurm4gdqs_515 ;
 assign duuzqyk2w3f9jt1r0rih0zlyq5y4_400 = 
	1'b0 ;
 assign sggy2tddnyg416vwptwec6_103 = 
	sm521cbmnimeimmvj4vv_678 & xgiv2xna7sl3y09l16v9hpxp3wp82ld_668 ;
 assign sep5e99mwyaqwlmm7h5mw8hwc5w6r_96 = 
	mae9swk2p2wz3akipacg683nt6uz_349 | m8rdxeueqfn491rlth9kldc_616 ;
 assign packet_out_PACKET0_TVALID 	= lf671q2jgm5g77rea5e63dc1gxe5v_133 ;
 assign packet_out_PACKET0_TDATA 	= an4l8w95rvnvpyo4_728[255:0] ;
 assign packet_out_PACKET0_TKEEP 	= ep93uf9n678amyf6fybqoqcefevosh_326[31:0] ;
 assign packet_out_PACKET0_TLAST 	= k1cs5j2fib0n040vi9f0b3fwmo_443 ;
 assign packet_in_PACKET0_TREADY 	= packet_out_PACKET0_TREADY ;
 assign tuple_out_TUPLE1_VALID 	= mw33lxw8p7um2qtk056hl_726 ;
 assign tuple_out_TUPLE1_DATA 	= xmng0yjzgv7bbx0uepwonll2cetruhx_807[127:0] ;


assign dv8ahh26vlym9e8x5nc66h2_566 = (
	((xg5haqgcf357akoodm3e7qmvnocbqjnk_624 == 1'b1))?styr2jo1ti9j2nqby_188 :
	((d9dk79ajed8bptomey1ejr_748 == 1'b1))?rd008nvzqywhean2eo_892 :
	txh6ehmax2wzb9c818s1oz7l_718 ) ;

assign esw1ty4lbqsnd6a0alej0e3rmen_18 = (
	((txh6ehmax2wzb9c818s1oz7l_718 == 1'b1) && (d9dk79ajed8bptomey1ejr_748 == 1'b1))?rd008nvzqywhean2eo_892 :
	txh6ehmax2wzb9c818s1oz7l_718 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	lybckl3sd0qfn8fn6ro53npgzizimy_23 <= 1'b0 ;
	txh6ehmax2wzb9c818s1oz7l_718 <= 1'b0 ;
	esl6dgtwgzuyd2jl98_633 <= 1'b0 ;
	zjc65fe77w80oixmcgptv87rhyc51zt_674 <= 1'b0 ;
	bv52quttdwa9lav5qrkoa9yimfom_566 <= 9'b000000000 ;
	mae9swk2p2wz3akipacg683nt6uz_349 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		lybckl3sd0qfn8fn6ro53npgzizimy_23 <= backpressure_in ;
		txh6ehmax2wzb9c818s1oz7l_718 <= dv8ahh26vlym9e8x5nc66h2_566 ;
		esl6dgtwgzuyd2jl98_633 <= sm521cbmnimeimmvj4vv_678 ;
		zjc65fe77w80oixmcgptv87rhyc51zt_674 <= xg5haqgcf357akoodm3e7qmvnocbqjnk_624 ;
		bv52quttdwa9lav5qrkoa9yimfom_566 <= lxyn7lnv5o4tatr5rk2zrkzn0l316a8k_773 ;
		mae9swk2p2wz3akipacg683nt6uz_349 <= l3h1brqdnhnfnngbs_782 ;
		backpressure_out <= sep5e99mwyaqwlmm7h5mw8hwc5w6r_96 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	npt4hbl5qbv35oedonee_805 <= 1'b0 ;
	soet71y2rbvh2d1b333o00gykk_853 <= 1'b1 ;
   end
  else
  begin
	if (dild4gjkh84ya2wlbzawj_339) 
	begin 
	  npt4hbl5qbv35oedonee_805 <= 1'b0 ;
	 end 
	else 
	begin 
		if (fi5snlax2w5igkceizxg6yeh_439) 
		begin 
			npt4hbl5qbv35oedonee_805 <= rm700cnn8ij75ay8dio_498 ;
		end 
	end 
	if (diu9n9y7yovifj69no_493) 
	begin 
		soet71y2rbvh2d1b333o00gykk_853 <= az1thzbgu8s9rixsqwzjg_635 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	mw33lxw8p7um2qtk056hl_726 <= 1'b0 ;
	m8rdxeueqfn491rlth9kldc_616 <= 1'b0 ;
   end
  else
  begin
		mw33lxw8p7um2qtk056hl_726 <= n4szp2ddf1pjnpurm4gdqs_515 ;
		m8rdxeueqfn491rlth9kldc_616 <= p7j1sho0swmlmx3p687_137 ;
  end
end

defparam i6wydo6jo8chhtt3_885.WRITE_DATA_WIDTH = 290; 
defparam i6wydo6jo8chhtt3_885.FIFO_WRITE_DEPTH = 512; 
defparam i6wydo6jo8chhtt3_885.PROG_FULL_THRESH = 143; 
defparam i6wydo6jo8chhtt3_885.PROG_EMPTY_THRESH = 143; 
defparam i6wydo6jo8chhtt3_885.READ_MODE = "STD"; 
defparam i6wydo6jo8chhtt3_885.WR_DATA_COUNT_WIDTH = 9; 
defparam i6wydo6jo8chhtt3_885.RD_DATA_COUNT_WIDTH = 9; 
defparam i6wydo6jo8chhtt3_885.DOUT_RESET_VALUE = "0"; 
defparam i6wydo6jo8chhtt3_885.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync i6wydo6jo8chhtt3_885 (
	.wr_en(qyw8ein9jw0bctvjcdinb8c6sasm9nly_715),
	.din(ib7ufeg6cep4wnegu9qi3e_546),
	.rd_en(syeqg4gktymm51j625i5k9_429),
	.sleep(cos26cb6te62lreb9wp122fz_190),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(kn8l95jbtmq4uy78vp4evaj_35), 
	.dout(hpu04l5o0h8il5md_602), 
	.empty(pes2t8ulhpbhawrhzi89hkwsky_280), 
	.prog_full(l3h1brqdnhnfnngbs_782), 
	.full(l3b39a397g8n61ty_250), 
	.rd_data_count(kj4sx0hpfotinrwbrmic5v8boehi_338), 
	.wr_data_count(xdby1b4bvamliazlz1r_741), 
	.wr_rst_busy(w3ewic1z61xcql0z9phk2u5g_713), 
	.rd_rst_busy(v676o6v7z5ad222iih244hnme5r2qdf_671), 
	.overflow(uu26s2rhtcrf25vv4m7yg_730), 
	.underflow(s65vbozf1n19r3zulhguohfeggvlch_149), 
	.sbiterr(pztzw1wlucd1c1u8w_143), 
	.dbiterr(xzz3sjhuhdd4b6m1ntfe8xprq_187), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam nifufsjm49tsd9nukl4_2703.WRITE_DATA_WIDTH = 1; 
defparam nifufsjm49tsd9nukl4_2703.FIFO_WRITE_DEPTH = 512; 
defparam nifufsjm49tsd9nukl4_2703.PROG_FULL_THRESH = 143; 
defparam nifufsjm49tsd9nukl4_2703.PROG_EMPTY_THRESH = 143; 
defparam nifufsjm49tsd9nukl4_2703.READ_MODE = "FWFT"; 
defparam nifufsjm49tsd9nukl4_2703.WR_DATA_COUNT_WIDTH = 9; 
defparam nifufsjm49tsd9nukl4_2703.RD_DATA_COUNT_WIDTH = 9; 
defparam nifufsjm49tsd9nukl4_2703.DOUT_RESET_VALUE = "0"; 
defparam nifufsjm49tsd9nukl4_2703.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync nifufsjm49tsd9nukl4_2703 (
	.wr_en(k5ljrqtc2taxv3ze9t5dliax3mg9_698),
	.din(patjfc0y0ew9e529db6odi_384),
	.rd_en(tho2oax51kymnddrkahvjbppi50ijwa_270),
	.sleep(mtmzm8n0wh794bdq4uf4w3red75b_193),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(m75nx25u3utp0m4va670ix_779), 
	.dout(pq4k0m5srl62i05nd6w3wwyez9syqr_557), 
	.empty(jgpom3n1m7i86fb2795scxlde_499), 
	.prog_full(v5v2765o17l5uk7bng5jdv48943z9_306), 
	.full(ordt4dq3hm7u2cv9rzyacpxvj74tm0bj_283), 
	.rd_data_count(zct335qx2f569sdljvwzd_700), 
	.wr_data_count(hzt32gnotp7atpu7o_493), 
	.wr_rst_busy(wzjl5xjzk1bift32rlvnkl0sq2pjnd_259), 
	.rd_rst_busy(amf6sl24h9tno4jlm7jvd37hotlg_394), 
	.overflow(kxqhus72ktqoage9tykap4w3tm_14), 
	.underflow(thvm023bf2cycyeypxvtxmc_130), 
	.sbiterr(r9x749dxsz8zlfdwc_382), 
	.dbiterr(zlnf3djklonvp3wdlkx2_378), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam brbxm7u7xiustwau8a3piev_1471.WRITE_DATA_WIDTH = 128; 
defparam brbxm7u7xiustwau8a3piev_1471.FIFO_WRITE_DEPTH = 256; 
defparam brbxm7u7xiustwau8a3piev_1471.PROG_FULL_THRESH = 79; 
defparam brbxm7u7xiustwau8a3piev_1471.PROG_EMPTY_THRESH = 79; 
defparam brbxm7u7xiustwau8a3piev_1471.READ_MODE = "STD"; 
defparam brbxm7u7xiustwau8a3piev_1471.WR_DATA_COUNT_WIDTH = 8; 
defparam brbxm7u7xiustwau8a3piev_1471.RD_DATA_COUNT_WIDTH = 8; 
defparam brbxm7u7xiustwau8a3piev_1471.DOUT_RESET_VALUE = "0"; 
defparam brbxm7u7xiustwau8a3piev_1471.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async brbxm7u7xiustwau8a3piev_1471 (
	.wr_en(e49mucq3h1c4xh25imhbbd4i_890),
	.din(kgaskq2dzg3v9utk6a24_266),
	.rd_en(hk4lzngs2na8iz0ziylpqeycy0_623),
	.sleep(duuzqyk2w3f9jt1r0rih0zlyq5y4_400),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xyeiscz453o25a5nihcp_580), 
	.dout(xmng0yjzgv7bbx0uepwonll2cetruhx_807), 
	.empty(mfzok1ja5fw7eexmcnt00aww_354), 
	.prog_full(p7j1sho0swmlmx3p687_137), 
	.full(z7a89n93eq2yj21zddnvtpt_182), 
	.rd_data_count(t97p6nitkqpuvwo9wios0bup0r7_656), 
	.wr_data_count(cem8mof8ugd98wdd8xv8_602), 
	.wr_rst_busy(yjf9lepwmaxgogvkiva10t3qrjo_869), 
	.rd_rst_busy(yr8tqsx3kihm134t1nmnkzsly7g3h3f_204), 
	.overflow(tochmvc0lxvgckoiazxxgx6u7g_654), 
	.underflow(bhuydnrwuq0e222glvfvrf_369), 
	.sbiterr(ndv5gs071anvk182o0u9zimi_727), 
	.dbiterr(xv7s78oyhnvbnqolxhoi55ovnm7j_802), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

endmodule 

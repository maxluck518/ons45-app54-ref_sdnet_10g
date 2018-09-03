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
// File name: S_SYNCER_for_S_SYNCER_for_S_PROTOCOL_ADAPTER_EGRESS.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_S_SYNCER_for_S_PROTOCOL_ADAPTER_EGRESS (
     packet_in_PACKET4_SOF, 
     packet_in_PACKET4_EOF, 
     packet_in_PACKET4_VAL, 
     packet_in_PACKET4_DAT, 
     packet_in_PACKET4_CNT, 
     packet_in_PACKET4_ERR, 
     packet_out_PACKET4_RDY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     tuple_in_TUPLE3_VALID, 
     tuple_in_TUPLE3_DATA, 
     backpressure_in, 


     packet_out_PACKET4_SOF, 
     packet_out_PACKET4_EOF, 
     packet_out_PACKET4_VAL, 
     packet_out_PACKET4_DAT, 
     packet_out_PACKET4_CNT, 
     packet_out_PACKET4_ERR, 
     packet_in_PACKET4_RDY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
     tuple_out_TUPLE1_VALID, 
     tuple_out_TUPLE1_DATA, 
     tuple_out_TUPLE3_VALID, 
     tuple_out_TUPLE3_DATA, 
     backpressure_out, 

     clk_in_0, 
     clk_out_0, 
     clk_in_1, 
     clk_out_1, 
     clk_in_2, 
     clk_out_2, 
     clk_in_3, 
     clk_out_3, 
     rst_in_0, 
     rst_out_0, 
     rst_in_1, 
     rst_out_1, 
     rst_in_2, 
     rst_out_2, 
     rst_in_3, 
     rst_out_3 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET4_SOF ;
 input		packet_in_PACKET4_EOF ;
 input		packet_in_PACKET4_VAL ;
 input	 [255:0] packet_in_PACKET4_DAT ;
 input	 [5:0] packet_in_PACKET4_CNT ;
 input		packet_in_PACKET4_ERR ;
 input		packet_out_PACKET4_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [127:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [111:0] tuple_in_TUPLE1_DATA ;
 input		tuple_in_TUPLE3_VALID ;
 input	 [21:0] tuple_in_TUPLE3_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET4_SOF ;
 output		packet_out_PACKET4_EOF ;
 output		packet_out_PACKET4_VAL ;
 output	 [255:0] packet_out_PACKET4_DAT ;
 output	 [5:0] packet_out_PACKET4_CNT ;
 output		packet_out_PACKET4_ERR ;
 output		packet_in_PACKET4_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [127:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [111:0] tuple_out_TUPLE1_DATA ;
 output		tuple_out_TUPLE3_VALID ;
 output	 [21:0] tuple_out_TUPLE3_DATA ;
 output	reg	backpressure_out ;
 input		clk_in_0 ;
 input		clk_out_0 ;
 input		clk_in_1 ;
 input		clk_out_1 ;
 input		clk_in_2 ;
 input		clk_out_2 ;
 input		clk_in_3 ;
 input		clk_out_3 ;
 input		rst_in_0 ;
 input		rst_out_0 ;
 input		rst_in_1 ;
 input		rst_out_1 ;
 input		rst_in_2 ;
 input		rst_out_2 ;
 input		rst_in_3 ;
 input		rst_out_3 ;






 reg	bm1z6zzye0b8ak5sk85ypa3fv1_712;	 initial bm1z6zzye0b8ak5sk85ypa3fv1_712 = 1'b0 ;
 wire	mwvxbt424jnik2s34pktv4_676 ;
 wire [265:0] wk9i1ap6k1dy67aal2iy0n_589 ;
 wire	d4v81zj6lvxayh4qfn_792 ;
 wire	pzwwkgnci9jd4kbcwik3vlt_760 ;
 wire	rex2ljokjydi8h8b7luvbqwq_547 ;
 wire [8:0] rsyz906s5soqmnxr_748 ;
 wire [8:0] db2jijvvhee8t4z3ys4itu83lrufbyhx_102 ;
 wire	ok1lkyfni78bdr7cdterguwz1gsw_704 ;
 wire	r213noh7s3qfnavwp6aym_894 ;
 wire	fz6vsslo6jk5jjpvl8_247 ;
 wire	aq8efgcf2etg1pkddlv8u3jxke_75 ;
 wire	iviszcoairz9mbeau257zy5su5ecyha_0 ;
 wire	pdod612utazp4mjkx_810 ;
 wire	pkg6twp9ro3luro947a_124 ;
 reg	piv0q37w0uxyzk4dage2qr6_16;	 initial piv0q37w0uxyzk4dage2qr6_16 = 1'b0 ;
 wire	zpqkowowsiy4ciqqqrf_492 ;
 reg	q6srhk3v0my9u2fvcc5t72vzug_735;	 initial q6srhk3v0my9u2fvcc5t72vzug_735 = 1'b0 ;
 reg	mz9seew5k3vlej3z54rz_662;	 initial mz9seew5k3vlej3z54rz_662 = 1'b0 ;
 wire	trc4bqqkp238p2o1okp6e7h8vciivx_749 ;
 wire [0:0] vbq81p8ph3f69jck56ep9_102 ;
 wire	p66aed7ohz3apb14ytkeq5jc8y_544 ;
 wire	e7qggn14plw25h69dfs9azsf2y8_365 ;
 wire	n8puv0w63r6ergifh_308 ;
 wire [8:0] it6yjkbk2s2gjlcu5b_822 ;
 wire [8:0] itepum93sflmzkqhi_111 ;
 wire	jwgf0f69mno209i02qdae53xgc_228 ;
 wire	olnhfa75li2qgcyevcdje7zygfbs1l_153 ;
 wire	lyb252a5ywmjjtik_361 ;
 wire	twmw67l1gnyk1k6a167a7zzvoxf_191 ;
 wire	i4wh8jtbd1p3wmlqiw6jexxifedzoy9f_290 ;
 wire	dlg7xtuwmtqid8lqn5w1v60u8ty11y_870 ;
 reg [8:0] iao0germjnrzmq3weszu18axn4875w56_31;	 initial iao0germjnrzmq3weszu18axn4875w56_31 = 9'b000000000 ;
 reg	r4lzcfut9mn73rnl1x9_286;	 initial r4lzcfut9mn73rnl1x9_286 = 1'b0 ;
 wire	lz7scz0ujz7zknfhmeu2_855 ;
 wire [127:0] a3kngqecv3dr1u1z1ufhk_8 ;
 wire	a55ipcc95x7iyjr0la_390 ;
 wire	zc3xc5etdi806dg31357jg2o07g_334 ;
 wire	c1ujf6ecbj4dktfju_372 ;
 wire [7:0] ee5n0en7qjz5adizuefrdu_637 ;
 wire [7:0] rhtbnoc7lp28f8xr_568 ;
 wire	p3lq187bxowifxobdsh0qxjfi1k1f_87 ;
 wire	fxk6aluoxn5u3qv28la52h3xz4_737 ;
 wire	dqr9g5bh2w9lgsxdczw8nvp7mqq_744 ;
 wire	wiafj8d06g4qa9iufku4qjruffttxo_727 ;
 wire	ranrpae6gw3zkufxa06mn4o_588 ;
 wire	kaekp45hjsr56jmyeti7h0_700 ;
 wire	opova9uowr7lxejk69jmr_762 ;
 wire [111:0] mwnnmd2up6x4sz7q3d3diqhzcjb1_60 ;
 wire	uxs3tvpdyw2fka0g3zwy_624 ;
 wire	fjq1ty6zasojkhnnkil9rslc8pi_721 ;
 wire	zzafg0rwj8xwa92d_464 ;
 wire [7:0] z4oudstz5bnveai00ax5qqre8_905 ;
 wire [7:0] fxungaiarfhi9fam7_853 ;
 wire	okvyek3ayx6q931tw2zwmndq2os_277 ;
 wire	b51pkbab7f08j3lmaah6rb4889oh_506 ;
 wire	kh293uvsakt6a86bf3d3bbbf1l7wtz3i_5 ;
 wire	yovus87ocrjizyxllt1k6u01pxp1u5o0_764 ;
 wire	zp6ies7yyr9vlej7g3ndex_21 ;
 wire	x1x4gnsh7bgbt9op2c_465 ;
 wire	erg3lhr6v87mnnu8y9n1nwsl2tr2o188_467 ;
 wire [21:0] bompl1hxrinydg47ruxwqobz3gkvcxa_529 ;
 wire	t1er5emgq9m8aqdzl98g_577 ;
 wire	r9q92gwlxil9lva4muw0lwxskcu_104 ;
 wire	xvb8bbi73m5m5fbt1nset9xq_225 ;
 wire [7:0] pvvjf4zkosfcuz7wb4jo4zr4mwxl_351 ;
 wire [7:0] g8klb1mjye4aevf6y8mriwwe_128 ;
 wire	nf31eygbj7zd1b8x9ksl0dsh9ifuo_57 ;
 wire	rgotn53u4rgor2cvn5_449 ;
 wire	jcs0g30qy1p7mj4c9c_223 ;
 wire	bwjhxb16fch66dwph7ljljbo_5 ;
 wire	dp7hajr8c3keojrz1o3o8_121 ;
 wire	pwg5auzff86q3jjnd_256 ;
 reg	mc4ly9fmgq5celz5pmok9_332;	 initial mc4ly9fmgq5celz5pmok9_332 = 1'b0 ;
 reg	f9ydlgwbok5eft3vy4ftf_770;	 initial f9ydlgwbok5eft3vy4ftf_770 = 1'b0 ;
 reg	fx8wg4ejpvjtwji5c2iz_788;	 initial fx8wg4ejpvjtwji5c2iz_788 = 1'b0 ;
 reg	p66oinufc53xuv8h3k626_480;	 initial p66oinufc53xuv8h3k626_480 = 1'b0 ;
 wire	jcvictrpbilhel2sn88sclxuiccerrhu_571 ;
 wire [265:0] fz4ycbdggdug6kkoezaop7yb5_757 ;
 wire	ot5mehjml3i1rbdj3kr57iu0_590 ;
 wire [265:0] tmr851nhxyd4duatin4emn_571 ;
 wire	zjzrz5fxmqjx9frt4gvc_27 ;
 wire	okctif97z7gvl0lixqm7nz6tf7_480 ;
 wire	oa11ikltyiz0v0fbp_822 ;
 wire	v2gwjw6qco80oc73dbs3sfl_240 ;
 wire	g0u6rh4ejky8cgvw3r02ik0t9wu_190 ;
 wire	wyndnjfxxs7y4ypul3co7yssqer_84 ;
 wire	td4saq69odn841cg7xuwr5myhy9p83_453 ;
 wire	g3jbzbusho4uun61zvtyai_564 ;
 wire	kkdfi968g1ar8xvmb6s6ma6823o7zn_504 ;
 wire	cs9vsagklbza3qte_562 ;
 wire [5:0] zrbujzbmd0jisjhwr4trswhdmv8k_266 ;
 wire [255:0] apxuwal43nauhr3fwx_584 ;
 wire	tfh6aclnb8dx3edz08mpi_849 ;
 wire	afr4ta4gcbly4162xzs8herzh0bk2u9u_106 ;
 wire	j62kzjht60cfeqwub799n7fyul_704 ;
 wire	gfj74gav4i7x2dnioon9ykvo6kx5pbud_336 ;
 wire	voiftdv0xfbbjfry_641 ;
 wire [0:0] ahwy0wrws8v82hnp62b4ab_705 ;
 wire	z1rhe39sjpodxnpo5o9exfbfnad_781 ;
 wire	ocn7d7l8svkuukj4oc20khmmwc_221 ;
 wire [8:0] aumiqoo52iivgayj_605 ;
 wire	r36nkah78zf7owj01pup1_155 ;
 wire	d9obf1qy4uijhvbhr1ml_742 ;
 wire	pbpjwzqbd91udr9trc3iiiz0l_328 ;
 wire	q4d9z49w5xv5ccriat1_676 ;
 wire	uwisv8tn7wdmnr34yjli67yev5ntkxop_514 ;
 wire	o3s183tm8vnv7njizvc3e_627 ;
 wire	h6wd114qy7aontqv41gu73r_346 ;
 wire [127:0] q48u61h2sd2yqdwr3opvfm277tu_15 ;
 wire	qrwk039i9et2op6df26ve900ypy4u_899 ;
 wire [127:0] l1o20idmwq6qdabkhrc_198 ;
 wire	xsw64fdflhmqcd1rp8bq6ets7_27 ;
 wire	xhanpkxy7636w730ze2no_21 ;
 wire	wkje9l80fncxsnsb179tq8lkyxjc_715 ;
 wire [111:0] cgnbafbd8xxlfgn71lk_190 ;
 wire	k12rvv0smcfxon2eqnol3j8q5si9_818 ;
 wire [111:0] hsvc1njfybhtv5v5olqxbeuf053f22y4_766 ;
 wire	we597bwzubxhpjn52x6a6vfxfduzs_310 ;
 wire	f5in3kab4psiqkww5wbwkbfydm_814 ;
 wire	s9psr52txicrtdeqdwpmwfv4_717 ;
 wire [21:0] s49uk1gosjsnl9ygqkp_723 ;
 wire	rlqeqgpr1mtlc0sizszisbksrlua6hn_286 ;
 wire [21:0] p6f5vw1fa2y8w388ev_431 ;
 wire	x8mmqec5kmgq5g76kq8e6ftowq9kz8_210 ;
 wire	bcvaieg0y4bfaa1e2e2ta2hdofud_673 ;
 wire	vnopu3iut3qfeurd_318 ;
 wire	h4m86a1su4yxwdvs2gngrziix_327 ;
 wire	knala39vif8u7da1xs0gb8ng3_180 ;


 assign jcvictrpbilhel2sn88sclxuiccerrhu_571 = 
	 ~(backpressure_in) ;
 assign fz4ycbdggdug6kkoezaop7yb5_757 = 
	{packet_in_PACKET4_SOF, packet_in_PACKET4_EOF, packet_in_PACKET4_VAL, packet_in_PACKET4_DAT, packet_in_PACKET4_CNT, packet_in_PACKET4_ERR} ;
 assign ot5mehjml3i1rbdj3kr57iu0_590 	= packet_in_PACKET4_VAL ;
 assign tmr851nhxyd4duatin4emn_571 	= fz4ycbdggdug6kkoezaop7yb5_757[265:0] ;
 assign zjzrz5fxmqjx9frt4gvc_27 = 
	q4d9z49w5xv5ccriat1_676 | h4m86a1su4yxwdvs2gngrziix_327 ;
 assign okctif97z7gvl0lixqm7nz6tf7_480 = 
	1'b0 ;
 assign oa11ikltyiz0v0fbp_822 = 
	1'b1 ;
 assign v2gwjw6qco80oc73dbs3sfl_240 = 
	 ~(zpqkowowsiy4ciqqqrf_492) ;
 assign g0u6rh4ejky8cgvw3r02ik0t9wu_190 = 
	jcvictrpbilhel2sn88sclxuiccerrhu_571 & o3s183tm8vnv7njizvc3e_627 & zjzrz5fxmqjx9frt4gvc_27 ;
 assign wyndnjfxxs7y4ypul3co7yssqer_84 	= g0u6rh4ejky8cgvw3r02ik0t9wu_190 ;
 assign td4saq69odn841cg7xuwr5myhy9p83_453 	= wyndnjfxxs7y4ypul3co7yssqer_84 ;
 assign g3jbzbusho4uun61zvtyai_564 = 
	1'b0 ;
 assign kkdfi968g1ar8xvmb6s6ma6823o7zn_504 = 
	 ~(d4v81zj6lvxayh4qfn_792) ;
 assign cs9vsagklbza3qte_562 	= wk9i1ap6k1dy67aal2iy0n_589[0] ;
 assign zrbujzbmd0jisjhwr4trswhdmv8k_266 	= wk9i1ap6k1dy67aal2iy0n_589[6:1] ;
 assign apxuwal43nauhr3fwx_584 	= wk9i1ap6k1dy67aal2iy0n_589[262:7] ;
 assign tfh6aclnb8dx3edz08mpi_849 	= wk9i1ap6k1dy67aal2iy0n_589[263] ;
 assign afr4ta4gcbly4162xzs8herzh0bk2u9u_106 	= wk9i1ap6k1dy67aal2iy0n_589[264] ;
 assign j62kzjht60cfeqwub799n7fyul_704 	= wk9i1ap6k1dy67aal2iy0n_589[265] ;
 assign gfj74gav4i7x2dnioon9ykvo6kx5pbud_336 = 
	mz9seew5k3vlej3z54rz_662 & tfh6aclnb8dx3edz08mpi_849 ;
 assign voiftdv0xfbbjfry_641 	= packet_in_PACKET4_VAL ;
 assign ahwy0wrws8v82hnp62b4ab_705 = packet_in_PACKET4_SOF ;
 assign z1rhe39sjpodxnpo5o9exfbfnad_781 	= wyndnjfxxs7y4ypul3co7yssqer_84 ;
 assign ocn7d7l8svkuukj4oc20khmmwc_221 = 
	1'b0 ;
 assign aumiqoo52iivgayj_605 	= it6yjkbk2s2gjlcu5b_822[8:0] ;
 assign r36nkah78zf7owj01pup1_155 = (
	((aumiqoo52iivgayj_605 != iao0germjnrzmq3weszu18axn4875w56_31))?1'b1:
	0)  ;
 assign d9obf1qy4uijhvbhr1ml_742 = vbq81p8ph3f69jck56ep9_102 ;
 assign pbpjwzqbd91udr9trc3iiiz0l_328 = vbq81p8ph3f69jck56ep9_102 ;
 assign q4d9z49w5xv5ccriat1_676 = 
	 ~(pbpjwzqbd91udr9trc3iiiz0l_328) ;
 assign uwisv8tn7wdmnr34yjli67yev5ntkxop_514 	= p66aed7ohz3apb14ytkeq5jc8y_544 ;
 assign o3s183tm8vnv7njizvc3e_627 = 
	 ~(p66aed7ohz3apb14ytkeq5jc8y_544) ;
 assign h6wd114qy7aontqv41gu73r_346 = 
	jcvictrpbilhel2sn88sclxuiccerrhu_571 & h4m86a1su4yxwdvs2gngrziix_327 & o3s183tm8vnv7njizvc3e_627 & d9obf1qy4uijhvbhr1ml_742 ;
 assign q48u61h2sd2yqdwr3opvfm277tu_15 = 
	tuple_in_TUPLE0_DATA ;
 assign qrwk039i9et2op6df26ve900ypy4u_899 	= tuple_in_TUPLE0_VALID ;
 assign l1o20idmwq6qdabkhrc_198 	= q48u61h2sd2yqdwr3opvfm277tu_15[127:0] ;
 assign xsw64fdflhmqcd1rp8bq6ets7_27 = 
	 ~(a55ipcc95x7iyjr0la_390) ;
 assign xhanpkxy7636w730ze2no_21 	= h6wd114qy7aontqv41gu73r_346 ;
 assign wkje9l80fncxsnsb179tq8lkyxjc_715 = 
	1'b0 ;
 assign cgnbafbd8xxlfgn71lk_190 = 
	tuple_in_TUPLE1_DATA ;
 assign k12rvv0smcfxon2eqnol3j8q5si9_818 	= tuple_in_TUPLE1_VALID ;
 assign hsvc1njfybhtv5v5olqxbeuf053f22y4_766 	= cgnbafbd8xxlfgn71lk_190[111:0] ;
 assign we597bwzubxhpjn52x6a6vfxfduzs_310 = 
	 ~(uxs3tvpdyw2fka0g3zwy_624) ;
 assign f5in3kab4psiqkww5wbwkbfydm_814 	= h6wd114qy7aontqv41gu73r_346 ;
 assign s9psr52txicrtdeqdwpmwfv4_717 = 
	1'b0 ;
 assign s49uk1gosjsnl9ygqkp_723 = 
	tuple_in_TUPLE3_DATA ;
 assign rlqeqgpr1mtlc0sizszisbksrlua6hn_286 	= tuple_in_TUPLE3_VALID ;
 assign p6f5vw1fa2y8w388ev_431 	= s49uk1gosjsnl9ygqkp_723[21:0] ;
 assign x8mmqec5kmgq5g76kq8e6ftowq9kz8_210 = 
	 ~(t1er5emgq9m8aqdzl98g_577) ;
 assign bcvaieg0y4bfaa1e2e2ta2hdofud_673 	= h6wd114qy7aontqv41gu73r_346 ;
 assign vnopu3iut3qfeurd_318 = 
	1'b0 ;
 assign h4m86a1su4yxwdvs2gngrziix_327 = 
	kkdfi968g1ar8xvmb6s6ma6823o7zn_504 & xsw64fdflhmqcd1rp8bq6ets7_27 & we597bwzubxhpjn52x6a6vfxfduzs_310 & x8mmqec5kmgq5g76kq8e6ftowq9kz8_210 ;
 assign knala39vif8u7da1xs0gb8ng3_180 = 
	mc4ly9fmgq5celz5pmok9_332 | f9ydlgwbok5eft3vy4ftf_770 | fx8wg4ejpvjtwji5c2iz_788 | p66oinufc53xuv8h3k626_480 ;
 assign packet_out_PACKET4_SOF 	= j62kzjht60cfeqwub799n7fyul_704 ;
 assign packet_out_PACKET4_EOF 	= afr4ta4gcbly4162xzs8herzh0bk2u9u_106 ;
 assign packet_out_PACKET4_VAL 	= gfj74gav4i7x2dnioon9ykvo6kx5pbud_336 ;
 assign packet_out_PACKET4_DAT 	= apxuwal43nauhr3fwx_584[255:0] ;
 assign packet_out_PACKET4_CNT 	= zrbujzbmd0jisjhwr4trswhdmv8k_266[5:0] ;
 assign packet_out_PACKET4_ERR 	= cs9vsagklbza3qte_562 ;
 assign packet_in_PACKET4_RDY 	= packet_out_PACKET4_RDY ;
 assign tuple_out_TUPLE0_VALID 	= r4lzcfut9mn73rnl1x9_286 ;
 assign tuple_out_TUPLE0_DATA 	= a3kngqecv3dr1u1z1ufhk_8[127:0] ;
 assign tuple_out_TUPLE1_VALID 	= r4lzcfut9mn73rnl1x9_286 ;
 assign tuple_out_TUPLE1_DATA 	= mwnnmd2up6x4sz7q3d3diqhzcjb1_60[111:0] ;
 assign tuple_out_TUPLE3_VALID 	= r4lzcfut9mn73rnl1x9_286 ;
 assign tuple_out_TUPLE3_DATA 	= bompl1hxrinydg47ruxwqobz3gkvcxa_529[21:0] ;


assign pkg6twp9ro3luro947a_124 = (
	((wyndnjfxxs7y4ypul3co7yssqer_84 == 1'b1))?oa11ikltyiz0v0fbp_822 :
	((jcvictrpbilhel2sn88sclxuiccerrhu_571 == 1'b1))?okctif97z7gvl0lixqm7nz6tf7_480 :
	piv0q37w0uxyzk4dage2qr6_16 ) ;

assign zpqkowowsiy4ciqqqrf_492 = (
	((piv0q37w0uxyzk4dage2qr6_16 == 1'b1) && (jcvictrpbilhel2sn88sclxuiccerrhu_571 == 1'b1))?okctif97z7gvl0lixqm7nz6tf7_480 :
	piv0q37w0uxyzk4dage2qr6_16 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	bm1z6zzye0b8ak5sk85ypa3fv1_712 <= 1'b0 ;
	piv0q37w0uxyzk4dage2qr6_16 <= 1'b0 ;
	q6srhk3v0my9u2fvcc5t72vzug_735 <= 1'b0 ;
	mz9seew5k3vlej3z54rz_662 <= 1'b0 ;
	iao0germjnrzmq3weszu18axn4875w56_31 <= 9'b000000000 ;
	mc4ly9fmgq5celz5pmok9_332 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		bm1z6zzye0b8ak5sk85ypa3fv1_712 <= backpressure_in ;
		piv0q37w0uxyzk4dage2qr6_16 <= pkg6twp9ro3luro947a_124 ;
		q6srhk3v0my9u2fvcc5t72vzug_735 <= kkdfi968g1ar8xvmb6s6ma6823o7zn_504 ;
		mz9seew5k3vlej3z54rz_662 <= wyndnjfxxs7y4ypul3co7yssqer_84 ;
		iao0germjnrzmq3weszu18axn4875w56_31 <= aumiqoo52iivgayj_605 ;
		mc4ly9fmgq5celz5pmok9_332 <= pzwwkgnci9jd4kbcwik3vlt_760 ;
		backpressure_out <= knala39vif8u7da1xs0gb8ng3_180 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	r4lzcfut9mn73rnl1x9_286 <= 1'b0 ;
	f9ydlgwbok5eft3vy4ftf_770 <= 1'b0 ;
   end
  else
  begin
		r4lzcfut9mn73rnl1x9_286 <= h6wd114qy7aontqv41gu73r_346 ;
		f9ydlgwbok5eft3vy4ftf_770 <= zc3xc5etdi806dg31357jg2o07g_334 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	fx8wg4ejpvjtwji5c2iz_788 <= 1'b0 ;
   end
  else
  begin
		fx8wg4ejpvjtwji5c2iz_788 <= fjq1ty6zasojkhnnkil9rslc8pi_721 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	p66oinufc53xuv8h3k626_480 <= 1'b0 ;
   end
  else
  begin
		p66oinufc53xuv8h3k626_480 <= r9q92gwlxil9lva4muw0lwxskcu_104 ;
  end
end

defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.WRITE_DATA_WIDTH = 266; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.FIFO_WRITE_DEPTH = 512; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.PROG_FULL_THRESH = 179; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.PROG_EMPTY_THRESH = 179; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.READ_MODE = "STD"; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.WR_DATA_COUNT_WIDTH = 9; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.RD_DATA_COUNT_WIDTH = 9; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.DOUT_RESET_VALUE = "0"; 
defparam vqat2j8x6i7vedtxcgg7azyxufgsz5t_921.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync vqat2j8x6i7vedtxcgg7azyxufgsz5t_921 (
	.wr_en(ot5mehjml3i1rbdj3kr57iu0_590),
	.din(tmr851nhxyd4duatin4emn_571),
	.rd_en(td4saq69odn841cg7xuwr5myhy9p83_453),
	.sleep(g3jbzbusho4uun61zvtyai_564),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(mwvxbt424jnik2s34pktv4_676), 
	.dout(wk9i1ap6k1dy67aal2iy0n_589), 
	.empty(d4v81zj6lvxayh4qfn_792), 
	.prog_full(pzwwkgnci9jd4kbcwik3vlt_760), 
	.full(rex2ljokjydi8h8b7luvbqwq_547), 
	.rd_data_count(rsyz906s5soqmnxr_748), 
	.wr_data_count(db2jijvvhee8t4z3ys4itu83lrufbyhx_102), 
	.wr_rst_busy(ok1lkyfni78bdr7cdterguwz1gsw_704), 
	.rd_rst_busy(r213noh7s3qfnavwp6aym_894), 
	.overflow(fz6vsslo6jk5jjpvl8_247), 
	.underflow(aq8efgcf2etg1pkddlv8u3jxke_75), 
	.sbiterr(iviszcoairz9mbeau257zy5su5ecyha_0), 
	.dbiterr(pdod612utazp4mjkx_810), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam tbz62aqzp5ua4a33saynb_2132.WRITE_DATA_WIDTH = 1; 
defparam tbz62aqzp5ua4a33saynb_2132.FIFO_WRITE_DEPTH = 512; 
defparam tbz62aqzp5ua4a33saynb_2132.PROG_FULL_THRESH = 179; 
defparam tbz62aqzp5ua4a33saynb_2132.PROG_EMPTY_THRESH = 179; 
defparam tbz62aqzp5ua4a33saynb_2132.READ_MODE = "FWFT"; 
defparam tbz62aqzp5ua4a33saynb_2132.WR_DATA_COUNT_WIDTH = 9; 
defparam tbz62aqzp5ua4a33saynb_2132.RD_DATA_COUNT_WIDTH = 9; 
defparam tbz62aqzp5ua4a33saynb_2132.DOUT_RESET_VALUE = "0"; 
defparam tbz62aqzp5ua4a33saynb_2132.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync tbz62aqzp5ua4a33saynb_2132 (
	.wr_en(voiftdv0xfbbjfry_641),
	.din(ahwy0wrws8v82hnp62b4ab_705),
	.rd_en(z1rhe39sjpodxnpo5o9exfbfnad_781),
	.sleep(ocn7d7l8svkuukj4oc20khmmwc_221),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(trc4bqqkp238p2o1okp6e7h8vciivx_749), 
	.dout(vbq81p8ph3f69jck56ep9_102), 
	.empty(p66aed7ohz3apb14ytkeq5jc8y_544), 
	.prog_full(e7qggn14plw25h69dfs9azsf2y8_365), 
	.full(n8puv0w63r6ergifh_308), 
	.rd_data_count(it6yjkbk2s2gjlcu5b_822), 
	.wr_data_count(itepum93sflmzkqhi_111), 
	.wr_rst_busy(jwgf0f69mno209i02qdae53xgc_228), 
	.rd_rst_busy(olnhfa75li2qgcyevcdje7zygfbs1l_153), 
	.overflow(lyb252a5ywmjjtik_361), 
	.underflow(twmw67l1gnyk1k6a167a7zzvoxf_191), 
	.sbiterr(i4wh8jtbd1p3wmlqiw6jexxifedzoy9f_290), 
	.dbiterr(dlg7xtuwmtqid8lqn5w1v60u8ty11y_870), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam clfyrc6uprv7dwtmx06_2461.WRITE_DATA_WIDTH = 128; 
defparam clfyrc6uprv7dwtmx06_2461.FIFO_WRITE_DEPTH = 256; 
defparam clfyrc6uprv7dwtmx06_2461.PROG_FULL_THRESH = 129; 
defparam clfyrc6uprv7dwtmx06_2461.PROG_EMPTY_THRESH = 129; 
defparam clfyrc6uprv7dwtmx06_2461.READ_MODE = "STD"; 
defparam clfyrc6uprv7dwtmx06_2461.WR_DATA_COUNT_WIDTH = 8; 
defparam clfyrc6uprv7dwtmx06_2461.RD_DATA_COUNT_WIDTH = 8; 
defparam clfyrc6uprv7dwtmx06_2461.DOUT_RESET_VALUE = "0"; 
defparam clfyrc6uprv7dwtmx06_2461.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async clfyrc6uprv7dwtmx06_2461 (
	.wr_en(qrwk039i9et2op6df26ve900ypy4u_899),
	.din(l1o20idmwq6qdabkhrc_198),
	.rd_en(xhanpkxy7636w730ze2no_21),
	.sleep(wkje9l80fncxsnsb179tq8lkyxjc_715),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(lz7scz0ujz7zknfhmeu2_855), 
	.dout(a3kngqecv3dr1u1z1ufhk_8), 
	.empty(a55ipcc95x7iyjr0la_390), 
	.prog_full(zc3xc5etdi806dg31357jg2o07g_334), 
	.full(c1ujf6ecbj4dktfju_372), 
	.rd_data_count(ee5n0en7qjz5adizuefrdu_637), 
	.wr_data_count(rhtbnoc7lp28f8xr_568), 
	.wr_rst_busy(p3lq187bxowifxobdsh0qxjfi1k1f_87), 
	.rd_rst_busy(fxk6aluoxn5u3qv28la52h3xz4_737), 
	.overflow(dqr9g5bh2w9lgsxdczw8nvp7mqq_744), 
	.underflow(wiafj8d06g4qa9iufku4qjruffttxo_727), 
	.sbiterr(ranrpae6gw3zkufxa06mn4o_588), 
	.dbiterr(kaekp45hjsr56jmyeti7h0_700), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam ixqf5xti5vguk3al5eworc_2654.WRITE_DATA_WIDTH = 112; 
defparam ixqf5xti5vguk3al5eworc_2654.FIFO_WRITE_DEPTH = 256; 
defparam ixqf5xti5vguk3al5eworc_2654.PROG_FULL_THRESH = 79; 
defparam ixqf5xti5vguk3al5eworc_2654.PROG_EMPTY_THRESH = 79; 
defparam ixqf5xti5vguk3al5eworc_2654.READ_MODE = "STD"; 
defparam ixqf5xti5vguk3al5eworc_2654.WR_DATA_COUNT_WIDTH = 8; 
defparam ixqf5xti5vguk3al5eworc_2654.RD_DATA_COUNT_WIDTH = 8; 
defparam ixqf5xti5vguk3al5eworc_2654.DOUT_RESET_VALUE = "0"; 
defparam ixqf5xti5vguk3al5eworc_2654.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async ixqf5xti5vguk3al5eworc_2654 (
	.wr_en(k12rvv0smcfxon2eqnol3j8q5si9_818),
	.din(hsvc1njfybhtv5v5olqxbeuf053f22y4_766),
	.rd_en(f5in3kab4psiqkww5wbwkbfydm_814),
	.sleep(s9psr52txicrtdeqdwpmwfv4_717),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(opova9uowr7lxejk69jmr_762), 
	.dout(mwnnmd2up6x4sz7q3d3diqhzcjb1_60), 
	.empty(uxs3tvpdyw2fka0g3zwy_624), 
	.prog_full(fjq1ty6zasojkhnnkil9rslc8pi_721), 
	.full(zzafg0rwj8xwa92d_464), 
	.rd_data_count(z4oudstz5bnveai00ax5qqre8_905), 
	.wr_data_count(fxungaiarfhi9fam7_853), 
	.wr_rst_busy(okvyek3ayx6q931tw2zwmndq2os_277), 
	.rd_rst_busy(b51pkbab7f08j3lmaah6rb4889oh_506), 
	.overflow(kh293uvsakt6a86bf3d3bbbf1l7wtz3i_5), 
	.underflow(yovus87ocrjizyxllt1k6u01pxp1u5o0_764), 
	.sbiterr(zp6ies7yyr9vlej7g3ndex_21), 
	.dbiterr(x1x4gnsh7bgbt9op2c_465), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

defparam d5lmuuayqg0n5vlnxvgotc1dd_236.WRITE_DATA_WIDTH = 22; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.FIFO_WRITE_DEPTH = 256; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.PROG_FULL_THRESH = 79; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.PROG_EMPTY_THRESH = 79; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.READ_MODE = "STD"; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.WR_DATA_COUNT_WIDTH = 8; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.RD_DATA_COUNT_WIDTH = 8; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.DOUT_RESET_VALUE = "0"; 
defparam d5lmuuayqg0n5vlnxvgotc1dd_236.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async d5lmuuayqg0n5vlnxvgotc1dd_236 (
	.wr_en(rlqeqgpr1mtlc0sizszisbksrlua6hn_286),
	.din(p6f5vw1fa2y8w388ev_431),
	.rd_en(bcvaieg0y4bfaa1e2e2ta2hdofud_673),
	.sleep(vnopu3iut3qfeurd_318),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(erg3lhr6v87mnnu8y9n1nwsl2tr2o188_467), 
	.dout(bompl1hxrinydg47ruxwqobz3gkvcxa_529), 
	.empty(t1er5emgq9m8aqdzl98g_577), 
	.prog_full(r9q92gwlxil9lva4muw0lwxskcu_104), 
	.full(xvb8bbi73m5m5fbt1nset9xq_225), 
	.rd_data_count(pvvjf4zkosfcuz7wb4jo4zr4mwxl_351), 
	.wr_data_count(g8klb1mjye4aevf6y8mriwwe_128), 
	.wr_rst_busy(nf31eygbj7zd1b8x9ksl0dsh9ifuo_57), 
	.rd_rst_busy(rgotn53u4rgor2cvn5_449), 
	.overflow(jcs0g30qy1p7mj4c9c_223), 
	.underflow(bwjhxb16fch66dwph7ljljbo_5), 
	.sbiterr(dp7hajr8c3keojrz1o3o8_121), 
	.dbiterr(pwg5auzff86q3jjnd_256), 

	.wr_clk(clk_in_3), 

	.rd_clk(clk_out_3), 
	.rst(rst_in_3) 
); 

endmodule 

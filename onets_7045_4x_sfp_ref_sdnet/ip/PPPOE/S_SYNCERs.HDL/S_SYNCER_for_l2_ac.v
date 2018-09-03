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
// File name: S_SYNCER_for_l2_ac.v
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_l2_ac (
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
     tuple_in_TUPLE2_VALID, 
     tuple_in_TUPLE2_DATA, 
     tuple_in_TUPLE3_VALID, 
     tuple_in_TUPLE3_DATA, 
     tuple_in_TUPLE5_VALID, 
     tuple_in_TUPLE5_DATA, 
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
     tuple_out_TUPLE2_VALID, 
     tuple_out_TUPLE2_DATA, 
     tuple_out_TUPLE3_VALID, 
     tuple_out_TUPLE3_DATA, 
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
 input		packet_in_PACKET4_SOF ;
 input		packet_in_PACKET4_EOF ;
 input		packet_in_PACKET4_VAL ;
 input	 [255:0] packet_in_PACKET4_DAT ;
 input	 [5:0] packet_in_PACKET4_CNT ;
 input		packet_in_PACKET4_ERR ;
 input		packet_out_PACKET4_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [28:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [28:0] tuple_in_TUPLE1_DATA ;
 input		tuple_in_TUPLE2_VALID ;
 input	 [3:0] tuple_in_TUPLE2_DATA ;
 input		tuple_in_TUPLE3_VALID ;
 input	 [25:0] tuple_in_TUPLE3_DATA ;
 input		tuple_in_TUPLE5_VALID ;
 input	 [63:0] tuple_in_TUPLE5_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET4_SOF ;
 output		packet_out_PACKET4_EOF ;
 output		packet_out_PACKET4_VAL ;
 output	 [255:0] packet_out_PACKET4_DAT ;
 output	 [5:0] packet_out_PACKET4_CNT ;
 output		packet_out_PACKET4_ERR ;
 output		packet_in_PACKET4_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [28:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [28:0] tuple_out_TUPLE1_DATA ;
 output		tuple_out_TUPLE2_VALID ;
 output	 [3:0] tuple_out_TUPLE2_DATA ;
 output		tuple_out_TUPLE3_VALID ;
 output	 [25:0] tuple_out_TUPLE3_DATA ;
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






 wire	lik5ayrw5jx860kqf7r0sj627i1gw1j_394 ;
 wire [265:0] ontk9jud32edi9axm6_492 ;
 wire	or88sfhigwjisqtyjm8ymms_657 ;
 wire	go1yao20rkzambrx9zcw5g8vta48y3_45 ;
 wire	zdqvodydvqp2k9ahjpep8n0dliu2fu_836 ;
 reg	gm51zlvhkegueawvsdeheswdtuomz7w_211 ;
 wire	r9r18szaipg5ycq9ar4sfld_134 ;
 wire [0:0] dydutwagug9y2833_336 ;
 wire	hplp3j7lab29eyoxvwxgqr91ztiwf9_353 ;
 wire	co8bzxyfyhv3mrfk65ncbykft44m_16 ;
 wire [0:0] kuoao2azs17w57jyxj6fg4zd9ofar_553 ;
 wire	xvmnu3gav1x7hmb72qi1ll3bgma_674 ;
 wire	z34vqh74qswz62s80oc9ruot69g_369 ;
 wire	zpb0952unmoqx25brxg44t7clfzgosef_173 ;
 wire	r3ktns3843927al4x_50 ;
 wire [28:0] t8r480mdleov94dkccu2cnetmwuwff_372 ;
 wire	bk6oeuvxsztefjff8ro_224 ;
 wire	tytk5eiou267xao5bawz9_386 ;
 wire	cxhr53hv34s6z2mk1y5tyutk6dq876_502 ;
 wire	ry2803ehj3h7wbulkap4r_733 ;
 wire [28:0] nidjjez6l174kn9jwx8sbb87le3_836 ;
 wire	ce564y7jij27kuvixec_832 ;
 wire	e2vnpww3so8xt1pd90wysdc90xxlx6n_101 ;
 wire	d2vl89ipjo68snmaf6co_722 ;
 wire	krgpy9bibvy4o4qzo3_273 ;
 wire [3:0] ggulubej444yu783mzcxexfrffurh61j_663 ;
 wire	rycm1lscsbs1velqnkhg1x5yhg_747 ;
 wire	iw3olvs5m0f32y21kef_588 ;
 wire	npqm6a9hovwu9xql708rpmgga7_687 ;
 wire	iq4u9buiuhelt53u92axco2j_779 ;
 wire [25:0] plc4mciimlmuqoa14f7xv2j_455 ;
 wire	oi9hw29ilu8761082h4hzw_253 ;
 wire	w90ybv09w8aq8y3huk1dyrm_498 ;
 wire	ou9zgykq17520rfodk5wrd7qvv3vss8_702 ;
 wire	dvg8wfd5lzys2p947mrr4_185 ;
 wire [63:0] bi2mqeforcqs93qm54dt87_267 ;
 wire	bh9syi7or4wtrxran6t6m_643 ;
 wire	tmoamvafucdxvk3ekorz0ty1_302 ;
 wire	ise1wfu6fdvmv4tzdju4y_30 ;
 reg	bgx5osajujl5ojhz302psp00fl13br_602 ;
 reg	kqqxg3t122fjwfhbnlqb9o0_307 ;
 reg	qcc6yxj6hlxmwsidqak975_252 ;
 reg	n7vq7jw3qj42g1a89rswrhc00_738 ;
 reg	y4ynnflymx2zdvwqie89ou_473 ;
 reg	guduv9xv6q2rhnlx0n_325 ;
 wire	vrkhgtye4lmm0evolvm8skhawih_483 ;
 wire [265:0] rmjuqaol75406erqa0kyl3rn10_216 ;
 wire	xuqqd4pvqwhvhwps56e1k8pij_879 ;
 wire [265:0] dqnbyry7g541t2q3puem03tzvqd_785 ;
 wire	ynh0tk1y29f2wodids2ie295gdud8gz_777 ;
 wire	ztew5x1d7qwbesz7_145 ;
 wire	c8684noh41dfoezzm6o3hli2_369 ;
 wire	zqh7k0oi204zrw9ku_771 ;
 wire	ur7fdnitx0skvmhlmbyiza1irnafue6_876 ;
 wire [5:0] mfeztn2ncwj2avth_214 ;
 wire [255:0] ejbcw7gwurfy5z2r3wye7pu25v_159 ;
 wire	i0qhgkt8paeqdouhcuhptd2vywntm8c_316 ;
 wire	vy72msgwepgldwah3w7zh_585 ;
 wire	fscpz42jnruov1avt1q_358 ;
 wire	b6dbexcawzxwpuw5ph4hno4zqxlcwpw_185 ;
 wire	xtrq461nkw5xwgvh4we1top0falpvqe_897 ;
 wire	ki5y3dk5xlxw29ehqaloa90qg_485 ;
 wire	xo1phvdo42nebhu1a_432 ;
 wire [0:0] nf13xi37ot0njiarjsfjhmg_510 ;
 wire	ctj21ksr72qmpogzvkolid_752 ;
 wire	ksaq0k5rhh2nfixu8z2so5wa4gmyjfq_224 ;
 wire	jjb56tr4c7g9ku2cb2yw09bftko7ulri_417 ;
 wire	vd3m2f3og6h5jekgmp3xa8gskq6iq_448 ;
 wire	nkjy15us1trh8urcbu96fxhnwi5sc9_419 ;
 wire	bh6chwy1flproudyfpbnh_541 ;
 wire [0:0] c1473ajlfjmaor1vy0sd6q_244 ;
 wire	nt1zmwwlgf7cy31ao4bvraz5ebtqiw_77 ;
 wire	dp99yc159sqo2d63b339xsfqdf_93 ;
 wire	m3jujf1v98t8wryrepfmeiwqspcvua_530 ;
 wire	peayer55yq3x20dxu2boevi_884 ;
 wire	t0p072adwmylgrhcvinpj4h599z3cr_287 ;
 wire	xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 wire [28:0] ewrg4ir9aio4kxakfmsuu_839 ;
 wire	qkfbyrs5foajpr6cpflozetbrzmufjb_623 ;
 wire [28:0] tcckm2ylj2m3iwy3_644 ;
 wire	l384ozca7r8krt9uqauv670zxojra2_429 ;
 wire	cobh1dfzpjofhisrqygnygq_196 ;
 wire [28:0] gbjl5211e6lyxk9iwlcz7ifno_603 ;
 wire	wkd1yuknu2azp5tioe_482 ;
 wire [28:0] ezprx5qqi4nty0rbr1xsfm6o5_244 ;
 wire	u7dlyh17m5em22et5nyhipmo_13 ;
 wire	ffa5vsyvttuy2ne6mhms_648 ;
 wire [3:0] j3ny5acox5kdc8t0dv9qiien_781 ;
 wire	rqwxxv5lsp9ms2wgtju_612 ;
 wire [3:0] kxmvhn7h6alhbbvbr537l_748 ;
 wire	boa58hq8pxkw7zy4v8_175 ;
 wire	zyfgzf28cw9vt3ng6p8o45yvtti78g_693 ;
 wire [25:0] d3uqej1kwndtectj3vt0eje60ijy30_352 ;
 wire	yw74no8kzmn7cuwer1i7vv1ispbzlsg_758 ;
 wire [25:0] fz6xajpymjxthjke6gzlf1ir3wkvr3_821 ;
 wire	k3eklvihmqz2y61qlbks1wnd7_344 ;
 wire	o58dnx5f9ngi7yto_143 ;
 wire [63:0] yepqkseba6s0vzxy6eczsuw_71 ;
 wire	tvcdxk8kpuqau3zs6lh_13 ;
 wire [63:0] efr39d9pl7i2cjahp9x_570 ;
 wire	xgbuju7h1utj01e4otp7xhh8g_687 ;
 wire	lj29otv6azdo1bmc3l_92 ;
 wire	rd9oeaot5uf7ovockhqu9ac6aa_265 ;
 wire	ycz8dmq57qqolfoo1irns1fzkrh69dn_112 ;


 assign vrkhgtye4lmm0evolvm8skhawih_483 = 
	 ~(backpressure_in) ;
 assign rmjuqaol75406erqa0kyl3rn10_216 = 
	{packet_in_PACKET4_SOF, packet_in_PACKET4_EOF, packet_in_PACKET4_VAL, packet_in_PACKET4_DAT, packet_in_PACKET4_CNT, packet_in_PACKET4_ERR} ;
 assign xuqqd4pvqwhvhwps56e1k8pij_879 	= packet_in_PACKET4_VAL ;
 assign dqnbyry7g541t2q3puem03tzvqd_785 	= rmjuqaol75406erqa0kyl3rn10_216[265:0] ;
 assign ynh0tk1y29f2wodids2ie295gdud8gz_777 = 
	vd3m2f3og6h5jekgmp3xa8gskq6iq_448 | rd9oeaot5uf7ovockhqu9ac6aa_265 ;
 assign ztew5x1d7qwbesz7_145 = 
	vrkhgtye4lmm0evolvm8skhawih_483 & ksaq0k5rhh2nfixu8z2so5wa4gmyjfq_224 & ynh0tk1y29f2wodids2ie295gdud8gz_777 ;
 assign c8684noh41dfoezzm6o3hli2_369 	= ztew5x1d7qwbesz7_145 ;
 assign zqh7k0oi204zrw9ku_771 = 
	 ~(or88sfhigwjisqtyjm8ymms_657) ;
 assign ur7fdnitx0skvmhlmbyiza1irnafue6_876 	= ontk9jud32edi9axm6_492[0] ;
 assign mfeztn2ncwj2avth_214 	= ontk9jud32edi9axm6_492[6:1] ;
 assign ejbcw7gwurfy5z2r3wye7pu25v_159 	= ontk9jud32edi9axm6_492[262:7] ;
 assign i0qhgkt8paeqdouhcuhptd2vywntm8c_316 	= ontk9jud32edi9axm6_492[263] ;
 assign vy72msgwepgldwah3w7zh_585 	= ontk9jud32edi9axm6_492[264] ;
 assign fscpz42jnruov1avt1q_358 	= ontk9jud32edi9axm6_492[265] ;
 assign b6dbexcawzxwpuw5ph4hno4zqxlcwpw_185 = 
	gm51zlvhkegueawvsdeheswdtuomz7w_211 & i0qhgkt8paeqdouhcuhptd2vywntm8c_316 ;
 assign xtrq461nkw5xwgvh4we1top0falpvqe_897 	= ztew5x1d7qwbesz7_145 ;
 assign ki5y3dk5xlxw29ehqaloa90qg_485 	= xtrq461nkw5xwgvh4we1top0falpvqe_897 ;
 assign xo1phvdo42nebhu1a_432 	= dp99yc159sqo2d63b339xsfqdf_93 ;
 assign nf13xi37ot0njiarjsfjhmg_510 = m3jujf1v98t8wryrepfmeiwqspcvua_530 ;
 assign ctj21ksr72qmpogzvkolid_752 	= peayer55yq3x20dxu2boevi_884 ;
 assign ksaq0k5rhh2nfixu8z2so5wa4gmyjfq_224 	= r9r18szaipg5ycq9ar4sfld_134 ;
 assign jjb56tr4c7g9ku2cb2yw09bftko7ulri_417 = dydutwagug9y2833_336 ;
 assign vd3m2f3og6h5jekgmp3xa8gskq6iq_448 = 
	 ~(jjb56tr4c7g9ku2cb2yw09bftko7ulri_417) ;
 assign nkjy15us1trh8urcbu96fxhnwi5sc9_419 	= hplp3j7lab29eyoxvwxgqr91ztiwf9_353 ;
 assign bh6chwy1flproudyfpbnh_541 	= packet_in_PACKET4_VAL ;
 assign c1473ajlfjmaor1vy0sd6q_244 = packet_in_PACKET4_SOF ;
 assign nt1zmwwlgf7cy31ao4bvraz5ebtqiw_77 	= nkjy15us1trh8urcbu96fxhnwi5sc9_419 ;
 assign dp99yc159sqo2d63b339xsfqdf_93 	= co8bzxyfyhv3mrfk65ncbykft44m_16 ;
 assign m3jujf1v98t8wryrepfmeiwqspcvua_530 = kuoao2azs17w57jyxj6fg4zd9ofar_553 ;
 assign peayer55yq3x20dxu2boevi_884 	= xvmnu3gav1x7hmb72qi1ll3bgma_674 ;
 assign t0p072adwmylgrhcvinpj4h599z3cr_287 = 
	 ~(xvmnu3gav1x7hmb72qi1ll3bgma_674) ;
 assign xosolabnhiv1iilj3v25geey18l4b3k_262 = 
	vrkhgtye4lmm0evolvm8skhawih_483 & rd9oeaot5uf7ovockhqu9ac6aa_265 & ksaq0k5rhh2nfixu8z2so5wa4gmyjfq_224 & jjb56tr4c7g9ku2cb2yw09bftko7ulri_417 ;
 assign ewrg4ir9aio4kxakfmsuu_839 = 
	tuple_in_TUPLE0_DATA ;
 assign qkfbyrs5foajpr6cpflozetbrzmufjb_623 	= tuple_in_TUPLE0_VALID ;
 assign tcckm2ylj2m3iwy3_644 	= ewrg4ir9aio4kxakfmsuu_839[28:0] ;
 assign l384ozca7r8krt9uqauv670zxojra2_429 = 
	 ~(bk6oeuvxsztefjff8ro_224) ;
 assign cobh1dfzpjofhisrqygnygq_196 	= xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 assign gbjl5211e6lyxk9iwlcz7ifno_603 = 
	tuple_in_TUPLE1_DATA ;
 assign wkd1yuknu2azp5tioe_482 	= tuple_in_TUPLE1_VALID ;
 assign ezprx5qqi4nty0rbr1xsfm6o5_244 	= gbjl5211e6lyxk9iwlcz7ifno_603[28:0] ;
 assign u7dlyh17m5em22et5nyhipmo_13 = 
	 ~(ce564y7jij27kuvixec_832) ;
 assign ffa5vsyvttuy2ne6mhms_648 	= xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 assign j3ny5acox5kdc8t0dv9qiien_781 = 
	tuple_in_TUPLE2_DATA ;
 assign rqwxxv5lsp9ms2wgtju_612 	= tuple_in_TUPLE2_VALID ;
 assign kxmvhn7h6alhbbvbr537l_748 	= j3ny5acox5kdc8t0dv9qiien_781[3:0] ;
 assign boa58hq8pxkw7zy4v8_175 = 
	 ~(rycm1lscsbs1velqnkhg1x5yhg_747) ;
 assign zyfgzf28cw9vt3ng6p8o45yvtti78g_693 	= xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 assign d3uqej1kwndtectj3vt0eje60ijy30_352 = 
	tuple_in_TUPLE3_DATA ;
 assign yw74no8kzmn7cuwer1i7vv1ispbzlsg_758 	= tuple_in_TUPLE3_VALID ;
 assign fz6xajpymjxthjke6gzlf1ir3wkvr3_821 	= d3uqej1kwndtectj3vt0eje60ijy30_352[25:0] ;
 assign k3eklvihmqz2y61qlbks1wnd7_344 = 
	 ~(oi9hw29ilu8761082h4hzw_253) ;
 assign o58dnx5f9ngi7yto_143 	= xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 assign yepqkseba6s0vzxy6eczsuw_71 = 
	tuple_in_TUPLE5_DATA ;
 assign tvcdxk8kpuqau3zs6lh_13 	= tuple_in_TUPLE5_VALID ;
 assign efr39d9pl7i2cjahp9x_570 	= yepqkseba6s0vzxy6eczsuw_71[63:0] ;
 assign xgbuju7h1utj01e4otp7xhh8g_687 = 
	 ~(bh9syi7or4wtrxran6t6m_643) ;
 assign lj29otv6azdo1bmc3l_92 	= xosolabnhiv1iilj3v25geey18l4b3k_262 ;
 assign rd9oeaot5uf7ovockhqu9ac6aa_265 = 
	zqh7k0oi204zrw9ku_771 & l384ozca7r8krt9uqauv670zxojra2_429 & u7dlyh17m5em22et5nyhipmo_13 & boa58hq8pxkw7zy4v8_175 & k3eklvihmqz2y61qlbks1wnd7_344 & xgbuju7h1utj01e4otp7xhh8g_687 ;
 assign ycz8dmq57qqolfoo1irns1fzkrh69dn_112 = 
	bgx5osajujl5ojhz302psp00fl13br_602 | kqqxg3t122fjwfhbnlqb9o0_307 | qcc6yxj6hlxmwsidqak975_252 | n7vq7jw3qj42g1a89rswrhc00_738 | y4ynnflymx2zdvwqie89ou_473 | guduv9xv6q2rhnlx0n_325 ;
 assign packet_out_PACKET4_SOF 	= fscpz42jnruov1avt1q_358 ;
 assign packet_out_PACKET4_EOF 	= vy72msgwepgldwah3w7zh_585 ;
 assign packet_out_PACKET4_VAL 	= b6dbexcawzxwpuw5ph4hno4zqxlcwpw_185 ;
 assign packet_out_PACKET4_DAT 	= ejbcw7gwurfy5z2r3wye7pu25v_159[255:0] ;
 assign packet_out_PACKET4_CNT 	= mfeztn2ncwj2avth_214[5:0] ;
 assign packet_out_PACKET4_ERR 	= ur7fdnitx0skvmhlmbyiza1irnafue6_876 ;
 assign packet_in_PACKET4_RDY 	= packet_out_PACKET4_RDY ;
 assign tuple_out_TUPLE0_VALID 	= r3ktns3843927al4x_50 ;
 assign tuple_out_TUPLE0_DATA 	= t8r480mdleov94dkccu2cnetmwuwff_372[28:0] ;
 assign tuple_out_TUPLE1_VALID 	= ry2803ehj3h7wbulkap4r_733 ;
 assign tuple_out_TUPLE1_DATA 	= nidjjez6l174kn9jwx8sbb87le3_836[28:0] ;
 assign tuple_out_TUPLE2_VALID 	= krgpy9bibvy4o4qzo3_273 ;
 assign tuple_out_TUPLE2_DATA 	= ggulubej444yu783mzcxexfrffurh61j_663[3:0] ;
 assign tuple_out_TUPLE3_VALID 	= iq4u9buiuhelt53u92axco2j_779 ;
 assign tuple_out_TUPLE3_DATA 	= plc4mciimlmuqoa14f7xv2j_455[25:0] ;
 assign tuple_out_TUPLE5_VALID 	= dvg8wfd5lzys2p947mrr4_185 ;
 assign tuple_out_TUPLE5_DATA 	= bi2mqeforcqs93qm54dt87_267[63:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	gm51zlvhkegueawvsdeheswdtuomz7w_211 <= 1'b0 ;
	bgx5osajujl5ojhz302psp00fl13br_602 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		gm51zlvhkegueawvsdeheswdtuomz7w_211 <= ztew5x1d7qwbesz7_145 ;
		bgx5osajujl5ojhz302psp00fl13br_602 <= go1yao20rkzambrx9zcw5g8vta48y3_45 ;
		backpressure_out <= ycz8dmq57qqolfoo1irns1fzkrh69dn_112 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	kqqxg3t122fjwfhbnlqb9o0_307 <= 1'b0 ;
   end
  else
  begin
		kqqxg3t122fjwfhbnlqb9o0_307 <= tytk5eiou267xao5bawz9_386 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	qcc6yxj6hlxmwsidqak975_252 <= 1'b0 ;
   end
  else
  begin
		qcc6yxj6hlxmwsidqak975_252 <= e2vnpww3so8xt1pd90wysdc90xxlx6n_101 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	n7vq7jw3qj42g1a89rswrhc00_738 <= 1'b0 ;
   end
  else
  begin
		n7vq7jw3qj42g1a89rswrhc00_738 <= iw3olvs5m0f32y21kef_588 ;
  end
end

always @(posedge clk_out_4)
begin
  if (rst_in_0) 
  begin
	y4ynnflymx2zdvwqie89ou_473 <= 1'b0 ;
   end
  else
  begin
		y4ynnflymx2zdvwqie89ou_473 <= w90ybv09w8aq8y3huk1dyrm_498 ;
  end
end

always @(posedge clk_out_5)
begin
  if (rst_in_0) 
  begin
	guduv9xv6q2rhnlx0n_325 <= 1'b0 ;
   end
  else
  begin
		guduv9xv6q2rhnlx0n_325 <= tmoamvafucdxvk3ekorz0ty1_302 ;
  end
end

defparam ifior4abh4qpud9e69i_1919.DataBits = 266; 
defparam ifior4abh4qpud9e69i_1919.AddrBits = 9; 
defparam ifior4abh4qpud9e69i_1919.AFullAssert_0 = 63; 
defparam ifior4abh4qpud9e69i_1919.AFullNegate_0 = 63; 

PPP_SCFifo ifior4abh4qpud9e69i_1919 (
	.WrEnb(xuqqd4pvqwhvhwps56e1k8pij_879),
	.WrData(dqnbyry7g541t2q3puem03tzvqd_785),
	.RdEnb(c8684noh41dfoezzm6o3hli2_369),


	.RdVal(lik5ayrw5jx860kqf7r0sj627i1gw1j_394), 
	.RdData(ontk9jud32edi9axm6_492), 
	.Empty(or88sfhigwjisqtyjm8ymms_657), 
	.AFull_0(go1yao20rkzambrx9zcw5g8vta48y3_45), 
	.Full(zdqvodydvqp2k9ahjpep8n0dliu2fu_836), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam g7f7bs9aoycewdgbj03szc_2419.DscBits = 1; 
defparam g7f7bs9aoycewdgbj03szc_2419.BufSize = 512; 
defparam g7f7bs9aoycewdgbj03szc_2419.CntBits = 9; 

PPP_DscSCBuf g7f7bs9aoycewdgbj03szc_2419 (
	.DscSkip(ki5y3dk5xlxw29ehqaloa90qg_485),
	.RdVal(xo1phvdo42nebhu1a_432),
	.RdData(nf13xi37ot0njiarjsfjhmg_510),
	.Empty(ctj21ksr72qmpogzvkolid_752),


	.DscVal(r9r18szaipg5ycq9ar4sfld_134), 
	.DscData(dydutwagug9y2833_336), 
	.RdEnb(hplp3j7lab29eyoxvwxgqr91ztiwf9_353), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam t92r3xxd1agnxcef3xj4hqf7f2xh0gqf_1637.DataBits = 1; 
defparam t92r3xxd1agnxcef3xj4hqf7f2xh0gqf_1637.AddrBits = 9; 
defparam t92r3xxd1agnxcef3xj4hqf7f2xh0gqf_1637.AFullAssert_0 = 256; 
defparam t92r3xxd1agnxcef3xj4hqf7f2xh0gqf_1637.AFullNegate_0 = 256; 

PPP_SCFifo t92r3xxd1agnxcef3xj4hqf7f2xh0gqf_1637 (
	.WrEnb(bh6chwy1flproudyfpbnh_541),
	.WrData(c1473ajlfjmaor1vy0sd6q_244),
	.RdEnb(nt1zmwwlgf7cy31ao4bvraz5ebtqiw_77),


	.RdVal(co8bzxyfyhv3mrfk65ncbykft44m_16), 
	.RdData(kuoao2azs17w57jyxj6fg4zd9ofar_553), 
	.Empty(xvmnu3gav1x7hmb72qi1ll3bgma_674), 
	.AFull_0(z34vqh74qswz62s80oc9ruot69g_369), 
	.Full(zpb0952unmoqx25brxg44t7clfzgosef_173), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam vyfc7hgeodmabzbx3c30eeaqfw42w_2336.DataBits = 29; 
defparam vyfc7hgeodmabzbx3c30eeaqfw42w_2336.AddrBits = 9; 
defparam vyfc7hgeodmabzbx3c30eeaqfw42w_2336.AFullAssert_0 = 15; 
defparam vyfc7hgeodmabzbx3c30eeaqfw42w_2336.AFullNegate_0 = 15; 

PPP_SCFifo vyfc7hgeodmabzbx3c30eeaqfw42w_2336 (
	.WrEnb(qkfbyrs5foajpr6cpflozetbrzmufjb_623),
	.WrData(tcckm2ylj2m3iwy3_644),
	.RdEnb(cobh1dfzpjofhisrqygnygq_196),


	.RdVal(r3ktns3843927al4x_50), 
	.RdData(t8r480mdleov94dkccu2cnetmwuwff_372), 
	.Empty(bk6oeuvxsztefjff8ro_224), 
	.AFull_0(tytk5eiou267xao5bawz9_386), 
	.Full(cxhr53hv34s6z2mk1y5tyutk6dq876_502), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

defparam mijzwbpblf8mykyv08bye1ptmmmnrb_1691.DataBits = 29; 
defparam mijzwbpblf8mykyv08bye1ptmmmnrb_1691.AddrBits = 9; 
defparam mijzwbpblf8mykyv08bye1ptmmmnrb_1691.AFullAssert_0 = 15; 
defparam mijzwbpblf8mykyv08bye1ptmmmnrb_1691.AFullNegate_0 = 15; 

PPP_SCFifo mijzwbpblf8mykyv08bye1ptmmmnrb_1691 (
	.WrEnb(wkd1yuknu2azp5tioe_482),
	.WrData(ezprx5qqi4nty0rbr1xsfm6o5_244),
	.RdEnb(ffa5vsyvttuy2ne6mhms_648),


	.RdVal(ry2803ehj3h7wbulkap4r_733), 
	.RdData(nidjjez6l174kn9jwx8sbb87le3_836), 
	.Empty(ce564y7jij27kuvixec_832), 
	.AFull_0(e2vnpww3so8xt1pd90wysdc90xxlx6n_101), 
	.Full(d2vl89ipjo68snmaf6co_722), 

	.WrClk(clk_in_2), 

	.RdClk(clk_out_2), 

	.WrRst(rst_in_2), 
	.RdRst(rst_out_2) 
); 

defparam cl1zx5ffxtwg37rnuvrz9ok_1041.DataBits = 4; 
defparam cl1zx5ffxtwg37rnuvrz9ok_1041.AddrBits = 9; 
defparam cl1zx5ffxtwg37rnuvrz9ok_1041.AFullAssert_0 = 32; 
defparam cl1zx5ffxtwg37rnuvrz9ok_1041.AFullNegate_0 = 32; 

PPP_SCFifo cl1zx5ffxtwg37rnuvrz9ok_1041 (
	.WrEnb(rqwxxv5lsp9ms2wgtju_612),
	.WrData(kxmvhn7h6alhbbvbr537l_748),
	.RdEnb(zyfgzf28cw9vt3ng6p8o45yvtti78g_693),


	.RdVal(krgpy9bibvy4o4qzo3_273), 
	.RdData(ggulubej444yu783mzcxexfrffurh61j_663), 
	.Empty(rycm1lscsbs1velqnkhg1x5yhg_747), 
	.AFull_0(iw3olvs5m0f32y21kef_588), 
	.Full(npqm6a9hovwu9xql708rpmgga7_687), 

	.WrClk(clk_in_3), 

	.RdClk(clk_out_3), 

	.WrRst(rst_in_3), 
	.RdRst(rst_out_3) 
); 

defparam u3mls57c3ogxtzirh3v4n0f119a_360.DataBits = 26; 
defparam u3mls57c3ogxtzirh3v4n0f119a_360.AddrBits = 9; 
defparam u3mls57c3ogxtzirh3v4n0f119a_360.AFullAssert_0 = 32; 
defparam u3mls57c3ogxtzirh3v4n0f119a_360.AFullNegate_0 = 32; 

PPP_SCFifo u3mls57c3ogxtzirh3v4n0f119a_360 (
	.WrEnb(yw74no8kzmn7cuwer1i7vv1ispbzlsg_758),
	.WrData(fz6xajpymjxthjke6gzlf1ir3wkvr3_821),
	.RdEnb(o58dnx5f9ngi7yto_143),


	.RdVal(iq4u9buiuhelt53u92axco2j_779), 
	.RdData(plc4mciimlmuqoa14f7xv2j_455), 
	.Empty(oi9hw29ilu8761082h4hzw_253), 
	.AFull_0(w90ybv09w8aq8y3huk1dyrm_498), 
	.Full(ou9zgykq17520rfodk5wrd7qvv3vss8_702), 

	.WrClk(clk_in_4), 

	.RdClk(clk_out_4), 

	.WrRst(rst_in_4), 
	.RdRst(rst_out_4) 
); 

defparam polw2rjeit9k4m0d6ldv9aiqvdopf_2678.DataBits = 64; 
defparam polw2rjeit9k4m0d6ldv9aiqvdopf_2678.AddrBits = 9; 
defparam polw2rjeit9k4m0d6ldv9aiqvdopf_2678.AFullAssert_0 = 32; 
defparam polw2rjeit9k4m0d6ldv9aiqvdopf_2678.AFullNegate_0 = 32; 

PPP_SCFifo polw2rjeit9k4m0d6ldv9aiqvdopf_2678 (
	.WrEnb(tvcdxk8kpuqau3zs6lh_13),
	.WrData(efr39d9pl7i2cjahp9x_570),
	.RdEnb(lj29otv6azdo1bmc3l_92),


	.RdVal(dvg8wfd5lzys2p947mrr4_185), 
	.RdData(bi2mqeforcqs93qm54dt87_267), 
	.Empty(bh9syi7or4wtrxran6t6m_643), 
	.AFull_0(tmoamvafucdxvk3ekorz0ty1_302), 
	.Full(ise1wfu6fdvmv4tzdju4y_30), 

	.WrClk(clk_in_5), 

	.RdClk(clk_out_5), 

	.WrRst(rst_in_5), 
	.RdRst(rst_out_5) 
); 

endmodule 

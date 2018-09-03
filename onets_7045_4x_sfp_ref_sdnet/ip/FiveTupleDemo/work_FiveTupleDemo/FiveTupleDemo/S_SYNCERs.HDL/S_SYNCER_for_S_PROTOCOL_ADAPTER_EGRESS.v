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
// File name: S_SYNCER_for_S_PROTOCOL_ADAPTER_EGRESS.v
// File created: 2018/06/28 08:54:33
// Created by: Xilinx SDNet Compiler version 2017.4, build 2093981

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_S_PROTOCOL_ADAPTER_EGRESS (
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
 input		packet_in_PACKET3_SOF ;
 input		packet_in_PACKET3_EOF ;
 input		packet_in_PACKET3_VAL ;
 input	 [255:0] packet_in_PACKET3_DAT ;
 input	 [5:0] packet_in_PACKET3_CNT ;
 input		packet_in_PACKET3_ERR ;
 input		packet_out_PACKET3_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [7:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [127:0] tuple_in_TUPLE1_DATA ;
 input		tuple_in_TUPLE2_VALID ;
 input	 [21:0] tuple_in_TUPLE2_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET3_SOF ;
 output		packet_out_PACKET3_EOF ;
 output		packet_out_PACKET3_VAL ;
 output	 [255:0] packet_out_PACKET3_DAT ;
 output	 [5:0] packet_out_PACKET3_CNT ;
 output		packet_out_PACKET3_ERR ;
 output		packet_in_PACKET3_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [7:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [127:0] tuple_out_TUPLE1_DATA ;
 output		tuple_out_TUPLE2_VALID ;
 output	 [21:0] tuple_out_TUPLE2_DATA ;
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






 reg	s2h6tz1mutwc44xyze4tpmtmn2fj_255;	 initial s2h6tz1mutwc44xyze4tpmtmn2fj_255 = 1'b0 ;
 wire	r3ozabru6mawupe0wvsi67etvnlrp_87 ;
 wire [265:0] gwji0v8eu8arv5b2io1cqlcgd2_466 ;
 wire	bjclyhapsfruan8eg5mtzq3rl_426 ;
 wire	yf83gc6b1zci4ci5d2f1_905 ;
 wire	dfgwrvvend7zuzkzci7_1 ;
 wire [8:0] vo9ytae2de5bky6fztik57uy_468 ;
 wire [8:0] ac97d03tgwakvdo8phwrw5r7j_413 ;
 wire	s6rcw25z80kzp3hcp6ag_395 ;
 wire	ie0vedmr5utswzrtxm2cs_89 ;
 wire	so0tdim3zqb3qddt_720 ;
 wire	bpc3dbbfl7nmvao9dpj0_589 ;
 wire	favjxk2wijh5zouhz_746 ;
 wire	ge0akbckccmo4flua0_421 ;
 wire	ip38qr2tl69v7bbw_170 ;
 reg	xcdzrash7ghfgwe6bias_722;	 initial xcdzrash7ghfgwe6bias_722 = 1'b0 ;
 wire	m175rvai2pj6uo320qe5ymav9_798 ;
 reg	wkoiuz1zqfcz1v15qmn1j_683;	 initial wkoiuz1zqfcz1v15qmn1j_683 = 1'b0 ;
 reg	sbgzi24orhy4rr0c7ndit0fb_827;	 initial sbgzi24orhy4rr0c7ndit0fb_827 = 1'b0 ;
 wire	b65mehiosyszcs2ybcp5h6g1jboh_782 ;
 wire [0:0] toy3308a0pqrsfrno0gkziifycp_800 ;
 wire	xdsudx9pl5rgd7c381pghz5k5guy_377 ;
 wire	v392249r43l97lialj4_165 ;
 wire	c779kma6j2da0f6wnvq844n6yh5_785 ;
 wire [8:0] lv8yxe8q6g26ckitxmif4vm39qnkg4_564 ;
 wire [8:0] hh4gxjlqunipn5ywq_670 ;
 wire	sjsxc18061lu3luj6uzc_696 ;
 wire	ox4bydehubwgcsmqnmnj70_257 ;
 wire	do7jvhoyzn9seajedmznqf5p_572 ;
 wire	jac9ntl71rp8nj7x0o5bdav2ar_632 ;
 wire	zh4g5kt145b483d2hkzyv13f0r_406 ;
 wire	t1lkt0sm8va65ligjfyxqxfa67c_892 ;
 reg [8:0] e22raoo8jkk4h9gp6rq4_351;	 initial e22raoo8jkk4h9gp6rq4_351 = 9'b000000000 ;
 reg	o1jtc184iw281tl3djzv76xz5ioo_76;	 initial o1jtc184iw281tl3djzv76xz5ioo_76 = 1'b0 ;
 wire	a2uk96xv3pv0w5p5cnxapjguvr6lukar_385 ;
 wire [7:0] b8t5i950b4157l0xboj0hqvqzq7m_422 ;
 wire	i9l3oru84pqt5h4r86731qbmyye_671 ;
 wire	bst2szt6usgkw9kqsatwir038_833 ;
 wire	feyystp47pxfbbzyoq1s5wzh_123 ;
 wire [6:0] v5iefql7tm7v5x5o13efbl_64 ;
 wire [6:0] uf6y0k31rx1gst2z42b39ro_306 ;
 wire	j5qp3mtdcabp5i07xkfdq_752 ;
 wire	pucveju9aofyla2t_325 ;
 wire	c72gpttxwqzxwtuh_364 ;
 wire	nnt9n8egd2uh32j91cq39s16_589 ;
 wire	e318qnknw7vtu7s7wbnhi6ayr8_152 ;
 wire	yl8ckhoxeevxjqt78_41 ;
 wire	ae4r8gpiufnah2h4kv25_319 ;
 wire [127:0] xgmd92odln9tg3bh3v2o7ljb1fue5y_176 ;
 wire	lq3wx09u1edls7la5hzf1qycqhl3u2n_486 ;
 wire	kqadl0xthq33qly98mxyu6_455 ;
 wire	sscyvfmwmdw5wm5r5d7h4cq_37 ;
 wire [7:0] skmsx4ah3wph4zld290j0_706 ;
 wire [7:0] vbjjbmasc835u8kronhu7jb6_324 ;
 wire	z1jrsl7ctihdrj83p60_657 ;
 wire	ef5abujxcrlborza60xg3_601 ;
 wire	qo0i4x1zbv29l7c1a1nlnhx_425 ;
 wire	natp6t2k7y0frnmso11davc_573 ;
 wire	suvf1pc7u3pczk9d_247 ;
 wire	bm3o4uxm1j4te8o1o_203 ;
 wire	qpxlzznpel4lr0fp_829 ;
 wire [21:0] naq6bqw8ia35jfav08cmsyapl_467 ;
 wire	qvjp6xflyd80lijxba0o9_607 ;
 wire	jrjchjrxy5fd3fb9q_100 ;
 wire	tynwfbempq066csfxn62jefde2g28t8_23 ;
 wire [7:0] g6t0j685kk1hylnob69ol1q8yo_730 ;
 wire [7:0] hh3j744orzgyjdo2k_890 ;
 wire	znckpow3v1gx9siwe_405 ;
 wire	cxa2qapb941mbsb5_620 ;
 wire	tq1e5q5qo8znopfvi4wluh9sxpn_571 ;
 wire	mh8cili4kp4wochu4dz73fh11jsnaz_364 ;
 wire	qp1a9avpowml9k1wn_458 ;
 wire	mkx1gax63nghm2ytnw8bgcc_327 ;
 reg	qztfikyefzo87riklult61tbsifya9v_796;	 initial qztfikyefzo87riklult61tbsifya9v_796 = 1'b0 ;
 reg	fh1fm6ley9m9rmmq_319;	 initial fh1fm6ley9m9rmmq_319 = 1'b0 ;
 reg	ng3cpj1bybihya5m9qgos_432;	 initial ng3cpj1bybihya5m9qgos_432 = 1'b0 ;
 reg	a86zqgzkozy2in2qagmbou1t2fx3b_586;	 initial a86zqgzkozy2in2qagmbou1t2fx3b_586 = 1'b0 ;
 wire	wze458uxwj9f08m08c_443 ;
 wire [265:0] s8hpcqpb9iv6m71edao_73 ;
 wire	d56cy01dyyoakq6wqngipncd1g_50 ;
 wire [265:0] bkzxngk0zqbz3cdpogoadw6r10o_53 ;
 wire	q7lzjosbpx3ortq8q_398 ;
 wire	msxisn7lf1n2820mh0r5cosdjr_412 ;
 wire	lgd91dgta8fvmizxs3psn8_341 ;
 wire	mi1noewq8zxc00snpadznoqm87x_329 ;
 wire	d95u129lg2rc6d79s3w_895 ;
 wire	c0cl22thb2lt4h3o3igys16dgmz6_435 ;
 wire	p0jlmynka7ugl5egd4_756 ;
 wire	xaphg1y9688w7xt2tn95bsyvli17x8qf_840 ;
 wire	h50z895btzbib774b9m6ro8nibbq1z_272 ;
 wire	sg1uqkisgtofk04swfy_414 ;
 wire [5:0] g7uow44qg6xppxt1wibjg6hk_299 ;
 wire [255:0] idgflzrpqqce2zv5v6rm533rmbd7gg_628 ;
 wire	ihrb9i79qt8ock2l5nd9e49amk37d17_252 ;
 wire	i9gtuxb00ussiaxkvowddkmvk8mixrwl_12 ;
 wire	vfe35tq3gkorin4aywj25cuu7zngn_24 ;
 wire	o14ngez4kh7iq4x7fc5vfc482unei8ym_467 ;
 wire	fbn47bdmzrlr722eg9yj5eii3xme_414 ;
 wire [0:0] eaygtu1lumvju0ii7ps1jt_754 ;
 wire	jojfx6xl3mfrnrvs8unt21pafa6ids_490 ;
 wire	vjea25z3dm7axzuo9w9ovp_671 ;
 wire [8:0] gekc31ngfx44iiay0ryo4g7i2_475 ;
 wire	qbtmkv9l19axg739m_857 ;
 wire	o9lplp6h43jps9i79v8591y9o8b6k0af_404 ;
 wire	pabrdh8yj31q3n3uzrymi5aet7fw82c_18 ;
 wire	dzoozn2po97s0kut75_136 ;
 wire	m5a3idfxlld0588zwz6hy09w4zz_25 ;
 wire	srii5asgweeifspnlgs8oi3jix9_416 ;
 wire	exyjuiw1zaxw9cwmfkfq_331 ;
 wire [7:0] bqjlpr8rvd311oej72n1j1hii8zp8v_658 ;
 wire	ftrliajb11t4856h_502 ;
 wire [7:0] hmb0gf4r3vl9yj7qbn5riuy8toa6oofl_527 ;
 wire	ym15zl2g5u6lgyh4frvf1ux3x5szp_134 ;
 wire	mr9dzk4nrll5lp9jt822te2oqxl6_567 ;
 wire	czswc5wq68uic0mq_208 ;
 wire [127:0] opdlx124xg6y3mlhztfmt7hntbuluyz_58 ;
 wire	vjs9wznq2e24zgud2h03s1xtze6sm5_332 ;
 wire [127:0] zfrh6c8eor5l6j27wnjlfcndnurl_541 ;
 wire	t869j4ln8dlvq6l68myc7c6_340 ;
 wire	gqse3rkndw9fj9mi7z3at39jcdwbt283_786 ;
 wire	mmdvxm9w52nwryt8_173 ;
 wire [21:0] yyd3ml2lqa4vbyuu6056x4sm5yhd80_833 ;
 wire	rxzga1a54ngynu68cze2sj_460 ;
 wire [21:0] h6ma67u43f8vdjj22_783 ;
 wire	drkrmathn1mrz65zue94wlsv_500 ;
 wire	zt16x78yukmcjc559_285 ;
 wire	rtwf6l4strkgo8yp_176 ;
 wire	mpqp4ks1vr707zggu_27 ;
 wire	eqhgtcgzwujfn4vabkl3wy7th_831 ;


 assign wze458uxwj9f08m08c_443 = 
	 ~(backpressure_in) ;
 assign s8hpcqpb9iv6m71edao_73 = 
	{packet_in_PACKET3_SOF, packet_in_PACKET3_EOF, packet_in_PACKET3_VAL, packet_in_PACKET3_DAT, packet_in_PACKET3_CNT, packet_in_PACKET3_ERR} ;
 assign d56cy01dyyoakq6wqngipncd1g_50 	= packet_in_PACKET3_VAL ;
 assign bkzxngk0zqbz3cdpogoadw6r10o_53 	= s8hpcqpb9iv6m71edao_73[265:0] ;
 assign q7lzjosbpx3ortq8q_398 = 
	dzoozn2po97s0kut75_136 | mpqp4ks1vr707zggu_27 ;
 assign msxisn7lf1n2820mh0r5cosdjr_412 = 
	1'b0 ;
 assign lgd91dgta8fvmizxs3psn8_341 = 
	1'b1 ;
 assign mi1noewq8zxc00snpadznoqm87x_329 = 
	 ~(m175rvai2pj6uo320qe5ymav9_798) ;
 assign d95u129lg2rc6d79s3w_895 = 
	wze458uxwj9f08m08c_443 & srii5asgweeifspnlgs8oi3jix9_416 & q7lzjosbpx3ortq8q_398 ;
 assign c0cl22thb2lt4h3o3igys16dgmz6_435 	= d95u129lg2rc6d79s3w_895 ;
 assign p0jlmynka7ugl5egd4_756 	= c0cl22thb2lt4h3o3igys16dgmz6_435 ;
 assign xaphg1y9688w7xt2tn95bsyvli17x8qf_840 = 
	1'b0 ;
 assign h50z895btzbib774b9m6ro8nibbq1z_272 = 
	 ~(bjclyhapsfruan8eg5mtzq3rl_426) ;
 assign sg1uqkisgtofk04swfy_414 	= gwji0v8eu8arv5b2io1cqlcgd2_466[0] ;
 assign g7uow44qg6xppxt1wibjg6hk_299 	= gwji0v8eu8arv5b2io1cqlcgd2_466[6:1] ;
 assign idgflzrpqqce2zv5v6rm533rmbd7gg_628 	= gwji0v8eu8arv5b2io1cqlcgd2_466[262:7] ;
 assign ihrb9i79qt8ock2l5nd9e49amk37d17_252 	= gwji0v8eu8arv5b2io1cqlcgd2_466[263] ;
 assign i9gtuxb00ussiaxkvowddkmvk8mixrwl_12 	= gwji0v8eu8arv5b2io1cqlcgd2_466[264] ;
 assign vfe35tq3gkorin4aywj25cuu7zngn_24 	= gwji0v8eu8arv5b2io1cqlcgd2_466[265] ;
 assign o14ngez4kh7iq4x7fc5vfc482unei8ym_467 = 
	sbgzi24orhy4rr0c7ndit0fb_827 & ihrb9i79qt8ock2l5nd9e49amk37d17_252 ;
 assign fbn47bdmzrlr722eg9yj5eii3xme_414 	= packet_in_PACKET3_VAL ;
 assign eaygtu1lumvju0ii7ps1jt_754 = packet_in_PACKET3_SOF ;
 assign jojfx6xl3mfrnrvs8unt21pafa6ids_490 	= c0cl22thb2lt4h3o3igys16dgmz6_435 ;
 assign vjea25z3dm7axzuo9w9ovp_671 = 
	1'b0 ;
 assign gekc31ngfx44iiay0ryo4g7i2_475 	= lv8yxe8q6g26ckitxmif4vm39qnkg4_564[8:0] ;
 assign qbtmkv9l19axg739m_857 = (
	((gekc31ngfx44iiay0ryo4g7i2_475 != e22raoo8jkk4h9gp6rq4_351))?1'b1:
	0)  ;
 assign o9lplp6h43jps9i79v8591y9o8b6k0af_404 = toy3308a0pqrsfrno0gkziifycp_800 ;
 assign pabrdh8yj31q3n3uzrymi5aet7fw82c_18 = toy3308a0pqrsfrno0gkziifycp_800 ;
 assign dzoozn2po97s0kut75_136 = 
	 ~(pabrdh8yj31q3n3uzrymi5aet7fw82c_18) ;
 assign m5a3idfxlld0588zwz6hy09w4zz_25 	= xdsudx9pl5rgd7c381pghz5k5guy_377 ;
 assign srii5asgweeifspnlgs8oi3jix9_416 = 
	 ~(xdsudx9pl5rgd7c381pghz5k5guy_377) ;
 assign exyjuiw1zaxw9cwmfkfq_331 = 
	wze458uxwj9f08m08c_443 & mpqp4ks1vr707zggu_27 & srii5asgweeifspnlgs8oi3jix9_416 & o9lplp6h43jps9i79v8591y9o8b6k0af_404 ;
 assign bqjlpr8rvd311oej72n1j1hii8zp8v_658 = 
	tuple_in_TUPLE0_DATA ;
 assign ftrliajb11t4856h_502 	= tuple_in_TUPLE0_VALID ;
 assign hmb0gf4r3vl9yj7qbn5riuy8toa6oofl_527 	= bqjlpr8rvd311oej72n1j1hii8zp8v_658[7:0] ;
 assign ym15zl2g5u6lgyh4frvf1ux3x5szp_134 = 
	 ~(i9l3oru84pqt5h4r86731qbmyye_671) ;
 assign mr9dzk4nrll5lp9jt822te2oqxl6_567 	= exyjuiw1zaxw9cwmfkfq_331 ;
 assign czswc5wq68uic0mq_208 = 
	1'b0 ;
 assign opdlx124xg6y3mlhztfmt7hntbuluyz_58 = 
	tuple_in_TUPLE1_DATA ;
 assign vjs9wznq2e24zgud2h03s1xtze6sm5_332 	= tuple_in_TUPLE1_VALID ;
 assign zfrh6c8eor5l6j27wnjlfcndnurl_541 	= opdlx124xg6y3mlhztfmt7hntbuluyz_58[127:0] ;
 assign t869j4ln8dlvq6l68myc7c6_340 = 
	 ~(lq3wx09u1edls7la5hzf1qycqhl3u2n_486) ;
 assign gqse3rkndw9fj9mi7z3at39jcdwbt283_786 	= exyjuiw1zaxw9cwmfkfq_331 ;
 assign mmdvxm9w52nwryt8_173 = 
	1'b0 ;
 assign yyd3ml2lqa4vbyuu6056x4sm5yhd80_833 = 
	tuple_in_TUPLE2_DATA ;
 assign rxzga1a54ngynu68cze2sj_460 	= tuple_in_TUPLE2_VALID ;
 assign h6ma67u43f8vdjj22_783 	= yyd3ml2lqa4vbyuu6056x4sm5yhd80_833[21:0] ;
 assign drkrmathn1mrz65zue94wlsv_500 = 
	 ~(qvjp6xflyd80lijxba0o9_607) ;
 assign zt16x78yukmcjc559_285 	= exyjuiw1zaxw9cwmfkfq_331 ;
 assign rtwf6l4strkgo8yp_176 = 
	1'b0 ;
 assign mpqp4ks1vr707zggu_27 = 
	h50z895btzbib774b9m6ro8nibbq1z_272 & ym15zl2g5u6lgyh4frvf1ux3x5szp_134 & t869j4ln8dlvq6l68myc7c6_340 & drkrmathn1mrz65zue94wlsv_500 ;
 assign eqhgtcgzwujfn4vabkl3wy7th_831 = 
	qztfikyefzo87riklult61tbsifya9v_796 | fh1fm6ley9m9rmmq_319 | ng3cpj1bybihya5m9qgos_432 | a86zqgzkozy2in2qagmbou1t2fx3b_586 ;
 assign packet_out_PACKET3_SOF 	= vfe35tq3gkorin4aywj25cuu7zngn_24 ;
 assign packet_out_PACKET3_EOF 	= i9gtuxb00ussiaxkvowddkmvk8mixrwl_12 ;
 assign packet_out_PACKET3_VAL 	= o14ngez4kh7iq4x7fc5vfc482unei8ym_467 ;
 assign packet_out_PACKET3_DAT 	= idgflzrpqqce2zv5v6rm533rmbd7gg_628[255:0] ;
 assign packet_out_PACKET3_CNT 	= g7uow44qg6xppxt1wibjg6hk_299[5:0] ;
 assign packet_out_PACKET3_ERR 	= sg1uqkisgtofk04swfy_414 ;
 assign packet_in_PACKET3_RDY 	= packet_out_PACKET3_RDY ;
 assign tuple_out_TUPLE0_VALID 	= o1jtc184iw281tl3djzv76xz5ioo_76 ;
 assign tuple_out_TUPLE0_DATA 	= b8t5i950b4157l0xboj0hqvqzq7m_422[7:0] ;
 assign tuple_out_TUPLE1_VALID 	= o1jtc184iw281tl3djzv76xz5ioo_76 ;
 assign tuple_out_TUPLE1_DATA 	= xgmd92odln9tg3bh3v2o7ljb1fue5y_176[127:0] ;
 assign tuple_out_TUPLE2_VALID 	= o1jtc184iw281tl3djzv76xz5ioo_76 ;
 assign tuple_out_TUPLE2_DATA 	= naq6bqw8ia35jfav08cmsyapl_467[21:0] ;


assign ip38qr2tl69v7bbw_170 = (
	((c0cl22thb2lt4h3o3igys16dgmz6_435 == 1'b1))?lgd91dgta8fvmizxs3psn8_341 :
	((wze458uxwj9f08m08c_443 == 1'b1))?msxisn7lf1n2820mh0r5cosdjr_412 :
	xcdzrash7ghfgwe6bias_722 ) ;

assign m175rvai2pj6uo320qe5ymav9_798 = (
	((xcdzrash7ghfgwe6bias_722 == 1'b1) && (wze458uxwj9f08m08c_443 == 1'b1))?msxisn7lf1n2820mh0r5cosdjr_412 :
	xcdzrash7ghfgwe6bias_722 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	s2h6tz1mutwc44xyze4tpmtmn2fj_255 <= 1'b0 ;
	xcdzrash7ghfgwe6bias_722 <= 1'b0 ;
	wkoiuz1zqfcz1v15qmn1j_683 <= 1'b0 ;
	sbgzi24orhy4rr0c7ndit0fb_827 <= 1'b0 ;
	e22raoo8jkk4h9gp6rq4_351 <= 9'b000000000 ;
	qztfikyefzo87riklult61tbsifya9v_796 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		s2h6tz1mutwc44xyze4tpmtmn2fj_255 <= backpressure_in ;
		xcdzrash7ghfgwe6bias_722 <= ip38qr2tl69v7bbw_170 ;
		wkoiuz1zqfcz1v15qmn1j_683 <= h50z895btzbib774b9m6ro8nibbq1z_272 ;
		sbgzi24orhy4rr0c7ndit0fb_827 <= c0cl22thb2lt4h3o3igys16dgmz6_435 ;
		e22raoo8jkk4h9gp6rq4_351 <= gekc31ngfx44iiay0ryo4g7i2_475 ;
		qztfikyefzo87riklult61tbsifya9v_796 <= yf83gc6b1zci4ci5d2f1_905 ;
		backpressure_out <= eqhgtcgzwujfn4vabkl3wy7th_831 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	o1jtc184iw281tl3djzv76xz5ioo_76 <= 1'b0 ;
	fh1fm6ley9m9rmmq_319 <= 1'b0 ;
   end
  else
  begin
		o1jtc184iw281tl3djzv76xz5ioo_76 <= exyjuiw1zaxw9cwmfkfq_331 ;
		fh1fm6ley9m9rmmq_319 <= bst2szt6usgkw9kqsatwir038_833 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	ng3cpj1bybihya5m9qgos_432 <= 1'b0 ;
   end
  else
  begin
		ng3cpj1bybihya5m9qgos_432 <= kqadl0xthq33qly98mxyu6_455 ;
  end
end

always @(posedge clk_out_3)
begin
  if (rst_in_0) 
  begin
	a86zqgzkozy2in2qagmbou1t2fx3b_586 <= 1'b0 ;
   end
  else
  begin
		a86zqgzkozy2in2qagmbou1t2fx3b_586 <= jrjchjrxy5fd3fb9q_100 ;
  end
end

defparam m50jq10tmu1czcsdqxg_1305.WRITE_DATA_WIDTH = 266; 
defparam m50jq10tmu1czcsdqxg_1305.FIFO_WRITE_DEPTH = 512; 
defparam m50jq10tmu1czcsdqxg_1305.PROG_FULL_THRESH = 171; 
defparam m50jq10tmu1czcsdqxg_1305.PROG_EMPTY_THRESH = 171; 
defparam m50jq10tmu1czcsdqxg_1305.READ_MODE = "STD"; 
defparam m50jq10tmu1czcsdqxg_1305.WR_DATA_COUNT_WIDTH = 9; 
defparam m50jq10tmu1czcsdqxg_1305.RD_DATA_COUNT_WIDTH = 9; 
defparam m50jq10tmu1czcsdqxg_1305.DOUT_RESET_VALUE = "0"; 
defparam m50jq10tmu1czcsdqxg_1305.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync m50jq10tmu1czcsdqxg_1305 (
	.wr_en(d56cy01dyyoakq6wqngipncd1g_50),
	.din(bkzxngk0zqbz3cdpogoadw6r10o_53),
	.rd_en(p0jlmynka7ugl5egd4_756),
	.sleep(xaphg1y9688w7xt2tn95bsyvli17x8qf_840),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(r3ozabru6mawupe0wvsi67etvnlrp_87), 
	.dout(gwji0v8eu8arv5b2io1cqlcgd2_466), 
	.empty(bjclyhapsfruan8eg5mtzq3rl_426), 
	.prog_full(yf83gc6b1zci4ci5d2f1_905), 
	.full(dfgwrvvend7zuzkzci7_1), 
	.rd_data_count(vo9ytae2de5bky6fztik57uy_468), 
	.wr_data_count(ac97d03tgwakvdo8phwrw5r7j_413), 
	.wr_rst_busy(s6rcw25z80kzp3hcp6ag_395), 
	.rd_rst_busy(ie0vedmr5utswzrtxm2cs_89), 
	.overflow(so0tdim3zqb3qddt_720), 
	.underflow(bpc3dbbfl7nmvao9dpj0_589), 
	.sbiterr(favjxk2wijh5zouhz_746), 
	.dbiterr(ge0akbckccmo4flua0_421), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam bq6rghvyu721tmzammyb65sdufloeh_556.WRITE_DATA_WIDTH = 1; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.FIFO_WRITE_DEPTH = 512; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.PROG_FULL_THRESH = 171; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.PROG_EMPTY_THRESH = 171; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.READ_MODE = "FWFT"; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.WR_DATA_COUNT_WIDTH = 9; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.RD_DATA_COUNT_WIDTH = 9; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.DOUT_RESET_VALUE = "0"; 
defparam bq6rghvyu721tmzammyb65sdufloeh_556.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync bq6rghvyu721tmzammyb65sdufloeh_556 (
	.wr_en(fbn47bdmzrlr722eg9yj5eii3xme_414),
	.din(eaygtu1lumvju0ii7ps1jt_754),
	.rd_en(jojfx6xl3mfrnrvs8unt21pafa6ids_490),
	.sleep(vjea25z3dm7axzuo9w9ovp_671),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(b65mehiosyszcs2ybcp5h6g1jboh_782), 
	.dout(toy3308a0pqrsfrno0gkziifycp_800), 
	.empty(xdsudx9pl5rgd7c381pghz5k5guy_377), 
	.prog_full(v392249r43l97lialj4_165), 
	.full(c779kma6j2da0f6wnvq844n6yh5_785), 
	.rd_data_count(lv8yxe8q6g26ckitxmif4vm39qnkg4_564), 
	.wr_data_count(hh4gxjlqunipn5ywq_670), 
	.wr_rst_busy(sjsxc18061lu3luj6uzc_696), 
	.rd_rst_busy(ox4bydehubwgcsmqnmnj70_257), 
	.overflow(do7jvhoyzn9seajedmznqf5p_572), 
	.underflow(jac9ntl71rp8nj7x0o5bdav2ar_632), 
	.sbiterr(zh4g5kt145b483d2hkzyv13f0r_406), 
	.dbiterr(t1lkt0sm8va65ligjfyxqxfa67c_892), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam uoygb1871rxw7tbcf_2611.WRITE_DATA_WIDTH = 8; 
defparam uoygb1871rxw7tbcf_2611.FIFO_WRITE_DEPTH = 128; 
defparam uoygb1871rxw7tbcf_2611.PROG_FULL_THRESH = 49; 
defparam uoygb1871rxw7tbcf_2611.PROG_EMPTY_THRESH = 49; 
defparam uoygb1871rxw7tbcf_2611.READ_MODE = "STD"; 
defparam uoygb1871rxw7tbcf_2611.WR_DATA_COUNT_WIDTH = 7; 
defparam uoygb1871rxw7tbcf_2611.RD_DATA_COUNT_WIDTH = 7; 
defparam uoygb1871rxw7tbcf_2611.DOUT_RESET_VALUE = "0"; 
defparam uoygb1871rxw7tbcf_2611.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async uoygb1871rxw7tbcf_2611 (
	.wr_en(ftrliajb11t4856h_502),
	.din(hmb0gf4r3vl9yj7qbn5riuy8toa6oofl_527),
	.rd_en(mr9dzk4nrll5lp9jt822te2oqxl6_567),
	.sleep(czswc5wq68uic0mq_208),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(a2uk96xv3pv0w5p5cnxapjguvr6lukar_385), 
	.dout(b8t5i950b4157l0xboj0hqvqzq7m_422), 
	.empty(i9l3oru84pqt5h4r86731qbmyye_671), 
	.prog_full(bst2szt6usgkw9kqsatwir038_833), 
	.full(feyystp47pxfbbzyoq1s5wzh_123), 
	.rd_data_count(v5iefql7tm7v5x5o13efbl_64), 
	.wr_data_count(uf6y0k31rx1gst2z42b39ro_306), 
	.wr_rst_busy(j5qp3mtdcabp5i07xkfdq_752), 
	.rd_rst_busy(pucveju9aofyla2t_325), 
	.overflow(c72gpttxwqzxwtuh_364), 
	.underflow(nnt9n8egd2uh32j91cq39s16_589), 
	.sbiterr(e318qnknw7vtu7s7wbnhi6ayr8_152), 
	.dbiterr(yl8ckhoxeevxjqt78_41), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.WRITE_DATA_WIDTH = 128; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.FIFO_WRITE_DEPTH = 256; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.PROG_FULL_THRESH = 106; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.PROG_EMPTY_THRESH = 106; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.READ_MODE = "STD"; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.WR_DATA_COUNT_WIDTH = 8; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.RD_DATA_COUNT_WIDTH = 8; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.DOUT_RESET_VALUE = "0"; 
defparam dfpgte6t8ehsahkaupoh54jrkm7v5h_2490.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async dfpgte6t8ehsahkaupoh54jrkm7v5h_2490 (
	.wr_en(vjs9wznq2e24zgud2h03s1xtze6sm5_332),
	.din(zfrh6c8eor5l6j27wnjlfcndnurl_541),
	.rd_en(gqse3rkndw9fj9mi7z3at39jcdwbt283_786),
	.sleep(mmdvxm9w52nwryt8_173),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ae4r8gpiufnah2h4kv25_319), 
	.dout(xgmd92odln9tg3bh3v2o7ljb1fue5y_176), 
	.empty(lq3wx09u1edls7la5hzf1qycqhl3u2n_486), 
	.prog_full(kqadl0xthq33qly98mxyu6_455), 
	.full(sscyvfmwmdw5wm5r5d7h4cq_37), 
	.rd_data_count(skmsx4ah3wph4zld290j0_706), 
	.wr_data_count(vbjjbmasc835u8kronhu7jb6_324), 
	.wr_rst_busy(z1jrsl7ctihdrj83p60_657), 
	.rd_rst_busy(ef5abujxcrlborza60xg3_601), 
	.overflow(qo0i4x1zbv29l7c1a1nlnhx_425), 
	.underflow(natp6t2k7y0frnmso11davc_573), 
	.sbiterr(suvf1pc7u3pczk9d_247), 
	.dbiterr(bm3o4uxm1j4te8o1o_203), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.WRITE_DATA_WIDTH = 22; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.FIFO_WRITE_DEPTH = 256; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.PROG_FULL_THRESH = 106; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.PROG_EMPTY_THRESH = 106; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.READ_MODE = "STD"; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.WR_DATA_COUNT_WIDTH = 8; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.RD_DATA_COUNT_WIDTH = 8; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.DOUT_RESET_VALUE = "0"; 
defparam p8glf0iyg0b1qxz3ymwrrnnp37t_20.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async p8glf0iyg0b1qxz3ymwrrnnp37t_20 (
	.wr_en(rxzga1a54ngynu68cze2sj_460),
	.din(h6ma67u43f8vdjj22_783),
	.rd_en(zt16x78yukmcjc559_285),
	.sleep(rtwf6l4strkgo8yp_176),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(qpxlzznpel4lr0fp_829), 
	.dout(naq6bqw8ia35jfav08cmsyapl_467), 
	.empty(qvjp6xflyd80lijxba0o9_607), 
	.prog_full(jrjchjrxy5fd3fb9q_100), 
	.full(tynwfbempq066csfxn62jefde2g28t8_23), 
	.rd_data_count(g6t0j685kk1hylnob69ol1q8yo_730), 
	.wr_data_count(hh3j744orzgyjdo2k_890), 
	.wr_rst_busy(znckpow3v1gx9siwe_405), 
	.rd_rst_busy(cxa2qapb941mbsb5_620), 
	.overflow(tq1e5q5qo8znopfvi4wluh9sxpn_571), 
	.underflow(mh8cili4kp4wochu4dz73fh11jsnaz_364), 
	.sbiterr(qp1a9avpowml9k1wn_458), 
	.dbiterr(mkx1gax63nghm2ytnw8bgcc_327), 

	.wr_clk(clk_in_3), 

	.rd_clk(clk_out_3), 
	.rst(rst_in_3) 
); 

endmodule 

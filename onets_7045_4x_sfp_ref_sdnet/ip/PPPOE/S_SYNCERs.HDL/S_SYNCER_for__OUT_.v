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
// File created: 2017/07/31 12:13:45
// Created by: Xilinx SDNet Compiler version HEAD, build 1585976

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for__OUT_ (
     packet_in_PACKET1_TVALID, 
     packet_in_PACKET1_TDATA, 
     packet_in_PACKET1_TKEEP, 
     packet_in_PACKET1_TLAST, 
     packet_out_PACKET1_TREADY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     backpressure_in, 


     packet_out_PACKET1_TVALID, 
     packet_out_PACKET1_TDATA, 
     packet_out_PACKET1_TKEEP, 
     packet_out_PACKET1_TLAST, 
     packet_in_PACKET1_TREADY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
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
 input		packet_in_PACKET1_TVALID ;
 input	 [255:0] packet_in_PACKET1_TDATA ;
 input	 [31:0] packet_in_PACKET1_TKEEP ;
 input		packet_in_PACKET1_TLAST ;
 input		packet_out_PACKET1_TREADY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [127:0] tuple_in_TUPLE0_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET1_TVALID ;
 output	 [255:0] packet_out_PACKET1_TDATA ;
 output	 [31:0] packet_out_PACKET1_TKEEP ;
 output		packet_out_PACKET1_TLAST ;
 output		packet_in_PACKET1_TREADY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [127:0] tuple_out_TUPLE0_DATA ;
 output	reg	backpressure_out ;
 input		clk_in_0 ;
 input		clk_out_0 ;
 input		clk_in_1 ;
 input		clk_out_1 ;
 input		rst_in_0 ;
 input		rst_out_0 ;
 input		rst_in_1 ;
 input		rst_out_1 ;






 wire	llbrqbl4zsdwxp77tk13xp4k_140 ;
 wire [289:0] v5k6oow9ab7x8jm3tquda7x29xic6_589 ;
 wire	lyclm98umjzybg7euqn35jz76z73i_380 ;
 wire	s6n9bhq6ymudo4va4gmfeb1omfh_462 ;
 wire	w3zvqpo6wyldzb70fdc3tj0sda5s9r2_469 ;
 reg	nj1d2evmixlc8o61_768 ;
 wire	yauqnyspy0yltz9b7_148 ;
 wire [0:0] v48va05yzclej7ixs2p_95 ;
 wire	p8v9jh6w1w66ldw6dzbj78_373 ;
 wire	nniuol5tlm9xki3f5v3u75h_900 ;
 wire [0:0] dxx1fco3zv0c80cfgi6_605 ;
 wire	ya9axmaemfvf7acvwsv3y_38 ;
 wire	fwjv0z3hxo8ny816jayy9qgl_178 ;
 wire	bjvwb42zjk5nwxdy28uhare4gjbzi_685 ;
 reg	p2brjgi6t2due7bz47wfgllvli_449 ;
 reg	eb7rwmg6filoo2n4l_432 ;
 wire	chxw8y7wlvfvdm7mfliw_524 ;
 wire [127:0] g0huf1pckwth9ctsfuauoy4ifou47_0 ;
 wire	nlgjeaq7b9dk8usnm_357 ;
 wire	xdt2ftfr6q9pmazydcgy_70 ;
 wire	ut39zch4buzkwah2lznddilk_533 ;
 reg	lyvs7d00qe4ovhmy39_390 ;
 reg	j4jirxelb6nnjcu0bdqz_362 ;
 wire	l3cegcvob0tyoqr5or73kxp7iy_80 ;
 wire [289:0] s9qu5a1l7oqzmz2hkou3l9dyzxes39iq_257 ;
 wire	zoqoc9zpzjas4hec5xcf5en_338 ;
 wire [289:0] spew2azpl6bnudk9sq2xsizta1orl_309 ;
 wire	xq2df70u3xw7ckw2uhlopma_858 ;
 wire	uvr6o3qbon52ii63_861 ;
 wire	uw8uhs127sqk80ly781kwat_753 ;
 wire	n7unzx524u1fagcr7b2uxm5pkrd1_41 ;
 wire	dmgnzlf2tuuaoqtnzs5ojix_843 ;
 wire [31:0] kli2mywocpmzg1mr_652 ;
 wire [255:0] wnf9bbtknsaconvs14fr_418 ;
 wire	d5r5lpeb8alvbzl0_313 ;
 wire	zgtv3srn12zi7sdbyni82dciw8l_278 ;
 wire	eyk6fyky0ucg0rg8znd1su5q_91 ;
 wire	f9t6cx4hylb903rry9z_282 ;
 wire	lxf6f59esfyddxkbwniu_234 ;
 wire [0:0] b13pbspaa1dpbxtov_890 ;
 wire	ke30zpfn7hthgh99scg3qcfvtrxurc6z_535 ;
 wire	ji6b2n4ht6ay6bvogsuymvf42a53egx_457 ;
 wire	garj4e7qd54xi835vp6_873 ;
 wire	htl9804gzwagyaxm94b_464 ;
 wire	rddcr5q7ve73uiy0adct32i4m4vymk_451 ;
 wire	qoo9icreij4d6n4q7iziky_730 ;
 wire	te6ak9g832kcrkqwdo32uwu5ltn_154 ;
 wire	pqo0zwgl7od9amdqmi_783 ;
 wire	jy81uoe2s8zvli6yva3_704 ;
 wire	ztk8vk4cb8r506xhla522jur9pk8zj_398 ;
 wire	gg9w8ri2ax138n49c5gxsrip1xxvt7_360 ;
 wire [0:0] uci8pmavtvpfh1npbdp5gf1a6z8jx_516 ;
 wire	adjpka6eeqpn31txxn7n7ag41_113 ;
 wire	g76uqlxq2vvmqa5a9ra_129 ;
 wire	bv4ny9etyh8waipi4c1jk5gi_388 ;
 wire	p0g070eknb061tyf2o300xizqhddc_550 ;
 wire	yrlbcwcvfqy5fbtgeqveb52v8svx9bs6_119 ;
 wire	kv0tk3h6jnr1wec36_219 ;
 wire [127:0] dqts3avs3oo2bx1xu0u_249 ;
 wire	omcki52t0yv3q99coy8cae5scxkd8_836 ;
 wire [127:0] wr0a69smhiaro28ho7bpb1fzcjcc_613 ;
 wire	gmdyccmu2o8el1p77kd6eh6g8sfxwm_130 ;
 wire	wfbartbfj7o1eo3wwk2bqaei5klnufxo_517 ;
 wire	lxm8k8hxci2o3dfg1yhloigf_115 ;
 wire	f2kwdil3t27uzxx6nbl55px52_571 ;


 assign l3cegcvob0tyoqr5or73kxp7iy_80 = 
	 ~(backpressure_in) ;
 assign s9qu5a1l7oqzmz2hkou3l9dyzxes39iq_257 = 
	{packet_in_PACKET1_TVALID, packet_in_PACKET1_TDATA, packet_in_PACKET1_TKEEP, packet_in_PACKET1_TLAST} ;
 assign zoqoc9zpzjas4hec5xcf5en_338 	= packet_in_PACKET1_TVALID ;
 assign spew2azpl6bnudk9sq2xsizta1orl_309 	= s9qu5a1l7oqzmz2hkou3l9dyzxes39iq_257[289:0] ;
 assign xq2df70u3xw7ckw2uhlopma_858 = 
	htl9804gzwagyaxm94b_464 | lxm8k8hxci2o3dfg1yhloigf_115 ;
 assign uvr6o3qbon52ii63_861 = 
	l3cegcvob0tyoqr5or73kxp7iy_80 & ji6b2n4ht6ay6bvogsuymvf42a53egx_457 & xq2df70u3xw7ckw2uhlopma_858 ;
 assign uw8uhs127sqk80ly781kwat_753 	= uvr6o3qbon52ii63_861 ;
 assign n7unzx524u1fagcr7b2uxm5pkrd1_41 = 
	 ~(lyclm98umjzybg7euqn35jz76z73i_380) ;
 assign dmgnzlf2tuuaoqtnzs5ojix_843 	= v5k6oow9ab7x8jm3tquda7x29xic6_589[0] ;
 assign kli2mywocpmzg1mr_652 	= v5k6oow9ab7x8jm3tquda7x29xic6_589[32:1] ;
 assign wnf9bbtknsaconvs14fr_418 	= v5k6oow9ab7x8jm3tquda7x29xic6_589[288:33] ;
 assign d5r5lpeb8alvbzl0_313 	= v5k6oow9ab7x8jm3tquda7x29xic6_589[289] ;
 assign zgtv3srn12zi7sdbyni82dciw8l_278 = 
	nj1d2evmixlc8o61_768 & d5r5lpeb8alvbzl0_313 ;
 assign eyk6fyky0ucg0rg8znd1su5q_91 	= uvr6o3qbon52ii63_861 ;
 assign f9t6cx4hylb903rry9z_282 	= eyk6fyky0ucg0rg8znd1su5q_91 ;
 assign lxf6f59esfyddxkbwniu_234 	= g76uqlxq2vvmqa5a9ra_129 ;
 assign b13pbspaa1dpbxtov_890 = bv4ny9etyh8waipi4c1jk5gi_388 ;
 assign ke30zpfn7hthgh99scg3qcfvtrxurc6z_535 	= p0g070eknb061tyf2o300xizqhddc_550 ;
 assign ji6b2n4ht6ay6bvogsuymvf42a53egx_457 	= yauqnyspy0yltz9b7_148 ;
 assign garj4e7qd54xi835vp6_873 = v48va05yzclej7ixs2p_95 ;
 assign htl9804gzwagyaxm94b_464 = 
	 ~(garj4e7qd54xi835vp6_873) ;
 assign rddcr5q7ve73uiy0adct32i4m4vymk_451 	= p8v9jh6w1w66ldw6dzbj78_373 ;
 assign qoo9icreij4d6n4q7iziky_730 	= packet_in_PACKET1_TVALID ;
 assign te6ak9g832kcrkqwdo32uwu5ltn_154 = 
	1'b0 ;
 assign pqo0zwgl7od9amdqmi_783 = 
	1'b1 ;
 assign jy81uoe2s8zvli6yva3_704 = (
	((p2brjgi6t2due7bz47wfgllvli_449 == 1'b1) && (packet_in_PACKET1_TVALID == 1'b1))?1'b1:
	((eb7rwmg6filoo2n4l_432 == 1'b1) && (packet_in_PACKET1_TVALID == 1'b1))?1'b1:
	0)  ;
 assign ztk8vk4cb8r506xhla522jur9pk8zj_398 = (
	((packet_in_PACKET1_TVALID == 1'b1) && (packet_in_PACKET1_TLAST == 1'b1))?1'b1:
	0)  ;
 assign gg9w8ri2ax138n49c5gxsrip1xxvt7_360 = (
	((packet_in_PACKET1_TVALID == 1'b1) && (packet_in_PACKET1_TLAST == 1'b0))?1'b1:
	0)  ;
 assign uci8pmavtvpfh1npbdp5gf1a6z8jx_516 = jy81uoe2s8zvli6yva3_704 ;
 assign adjpka6eeqpn31txxn7n7ag41_113 	= rddcr5q7ve73uiy0adct32i4m4vymk_451 ;
 assign g76uqlxq2vvmqa5a9ra_129 	= nniuol5tlm9xki3f5v3u75h_900 ;
 assign bv4ny9etyh8waipi4c1jk5gi_388 = dxx1fco3zv0c80cfgi6_605 ;
 assign p0g070eknb061tyf2o300xizqhddc_550 	= ya9axmaemfvf7acvwsv3y_38 ;
 assign yrlbcwcvfqy5fbtgeqveb52v8svx9bs6_119 = 
	 ~(ya9axmaemfvf7acvwsv3y_38) ;
 assign kv0tk3h6jnr1wec36_219 = 
	l3cegcvob0tyoqr5or73kxp7iy_80 & lxm8k8hxci2o3dfg1yhloigf_115 & ji6b2n4ht6ay6bvogsuymvf42a53egx_457 & garj4e7qd54xi835vp6_873 ;
 assign dqts3avs3oo2bx1xu0u_249 = 
	tuple_in_TUPLE0_DATA ;
 assign omcki52t0yv3q99coy8cae5scxkd8_836 	= tuple_in_TUPLE0_VALID ;
 assign wr0a69smhiaro28ho7bpb1fzcjcc_613 	= dqts3avs3oo2bx1xu0u_249[127:0] ;
 assign gmdyccmu2o8el1p77kd6eh6g8sfxwm_130 = 
	 ~(nlgjeaq7b9dk8usnm_357) ;
 assign wfbartbfj7o1eo3wwk2bqaei5klnufxo_517 	= kv0tk3h6jnr1wec36_219 ;
 assign lxm8k8hxci2o3dfg1yhloigf_115 = 
	n7unzx524u1fagcr7b2uxm5pkrd1_41 & gmdyccmu2o8el1p77kd6eh6g8sfxwm_130 ;
 assign f2kwdil3t27uzxx6nbl55px52_571 = 
	lyvs7d00qe4ovhmy39_390 | j4jirxelb6nnjcu0bdqz_362 ;
 assign packet_out_PACKET1_TVALID 	= zgtv3srn12zi7sdbyni82dciw8l_278 ;
 assign packet_out_PACKET1_TDATA 	= wnf9bbtknsaconvs14fr_418[255:0] ;
 assign packet_out_PACKET1_TKEEP 	= kli2mywocpmzg1mr_652[31:0] ;
 assign packet_out_PACKET1_TLAST 	= dmgnzlf2tuuaoqtnzs5ojix_843 ;
 assign packet_in_PACKET1_TREADY 	= packet_out_PACKET1_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= chxw8y7wlvfvdm7mfliw_524 ;
 assign tuple_out_TUPLE0_DATA 	= g0huf1pckwth9ctsfuauoy4ifou47_0[127:0] ;


always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	nj1d2evmixlc8o61_768 <= 1'b0 ;
	lyvs7d00qe4ovhmy39_390 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		nj1d2evmixlc8o61_768 <= uvr6o3qbon52ii63_861 ;
		lyvs7d00qe4ovhmy39_390 <= s6n9bhq6ymudo4va4gmfeb1omfh_462 ;
		backpressure_out <= f2kwdil3t27uzxx6nbl55px52_571 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	p2brjgi6t2due7bz47wfgllvli_449 <= 1'b0 ;
	eb7rwmg6filoo2n4l_432 <= 1'b1 ;
   end
  else
  begin
	if (gg9w8ri2ax138n49c5gxsrip1xxvt7_360) 
	begin 
	  p2brjgi6t2due7bz47wfgllvli_449 <= 1'b0 ;
	 end 
	else 
	begin 
		if (ztk8vk4cb8r506xhla522jur9pk8zj_398) 
		begin 
			p2brjgi6t2due7bz47wfgllvli_449 <= pqo0zwgl7od9amdqmi_783 ;
		end 
	end 
	if (jy81uoe2s8zvli6yva3_704) 
	begin 
		eb7rwmg6filoo2n4l_432 <= te6ak9g832kcrkqwdo32uwu5ltn_154 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	j4jirxelb6nnjcu0bdqz_362 <= 1'b0 ;
   end
  else
  begin
		j4jirxelb6nnjcu0bdqz_362 <= xdt2ftfr6q9pmazydcgy_70 ;
  end
end

defparam qeb4zyewcyt032zly95a28t04z7ul3d_1805.DataBits = 290; 
defparam qeb4zyewcyt032zly95a28t04z7ul3d_1805.AddrBits = 9; 
defparam qeb4zyewcyt032zly95a28t04z7ul3d_1805.AFullAssert_0 = 17; 
defparam qeb4zyewcyt032zly95a28t04z7ul3d_1805.AFullNegate_0 = 17; 

PPP_SCFifo qeb4zyewcyt032zly95a28t04z7ul3d_1805 (
	.WrEnb(zoqoc9zpzjas4hec5xcf5en_338),
	.WrData(spew2azpl6bnudk9sq2xsizta1orl_309),
	.RdEnb(uw8uhs127sqk80ly781kwat_753),


	.RdVal(llbrqbl4zsdwxp77tk13xp4k_140), 
	.RdData(v5k6oow9ab7x8jm3tquda7x29xic6_589), 
	.Empty(lyclm98umjzybg7euqn35jz76z73i_380), 
	.AFull_0(s6n9bhq6ymudo4va4gmfeb1omfh_462), 
	.Full(w3zvqpo6wyldzb70fdc3tj0sda5s9r2_469), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam a2ds2iw1fu5r9inm4wk2ci7oere4tu_756.DscBits = 1; 
defparam a2ds2iw1fu5r9inm4wk2ci7oere4tu_756.BufSize = 512; 
defparam a2ds2iw1fu5r9inm4wk2ci7oere4tu_756.CntBits = 9; 

PPP_DscSCBuf a2ds2iw1fu5r9inm4wk2ci7oere4tu_756 (
	.DscSkip(f9t6cx4hylb903rry9z_282),
	.RdVal(lxf6f59esfyddxkbwniu_234),
	.RdData(b13pbspaa1dpbxtov_890),
	.Empty(ke30zpfn7hthgh99scg3qcfvtrxurc6z_535),


	.DscVal(yauqnyspy0yltz9b7_148), 
	.DscData(v48va05yzclej7ixs2p_95), 
	.RdEnb(p8v9jh6w1w66ldw6dzbj78_373), 

	.Clk(clk_out_0), 
	.Rst(rst_in_0) 
); 

defparam xvwnkxvmpawhltrxhta33p8p8eih6o3_386.DataBits = 1; 
defparam xvwnkxvmpawhltrxhta33p8p8eih6o3_386.AddrBits = 9; 
defparam xvwnkxvmpawhltrxhta33p8p8eih6o3_386.AFullAssert_0 = 256; 
defparam xvwnkxvmpawhltrxhta33p8p8eih6o3_386.AFullNegate_0 = 256; 

PPP_SCFifo xvwnkxvmpawhltrxhta33p8p8eih6o3_386 (
	.WrEnb(qoo9icreij4d6n4q7iziky_730),
	.WrData(uci8pmavtvpfh1npbdp5gf1a6z8jx_516),
	.RdEnb(adjpka6eeqpn31txxn7n7ag41_113),


	.RdVal(nniuol5tlm9xki3f5v3u75h_900), 
	.RdData(dxx1fco3zv0c80cfgi6_605), 
	.Empty(ya9axmaemfvf7acvwsv3y_38), 
	.AFull_0(fwjv0z3hxo8ny816jayy9qgl_178), 
	.Full(bjvwb42zjk5nwxdy28uhare4gjbzi_685), 

	.WrClk(clk_in_0), 

	.RdClk(clk_out_0), 

	.WrRst(rst_in_0), 
	.RdRst(rst_out_0) 
); 

defparam aljsh2nal0ks3wbsxeqnfndmfwsg_1409.DataBits = 128; 
defparam aljsh2nal0ks3wbsxeqnfndmfwsg_1409.AddrBits = 9; 
defparam aljsh2nal0ks3wbsxeqnfndmfwsg_1409.AFullAssert_0 = 10; 
defparam aljsh2nal0ks3wbsxeqnfndmfwsg_1409.AFullNegate_0 = 10; 

PPP_SCFifo aljsh2nal0ks3wbsxeqnfndmfwsg_1409 (
	.WrEnb(omcki52t0yv3q99coy8cae5scxkd8_836),
	.WrData(wr0a69smhiaro28ho7bpb1fzcjcc_613),
	.RdEnb(wfbartbfj7o1eo3wwk2bqaei5klnufxo_517),


	.RdVal(chxw8y7wlvfvdm7mfliw_524), 
	.RdData(g0huf1pckwth9ctsfuauoy4ifou47_0), 
	.Empty(nlgjeaq7b9dk8usnm_357), 
	.AFull_0(xdt2ftfr6q9pmazydcgy_70), 
	.Full(ut39zch4buzkwah2lznddilk_533), 

	.WrClk(clk_in_1), 

	.RdClk(clk_out_1), 

	.WrRst(rst_in_1), 
	.RdRst(rst_out_1) 
); 

endmodule 

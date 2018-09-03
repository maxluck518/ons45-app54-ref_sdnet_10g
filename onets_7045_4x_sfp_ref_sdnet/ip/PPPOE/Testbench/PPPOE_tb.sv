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
// Xilinx SDNet Compiler version HEAD, build 1585976
//----------------------------------------------------------------------------
/*

*/

`timescale 1 ps / 1 ps

module PPPOE_tb;


reg clk_line /* undriven */ ;
reg clk_control /* undriven */ ;
reg clk_packet /* undriven */ ;
reg clk_line_rst /* undriven */ ;
reg clk_packet_rst /* undriven */ ;
reg clk_control_rst /* undriven */ ;
reg [7:0] control_qinq_tb_S_AXI_AWADDR /* undriven */ ;
reg [0:0] control_qinq_tb_S_AXI_AWVALID /* undriven */ ;
reg [31:0] control_qinq_tb_S_AXI_WDATA /* undriven */ ;
reg [3:0] control_qinq_tb_S_AXI_WSTRB /* undriven */ ;
reg [0:0] control_qinq_tb_S_AXI_WVALID /* undriven */ ;
reg [0:0] control_qinq_tb_S_AXI_BREADY /* undriven */ ;
reg [7:0] control_qinq_tb_S_AXI_ARADDR /* undriven */ ;
reg [0:0] control_qinq_tb_S_AXI_ARVALID /* undriven */ ;
reg [0:0] control_qinq_tb_S_AXI_RREADY /* undriven */ ;
reg [7:0] control_domain_tb_S_AXI_AWADDR /* undriven */ ;
reg [0:0] control_domain_tb_S_AXI_AWVALID /* undriven */ ;
reg [31:0] control_domain_tb_S_AXI_WDATA /* undriven */ ;
reg [3:0] control_domain_tb_S_AXI_WSTRB /* undriven */ ;
reg [0:0] control_domain_tb_S_AXI_WVALID /* undriven */ ;
reg [0:0] control_domain_tb_S_AXI_BREADY /* undriven */ ;
reg [7:0] control_domain_tb_S_AXI_ARADDR /* undriven */ ;
reg [0:0] control_domain_tb_S_AXI_ARVALID /* undriven */ ;
reg [0:0] control_domain_tb_S_AXI_RREADY /* undriven */ ;
reg [7:0] control_l3_tb_S_AXI_AWADDR /* undriven */ ;
reg [0:0] control_l3_tb_S_AXI_AWVALID /* undriven */ ;
reg [31:0] control_l3_tb_S_AXI_WDATA /* undriven */ ;
reg [3:0] control_l3_tb_S_AXI_WSTRB /* undriven */ ;
reg [0:0] control_l3_tb_S_AXI_WVALID /* undriven */ ;
reg [0:0] control_l3_tb_S_AXI_BREADY /* undriven */ ;
reg [7:0] control_l3_tb_S_AXI_ARADDR /* undriven */ ;
reg [0:0] control_l3_tb_S_AXI_ARVALID /* undriven */ ;
reg [0:0] control_l3_tb_S_AXI_RREADY /* undriven */ ;
reg [7:0] control_pppL2_tb_S_AXI_AWADDR /* undriven */ ;
reg [0:0] control_pppL2_tb_S_AXI_AWVALID /* undriven */ ;
reg [31:0] control_pppL2_tb_S_AXI_WDATA /* undriven */ ;
reg [3:0] control_pppL2_tb_S_AXI_WSTRB /* undriven */ ;
reg [0:0] control_pppL2_tb_S_AXI_WVALID /* undriven */ ;
reg [0:0] control_pppL2_tb_S_AXI_BREADY /* undriven */ ;
reg [7:0] control_pppL2_tb_S_AXI_ARADDR /* undriven */ ;
reg [0:0] control_pppL2_tb_S_AXI_ARVALID /* undriven */ ;
reg [0:0] control_pppL2_tb_S_AXI_RREADY /* undriven */ ;
reg [7:0] control_extL2_tb_S_AXI_AWADDR /* undriven */ ;
reg [0:0] control_extL2_tb_S_AXI_AWVALID /* undriven */ ;
reg [31:0] control_extL2_tb_S_AXI_WDATA /* undriven */ ;
reg [3:0] control_extL2_tb_S_AXI_WSTRB /* undriven */ ;
reg [0:0] control_extL2_tb_S_AXI_WVALID /* undriven */ ;
reg [0:0] control_extL2_tb_S_AXI_BREADY /* undriven */ ;
reg [7:0] control_extL2_tb_S_AXI_ARADDR /* undriven */ ;
reg [0:0] control_extL2_tb_S_AXI_ARVALID /* undriven */ ;
reg [0:0] control_extL2_tb_S_AXI_RREADY /* undriven */ ;
wire [0:0] packet_in_instream_TVALID ;
wire [0:0] packet_in_instream_TREADY ;
wire [255:0] packet_in_instream_TDATA ;
wire [31:0] packet_in_instream_TKEEP ;
wire [0:0] packet_in_instream_TLAST ;
wire [0:0] control_qinq_tb_S_AXI_AWREADY /* unused */ ;
wire [0:0] control_qinq_tb_S_AXI_WREADY /* unused */ ;
wire [1:0] control_qinq_tb_S_AXI_BRESP /* unused */ ;
wire [0:0] control_qinq_tb_S_AXI_BVALID /* unused */ ;
wire [0:0] control_qinq_tb_S_AXI_ARREADY /* unused */ ;
wire [31:0] control_qinq_tb_S_AXI_RDATA /* unused */ ;
wire [1:0] control_qinq_tb_S_AXI_RRESP /* unused */ ;
wire [0:0] control_qinq_tb_S_AXI_RVALID /* unused */ ;
wire [0:0] control_domain_tb_S_AXI_AWREADY /* unused */ ;
wire [0:0] control_domain_tb_S_AXI_WREADY /* unused */ ;
wire [1:0] control_domain_tb_S_AXI_BRESP /* unused */ ;
wire [0:0] control_domain_tb_S_AXI_BVALID /* unused */ ;
wire [0:0] control_domain_tb_S_AXI_ARREADY /* unused */ ;
wire [31:0] control_domain_tb_S_AXI_RDATA /* unused */ ;
wire [1:0] control_domain_tb_S_AXI_RRESP /* unused */ ;
wire [0:0] control_domain_tb_S_AXI_RVALID /* unused */ ;
wire [0:0] control_l3_tb_S_AXI_AWREADY /* unused */ ;
wire [0:0] control_l3_tb_S_AXI_WREADY /* unused */ ;
wire [1:0] control_l3_tb_S_AXI_BRESP /* unused */ ;
wire [0:0] control_l3_tb_S_AXI_BVALID /* unused */ ;
wire [0:0] control_l3_tb_S_AXI_ARREADY /* unused */ ;
wire [31:0] control_l3_tb_S_AXI_RDATA /* unused */ ;
wire [1:0] control_l3_tb_S_AXI_RRESP /* unused */ ;
wire [0:0] control_l3_tb_S_AXI_RVALID /* unused */ ;
wire [0:0] control_pppL2_tb_S_AXI_AWREADY /* unused */ ;
wire [0:0] control_pppL2_tb_S_AXI_WREADY /* unused */ ;
wire [1:0] control_pppL2_tb_S_AXI_BRESP /* unused */ ;
wire [0:0] control_pppL2_tb_S_AXI_BVALID /* unused */ ;
wire [0:0] control_pppL2_tb_S_AXI_ARREADY /* unused */ ;
wire [31:0] control_pppL2_tb_S_AXI_RDATA /* unused */ ;
wire [1:0] control_pppL2_tb_S_AXI_RRESP /* unused */ ;
wire [0:0] control_pppL2_tb_S_AXI_RVALID /* unused */ ;
wire [0:0] control_extL2_tb_S_AXI_AWREADY /* unused */ ;
wire [0:0] control_extL2_tb_S_AXI_WREADY /* unused */ ;
wire [1:0] control_extL2_tb_S_AXI_BRESP /* unused */ ;
wire [0:0] control_extL2_tb_S_AXI_BVALID /* unused */ ;
wire [0:0] control_extL2_tb_S_AXI_ARREADY /* unused */ ;
wire [31:0] control_extL2_tb_S_AXI_RDATA /* unused */ ;
wire [1:0] control_extL2_tb_S_AXI_RRESP /* unused */ ;
wire [0:0] control_extL2_tb_S_AXI_RVALID /* unused */ ;
wire [0:0] enable_processing ;
wire [0:0] packet_out_outstream_TVALID ;
wire [0:0] packet_out_outstream_TREADY ;
wire [255:0] packet_out_outstream_TDATA ;
wire [31:0] packet_out_outstream_TKEEP ;
wire [0:0] packet_out_outstream_TLAST ;
wire [0:0] tuple_out_flowstream_VALID ;
wire [127:0] tuple_out_flowstream_DATA ;
wire [0:0] internal_rst_done /* unused */ ;
reg fw_done /* undriven */ ;
reg file_done /* undriven */ ;
wire stim_eof ;
wire tuple_in_valid /* unused */ ;
wire check_eof ;
wire tuple_out_valid ;
wire packet_out_avail /* unused */ ;
reg [31:0] idleCount ;

// black box
PPPOE
PPPOE_i
(
	.packet_in_instream_TVALID	( packet_in_instream_TVALID ),
	.packet_in_instream_TREADY	( packet_in_instream_TREADY ),
	.packet_in_instream_TDATA	( packet_in_instream_TDATA ),
	.packet_in_instream_TKEEP	( packet_in_instream_TKEEP ),
	.packet_in_instream_TLAST	( packet_in_instream_TLAST ),
	.control_qinq_tb_S_AXI_AWADDR	( control_qinq_tb_S_AXI_AWADDR ),
	.control_qinq_tb_S_AXI_AWVALID	( control_qinq_tb_S_AXI_AWVALID ),
	.control_qinq_tb_S_AXI_AWREADY	( control_qinq_tb_S_AXI_AWREADY ),
	.control_qinq_tb_S_AXI_WDATA	( control_qinq_tb_S_AXI_WDATA ),
	.control_qinq_tb_S_AXI_WSTRB	( control_qinq_tb_S_AXI_WSTRB ),
	.control_qinq_tb_S_AXI_WVALID	( control_qinq_tb_S_AXI_WVALID ),
	.control_qinq_tb_S_AXI_WREADY	( control_qinq_tb_S_AXI_WREADY ),
	.control_qinq_tb_S_AXI_BRESP	( control_qinq_tb_S_AXI_BRESP ),
	.control_qinq_tb_S_AXI_BVALID	( control_qinq_tb_S_AXI_BVALID ),
	.control_qinq_tb_S_AXI_BREADY	( control_qinq_tb_S_AXI_BREADY ),
	.control_qinq_tb_S_AXI_ARADDR	( control_qinq_tb_S_AXI_ARADDR ),
	.control_qinq_tb_S_AXI_ARVALID	( control_qinq_tb_S_AXI_ARVALID ),
	.control_qinq_tb_S_AXI_ARREADY	( control_qinq_tb_S_AXI_ARREADY ),
	.control_qinq_tb_S_AXI_RDATA	( control_qinq_tb_S_AXI_RDATA ),
	.control_qinq_tb_S_AXI_RRESP	( control_qinq_tb_S_AXI_RRESP ),
	.control_qinq_tb_S_AXI_RVALID	( control_qinq_tb_S_AXI_RVALID ),
	.control_qinq_tb_S_AXI_RREADY	( control_qinq_tb_S_AXI_RREADY ),
	.control_domain_tb_S_AXI_AWADDR	( control_domain_tb_S_AXI_AWADDR ),
	.control_domain_tb_S_AXI_AWVALID	( control_domain_tb_S_AXI_AWVALID ),
	.control_domain_tb_S_AXI_AWREADY	( control_domain_tb_S_AXI_AWREADY ),
	.control_domain_tb_S_AXI_WDATA	( control_domain_tb_S_AXI_WDATA ),
	.control_domain_tb_S_AXI_WSTRB	( control_domain_tb_S_AXI_WSTRB ),
	.control_domain_tb_S_AXI_WVALID	( control_domain_tb_S_AXI_WVALID ),
	.control_domain_tb_S_AXI_WREADY	( control_domain_tb_S_AXI_WREADY ),
	.control_domain_tb_S_AXI_BRESP	( control_domain_tb_S_AXI_BRESP ),
	.control_domain_tb_S_AXI_BVALID	( control_domain_tb_S_AXI_BVALID ),
	.control_domain_tb_S_AXI_BREADY	( control_domain_tb_S_AXI_BREADY ),
	.control_domain_tb_S_AXI_ARADDR	( control_domain_tb_S_AXI_ARADDR ),
	.control_domain_tb_S_AXI_ARVALID	( control_domain_tb_S_AXI_ARVALID ),
	.control_domain_tb_S_AXI_ARREADY	( control_domain_tb_S_AXI_ARREADY ),
	.control_domain_tb_S_AXI_RDATA	( control_domain_tb_S_AXI_RDATA ),
	.control_domain_tb_S_AXI_RRESP	( control_domain_tb_S_AXI_RRESP ),
	.control_domain_tb_S_AXI_RVALID	( control_domain_tb_S_AXI_RVALID ),
	.control_domain_tb_S_AXI_RREADY	( control_domain_tb_S_AXI_RREADY ),
	.control_l3_tb_S_AXI_AWADDR	( control_l3_tb_S_AXI_AWADDR ),
	.control_l3_tb_S_AXI_AWVALID	( control_l3_tb_S_AXI_AWVALID ),
	.control_l3_tb_S_AXI_AWREADY	( control_l3_tb_S_AXI_AWREADY ),
	.control_l3_tb_S_AXI_WDATA	( control_l3_tb_S_AXI_WDATA ),
	.control_l3_tb_S_AXI_WSTRB	( control_l3_tb_S_AXI_WSTRB ),
	.control_l3_tb_S_AXI_WVALID	( control_l3_tb_S_AXI_WVALID ),
	.control_l3_tb_S_AXI_WREADY	( control_l3_tb_S_AXI_WREADY ),
	.control_l3_tb_S_AXI_BRESP	( control_l3_tb_S_AXI_BRESP ),
	.control_l3_tb_S_AXI_BVALID	( control_l3_tb_S_AXI_BVALID ),
	.control_l3_tb_S_AXI_BREADY	( control_l3_tb_S_AXI_BREADY ),
	.control_l3_tb_S_AXI_ARADDR	( control_l3_tb_S_AXI_ARADDR ),
	.control_l3_tb_S_AXI_ARVALID	( control_l3_tb_S_AXI_ARVALID ),
	.control_l3_tb_S_AXI_ARREADY	( control_l3_tb_S_AXI_ARREADY ),
	.control_l3_tb_S_AXI_RDATA	( control_l3_tb_S_AXI_RDATA ),
	.control_l3_tb_S_AXI_RRESP	( control_l3_tb_S_AXI_RRESP ),
	.control_l3_tb_S_AXI_RVALID	( control_l3_tb_S_AXI_RVALID ),
	.control_l3_tb_S_AXI_RREADY	( control_l3_tb_S_AXI_RREADY ),
	.control_pppL2_tb_S_AXI_AWADDR	( control_pppL2_tb_S_AXI_AWADDR ),
	.control_pppL2_tb_S_AXI_AWVALID	( control_pppL2_tb_S_AXI_AWVALID ),
	.control_pppL2_tb_S_AXI_AWREADY	( control_pppL2_tb_S_AXI_AWREADY ),
	.control_pppL2_tb_S_AXI_WDATA	( control_pppL2_tb_S_AXI_WDATA ),
	.control_pppL2_tb_S_AXI_WSTRB	( control_pppL2_tb_S_AXI_WSTRB ),
	.control_pppL2_tb_S_AXI_WVALID	( control_pppL2_tb_S_AXI_WVALID ),
	.control_pppL2_tb_S_AXI_WREADY	( control_pppL2_tb_S_AXI_WREADY ),
	.control_pppL2_tb_S_AXI_BRESP	( control_pppL2_tb_S_AXI_BRESP ),
	.control_pppL2_tb_S_AXI_BVALID	( control_pppL2_tb_S_AXI_BVALID ),
	.control_pppL2_tb_S_AXI_BREADY	( control_pppL2_tb_S_AXI_BREADY ),
	.control_pppL2_tb_S_AXI_ARADDR	( control_pppL2_tb_S_AXI_ARADDR ),
	.control_pppL2_tb_S_AXI_ARVALID	( control_pppL2_tb_S_AXI_ARVALID ),
	.control_pppL2_tb_S_AXI_ARREADY	( control_pppL2_tb_S_AXI_ARREADY ),
	.control_pppL2_tb_S_AXI_RDATA	( control_pppL2_tb_S_AXI_RDATA ),
	.control_pppL2_tb_S_AXI_RRESP	( control_pppL2_tb_S_AXI_RRESP ),
	.control_pppL2_tb_S_AXI_RVALID	( control_pppL2_tb_S_AXI_RVALID ),
	.control_pppL2_tb_S_AXI_RREADY	( control_pppL2_tb_S_AXI_RREADY ),
	.control_extL2_tb_S_AXI_AWADDR	( control_extL2_tb_S_AXI_AWADDR ),
	.control_extL2_tb_S_AXI_AWVALID	( control_extL2_tb_S_AXI_AWVALID ),
	.control_extL2_tb_S_AXI_AWREADY	( control_extL2_tb_S_AXI_AWREADY ),
	.control_extL2_tb_S_AXI_WDATA	( control_extL2_tb_S_AXI_WDATA ),
	.control_extL2_tb_S_AXI_WSTRB	( control_extL2_tb_S_AXI_WSTRB ),
	.control_extL2_tb_S_AXI_WVALID	( control_extL2_tb_S_AXI_WVALID ),
	.control_extL2_tb_S_AXI_WREADY	( control_extL2_tb_S_AXI_WREADY ),
	.control_extL2_tb_S_AXI_BRESP	( control_extL2_tb_S_AXI_BRESP ),
	.control_extL2_tb_S_AXI_BVALID	( control_extL2_tb_S_AXI_BVALID ),
	.control_extL2_tb_S_AXI_BREADY	( control_extL2_tb_S_AXI_BREADY ),
	.control_extL2_tb_S_AXI_ARADDR	( control_extL2_tb_S_AXI_ARADDR ),
	.control_extL2_tb_S_AXI_ARVALID	( control_extL2_tb_S_AXI_ARVALID ),
	.control_extL2_tb_S_AXI_ARREADY	( control_extL2_tb_S_AXI_ARREADY ),
	.control_extL2_tb_S_AXI_RDATA	( control_extL2_tb_S_AXI_RDATA ),
	.control_extL2_tb_S_AXI_RRESP	( control_extL2_tb_S_AXI_RRESP ),
	.control_extL2_tb_S_AXI_RVALID	( control_extL2_tb_S_AXI_RVALID ),
	.control_extL2_tb_S_AXI_RREADY	( control_extL2_tb_S_AXI_RREADY ),
	.enable_processing   	( enable_processing ),
	.packet_out_outstream_TVALID	( packet_out_outstream_TVALID ),
	.packet_out_outstream_TREADY	( packet_out_outstream_TREADY ),
	.packet_out_outstream_TDATA	( packet_out_outstream_TDATA ),
	.packet_out_outstream_TKEEP	( packet_out_outstream_TKEEP ),
	.packet_out_outstream_TLAST	( packet_out_outstream_TLAST ),
	.tuple_out_flowstream_VALID	( tuple_out_flowstream_VALID ),
	.tuple_out_flowstream_DATA	( tuple_out_flowstream_DATA ),
	.clk_line_rst        	( clk_line_rst ),
	.clk_line            	( clk_line ),
	.clk_packet_rst      	( clk_packet_rst ),
	.clk_packet          	( clk_packet ),
	.clk_control_rst     	( clk_control_rst ),
	.clk_control         	( clk_control ),
	.internal_rst_done   	( internal_rst_done )
);

assign packet_out_outstream_TREADY = 1'd1 ;

assign enable_processing = 1'd1 ;

TB_System_Stim
TB_System_Stim_i
(
	.clk_n               	( clk_line ),
	.rst                 	( clk_line_rst ),
	.fw_done             	( fw_done ),
	.file_done           	( file_done ),
	.stim_eof            	( stim_eof ),
	.tuple_in_valid      	( tuple_in_valid ),
	.packet_in_instream_TREADY	( packet_in_instream_TREADY ),
	.packet_in_instream_TVALID	( packet_in_instream_TVALID ),
	.packet_in_instream_TLAST	( packet_in_instream_TLAST ),
	.packet_in_instream_TKEEP	( packet_in_instream_TKEEP ),
	.packet_in_instream_TDATA	( packet_in_instream_TDATA )
);

Check
TB_System_Check_i
(
	.packet_out_tvalid   	( packet_out_outstream_TVALID ),
	.packet_out_tlast    	( packet_out_outstream_TLAST ),
	.packet_out_tkeep    	( packet_out_outstream_TKEEP ),
	.packet_out_tdata    	( packet_out_outstream_TDATA ),
	.tuple_out_flowstream	( tuple_out_flowstream_DATA ),
	.clk_n               	( clk_line ),
	.rst                 	( clk_line_rst ),
	.file_done           	( file_done ),
	.fw_done             	( fw_done ),
	.check_eof           	( check_eof ),
	.tuple_out_valid     	( tuple_out_valid ),
	.packet_out_avail    	( packet_out_avail )
);

assign tuple_out_valid = tuple_out_flowstream_VALID ;

always @( posedge clk_line ) begin
	if ( ( clk_line_rst | ( packet_out_outstream_TLAST && packet_out_outstream_TVALID ) ) ) begin
		idleCount <= 0 ;
	end
	else  begin
		idleCount <= ( idleCount + 1 ) ;
	end
	if ( ( ( ( ( idleCount == 1000 ) && file_done ) && fw_done ) && stim_eof ) ) begin
		$display("[%0t]  INFO: stopping simulation after 1000 idle cycles", $time);
		if ( check_eof ) begin
			$display("[%0t]  INFO: all expected data successfully received", $time);
			$display("[%0t]  INFO: TEST PASSED", $time);
		end
		else  begin
			$display("[%0t] ERROR: some expected data not received", $time);
			$display("[%0t] ERROR: TEST FAILED", $time);
		end
		$finish(1);
	end
end



always begin 
  #(3333 / 2) clk_line =  0; 
  #(3333 / 2) clk_line =  1; 
end


always begin 
  #(10000 / 2) clk_control =  0; 
  #(10000 / 2) clk_control =  1; 
end


always begin 
  #(6666 / 2) clk_packet =  0; 
  #(6666 / 2) clk_packet =  1; 
end


initial begin 
clk_line_rst = 1; 
#1000000 clk_line_rst = 0; 
end 


initial begin 
clk_packet_rst = 1; 
#1000000 clk_packet_rst = 0; 
end 


initial begin 
clk_control_rst = 1; 
#1000000 clk_control_rst = 0; 
end 



reg [31:0] read_data;
reg [1:0] read_resp;
reg [1:0] bresp;





import "DPI-C" context function  void TCAM_Init(input int tableID,input int k,input int v,input int depth,input int n_range,input int range_size,input int range_offset);
import "DPI-C" context task  TCAM_Clean(input int tableID);
import "DPI-C" context function  int TCAM_GetAddrSize();
import "DPI-C" context function  int TCAM_SetLogLevel(input int tableID,input int msg_level);
import "DPI-C" context task  TCAM_WriteEntry(input int tableID,input int addr,string data,string mask,string value);
import "DPI-C" context task  TCAM_EraseEntry(input int tableID,input int addr);
import "DPI-C" context task  TCAM_VerifyEntry(input int tableID,input int addr,string data,string mask,string value,output int error_code);
import "DPI-C" context function  string TCAM_Error_Description(input int error);
export "DPI-C" task SV_read_control_qinq_tb;
export "DPI-C" task SV_write_control_qinq_tb;
export "DPI-C" task SV_read_control_domain_tb;
export "DPI-C" task SV_write_control_domain_tb;
export "DPI-C" task SV_read_control_l3_tb;
export "DPI-C" task SV_write_control_l3_tb;
export "DPI-C" task SV_read_control_pppL2_tb;
export "DPI-C" task SV_write_control_pppL2_tb;
export "DPI-C" task SV_read_control_extL2_tb;
export "DPI-C" task SV_write_control_extL2_tb;






task SV_write_control_qinq_tb(
    input  integer  addr,
    input  integer  data
);
$display("SV_write_control_qinq_tb()- start");
axi4_lite_master_write_request_control_qinq_tb(addr,data);
$display("SV_write_control_qinq_tb()- done");
endtask

task SV_read_control_qinq_tb(
    input   integer addr,
    output  integer  data
);
$display("SV_read_control_qinq_tb()- start");
axi4_lite_master_read_request_control_qinq_tb(addr,data);
$display("SV_read_control_qinq_tb()- done");
endtask

task  axi4_lite_master_write_request_control_qinq_tb(input integer addr,input integer data);
    @ (posedge clk_control);
        control_qinq_tb_S_AXI_AWADDR  <= addr  ;
        control_qinq_tb_S_AXI_AWVALID <= 1'b1;
        control_qinq_tb_S_AXI_WDATA   <= data   ;
        control_qinq_tb_S_AXI_WVALID  <= 1'b1  ;
        control_qinq_tb_S_AXI_WSTRB   <= '1   ;
        fork
            begin
                wait(control_qinq_tb_S_AXI_AWREADY);
                @ (posedge clk_control);
                control_qinq_tb_S_AXI_AWVALID <= 1'b0;
            end
            begin
                wait(control_qinq_tb_S_AXI_WREADY);
                @ (posedge clk_control);
                control_qinq_tb_S_AXI_WVALID <= 1'b0;
                control_qinq_tb_S_AXI_BREADY <= 1'b1;
                wait(control_qinq_tb_S_AXI_BVALID);          
                bresp  <= control_qinq_tb_S_AXI_BRESP;
                @ (posedge clk_control);
                control_qinq_tb_S_AXI_BREADY <= 1'b0;
                wait(~control_qinq_tb_S_AXI_BVALID);
            end         
        join
endtask: axi4_lite_master_write_request_control_qinq_tb


task  axi4_lite_master_read_request_control_qinq_tb(input integer addr,output integer data);
    @ (posedge clk_control);
        control_qinq_tb_S_AXI_ARADDR  <= addr;
        control_qinq_tb_S_AXI_ARVALID <= 1'b1;
        control_qinq_tb_S_AXI_RREADY <= 1'b1;
        begin
            wait(control_qinq_tb_S_AXI_RVALID);
            read_resp  <= control_qinq_tb_S_AXI_RRESP;
            data  <= control_qinq_tb_S_AXI_RDATA;
            @ (posedge clk_control);
            control_qinq_tb_S_AXI_ARVALID    <= 1'b0;
            wait(~control_qinq_tb_S_AXI_RVALID);
        end
endtask: axi4_lite_master_read_request_control_qinq_tb

task SV_write_control_domain_tb(
    input  integer  addr,
    input  integer  data
);
$display("SV_write_control_domain_tb()- start");
axi4_lite_master_write_request_control_domain_tb(addr,data);
$display("SV_write_control_domain_tb()- done");
endtask

task SV_read_control_domain_tb(
    input   integer addr,
    output  integer  data
);
$display("SV_read_control_domain_tb()- start");
axi4_lite_master_read_request_control_domain_tb(addr,data);
$display("SV_read_control_domain_tb()- done");
endtask

task  axi4_lite_master_write_request_control_domain_tb(input integer addr,input integer data);
    @ (posedge clk_control);
        control_domain_tb_S_AXI_AWADDR  <= addr  ;
        control_domain_tb_S_AXI_AWVALID <= 1'b1;
        control_domain_tb_S_AXI_WDATA   <= data   ;
        control_domain_tb_S_AXI_WVALID  <= 1'b1  ;
        control_domain_tb_S_AXI_WSTRB   <= '1   ;
        fork
            begin
                wait(control_domain_tb_S_AXI_AWREADY);
                @ (posedge clk_control);
                control_domain_tb_S_AXI_AWVALID <= 1'b0;
            end
            begin
                wait(control_domain_tb_S_AXI_WREADY);
                @ (posedge clk_control);
                control_domain_tb_S_AXI_WVALID <= 1'b0;
                control_domain_tb_S_AXI_BREADY <= 1'b1;
                wait(control_domain_tb_S_AXI_BVALID);          
                bresp  <= control_domain_tb_S_AXI_BRESP;
                @ (posedge clk_control);
                control_domain_tb_S_AXI_BREADY <= 1'b0;
                wait(~control_domain_tb_S_AXI_BVALID);
            end         
        join
endtask: axi4_lite_master_write_request_control_domain_tb


task  axi4_lite_master_read_request_control_domain_tb(input integer addr,output integer data);
    @ (posedge clk_control);
        control_domain_tb_S_AXI_ARADDR  <= addr;
        control_domain_tb_S_AXI_ARVALID <= 1'b1;
        control_domain_tb_S_AXI_RREADY <= 1'b1;
        begin
            wait(control_domain_tb_S_AXI_RVALID);
            read_resp  <= control_domain_tb_S_AXI_RRESP;
            data  <= control_domain_tb_S_AXI_RDATA;
            @ (posedge clk_control);
            control_domain_tb_S_AXI_ARVALID    <= 1'b0;
            wait(~control_domain_tb_S_AXI_RVALID);
        end
endtask: axi4_lite_master_read_request_control_domain_tb

task SV_write_control_l3_tb(
    input  integer  addr,
    input  integer  data
);
$display("SV_write_control_l3_tb()- start");
axi4_lite_master_write_request_control_l3_tb(addr,data);
$display("SV_write_control_l3_tb()- done");
endtask

task SV_read_control_l3_tb(
    input   integer addr,
    output  integer  data
);
$display("SV_read_control_l3_tb()- start");
axi4_lite_master_read_request_control_l3_tb(addr,data);
$display("SV_read_control_l3_tb()- done");
endtask

task  axi4_lite_master_write_request_control_l3_tb(input integer addr,input integer data);
    @ (posedge clk_control);
        control_l3_tb_S_AXI_AWADDR  <= addr  ;
        control_l3_tb_S_AXI_AWVALID <= 1'b1;
        control_l3_tb_S_AXI_WDATA   <= data   ;
        control_l3_tb_S_AXI_WVALID  <= 1'b1  ;
        control_l3_tb_S_AXI_WSTRB   <= '1   ;
        fork
            begin
                wait(control_l3_tb_S_AXI_AWREADY);
                @ (posedge clk_control);
                control_l3_tb_S_AXI_AWVALID <= 1'b0;
            end
            begin
                wait(control_l3_tb_S_AXI_WREADY);
                @ (posedge clk_control);
                control_l3_tb_S_AXI_WVALID <= 1'b0;
                control_l3_tb_S_AXI_BREADY <= 1'b1;
                wait(control_l3_tb_S_AXI_BVALID);          
                bresp  <= control_l3_tb_S_AXI_BRESP;
                @ (posedge clk_control);
                control_l3_tb_S_AXI_BREADY <= 1'b0;
                wait(~control_l3_tb_S_AXI_BVALID);
            end         
        join
endtask: axi4_lite_master_write_request_control_l3_tb


task  axi4_lite_master_read_request_control_l3_tb(input integer addr,output integer data);
    @ (posedge clk_control);
        control_l3_tb_S_AXI_ARADDR  <= addr;
        control_l3_tb_S_AXI_ARVALID <= 1'b1;
        control_l3_tb_S_AXI_RREADY <= 1'b1;
        begin
            wait(control_l3_tb_S_AXI_RVALID);
            read_resp  <= control_l3_tb_S_AXI_RRESP;
            data  <= control_l3_tb_S_AXI_RDATA;
            @ (posedge clk_control);
            control_l3_tb_S_AXI_ARVALID    <= 1'b0;
            wait(~control_l3_tb_S_AXI_RVALID);
        end
endtask: axi4_lite_master_read_request_control_l3_tb

task SV_write_control_pppL2_tb(
    input  integer  addr,
    input  integer  data
);
$display("SV_write_control_pppL2_tb()- start");
axi4_lite_master_write_request_control_pppL2_tb(addr,data);
$display("SV_write_control_pppL2_tb()- done");
endtask

task SV_read_control_pppL2_tb(
    input   integer addr,
    output  integer  data
);
$display("SV_read_control_pppL2_tb()- start");
axi4_lite_master_read_request_control_pppL2_tb(addr,data);
$display("SV_read_control_pppL2_tb()- done");
endtask

task  axi4_lite_master_write_request_control_pppL2_tb(input integer addr,input integer data);
    @ (posedge clk_control);
        control_pppL2_tb_S_AXI_AWADDR  <= addr  ;
        control_pppL2_tb_S_AXI_AWVALID <= 1'b1;
        control_pppL2_tb_S_AXI_WDATA   <= data   ;
        control_pppL2_tb_S_AXI_WVALID  <= 1'b1  ;
        control_pppL2_tb_S_AXI_WSTRB   <= '1   ;
        fork
            begin
                wait(control_pppL2_tb_S_AXI_AWREADY);
                @ (posedge clk_control);
                control_pppL2_tb_S_AXI_AWVALID <= 1'b0;
            end
            begin
                wait(control_pppL2_tb_S_AXI_WREADY);
                @ (posedge clk_control);
                control_pppL2_tb_S_AXI_WVALID <= 1'b0;
                control_pppL2_tb_S_AXI_BREADY <= 1'b1;
                wait(control_pppL2_tb_S_AXI_BVALID);          
                bresp  <= control_pppL2_tb_S_AXI_BRESP;
                @ (posedge clk_control);
                control_pppL2_tb_S_AXI_BREADY <= 1'b0;
                wait(~control_pppL2_tb_S_AXI_BVALID);
            end         
        join
endtask: axi4_lite_master_write_request_control_pppL2_tb


task  axi4_lite_master_read_request_control_pppL2_tb(input integer addr,output integer data);
    @ (posedge clk_control);
        control_pppL2_tb_S_AXI_ARADDR  <= addr;
        control_pppL2_tb_S_AXI_ARVALID <= 1'b1;
        control_pppL2_tb_S_AXI_RREADY <= 1'b1;
        begin
            wait(control_pppL2_tb_S_AXI_RVALID);
            read_resp  <= control_pppL2_tb_S_AXI_RRESP;
            data  <= control_pppL2_tb_S_AXI_RDATA;
            @ (posedge clk_control);
            control_pppL2_tb_S_AXI_ARVALID    <= 1'b0;
            wait(~control_pppL2_tb_S_AXI_RVALID);
        end
endtask: axi4_lite_master_read_request_control_pppL2_tb

task SV_write_control_extL2_tb(
    input  integer  addr,
    input  integer  data
);
$display("SV_write_control_extL2_tb()- start");
axi4_lite_master_write_request_control_extL2_tb(addr,data);
$display("SV_write_control_extL2_tb()- done");
endtask

task SV_read_control_extL2_tb(
    input   integer addr,
    output  integer  data
);
$display("SV_read_control_extL2_tb()- start");
axi4_lite_master_read_request_control_extL2_tb(addr,data);
$display("SV_read_control_extL2_tb()- done");
endtask

task  axi4_lite_master_write_request_control_extL2_tb(input integer addr,input integer data);
    @ (posedge clk_control);
        control_extL2_tb_S_AXI_AWADDR  <= addr  ;
        control_extL2_tb_S_AXI_AWVALID <= 1'b1;
        control_extL2_tb_S_AXI_WDATA   <= data   ;
        control_extL2_tb_S_AXI_WVALID  <= 1'b1  ;
        control_extL2_tb_S_AXI_WSTRB   <= '1   ;
        fork
            begin
                wait(control_extL2_tb_S_AXI_AWREADY);
                @ (posedge clk_control);
                control_extL2_tb_S_AXI_AWVALID <= 1'b0;
            end
            begin
                wait(control_extL2_tb_S_AXI_WREADY);
                @ (posedge clk_control);
                control_extL2_tb_S_AXI_WVALID <= 1'b0;
                control_extL2_tb_S_AXI_BREADY <= 1'b1;
                wait(control_extL2_tb_S_AXI_BVALID);          
                bresp  <= control_extL2_tb_S_AXI_BRESP;
                @ (posedge clk_control);
                control_extL2_tb_S_AXI_BREADY <= 1'b0;
                wait(~control_extL2_tb_S_AXI_BVALID);
            end         
        join
endtask: axi4_lite_master_write_request_control_extL2_tb


task  axi4_lite_master_read_request_control_extL2_tb(input integer addr,output integer data);
    @ (posedge clk_control);
        control_extL2_tb_S_AXI_ARADDR  <= addr;
        control_extL2_tb_S_AXI_ARVALID <= 1'b1;
        control_extL2_tb_S_AXI_RREADY <= 1'b1;
        begin
            wait(control_extL2_tb_S_AXI_RVALID);
            read_resp  <= control_extL2_tb_S_AXI_RRESP;
            data  <= control_extL2_tb_S_AXI_RDATA;
            @ (posedge clk_control);
            control_extL2_tb_S_AXI_ARVALID    <= 1'b0;
            wait(~control_extL2_tb_S_AXI_RVALID);
        end
endtask: axi4_lite_master_read_request_control_extL2_tb




////////////// Update from file/////////////////
task update_qinq_tb_from_file(input string file_name);
    integer fileid;
    integer count; 
    string  line; 
    integer index;
    string key[];
    int address[];
    string mask[];
    string value[];
    string temp_key;
    int temp_address;
    string temp_value;
    string temp_mask;

    fileid = $fopen(file_name, "r"); 
    if (fileid == 0) begin
        $display($sformatf("failed to open %s file",file_name));
        $finish;
    end
    index = 0;
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", temp_address,temp_mask, temp_key,temp_value);
                // parse string
                if (count != 4) begin
                    $display("error in %s:%d : invalid format of string %s, expected address(dec) key(hex) mask(hex) value(hex)\n", file_name, index, line);
                    $finish;
                end
                index = index + 1;
            end
        end
    end
    $fclose(fileid);
    key = new[index];
    mask = new[index];
    address = new[index];
    value = new[index];
    
    index = 0;
    fileid = $fopen(file_name, "r"); 
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", address[index],key[index],mask[index],value[index]);
                index = index + 1;
            end
        end        
    end
    $fclose(fileid);
    for (int i=0;i <index;i++)  begin
        $display("TCAM UPDATE %d: ADDRESS(dec) = %d KEY(hex) = %s MASK(hex) = %s VALUE(hex) = %s\n",i,address[i],key[i],mask[i],value[i]);
        TCAM_WriteEntry (0, address[i], key[i], mask[i], value[i]);
    end
endtask :  update_qinq_tb_from_file


////////////// Update from file/////////////////
task update_domain_tb_from_file(input string file_name);
    integer fileid;
    integer count; 
    string  line; 
    integer index;
    string key[];
    int address[];
    string mask[];
    string value[];
    string temp_key;
    int temp_address;
    string temp_value;
    string temp_mask;

    fileid = $fopen(file_name, "r"); 
    if (fileid == 0) begin
        $display($sformatf("failed to open %s file",file_name));
        $finish;
    end
    index = 0;
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", temp_address,temp_mask, temp_key,temp_value);
                // parse string
                if (count != 4) begin
                    $display("error in %s:%d : invalid format of string %s, expected address(dec) key(hex) mask(hex) value(hex)\n", file_name, index, line);
                    $finish;
                end
                index = index + 1;
            end
        end
    end
    $fclose(fileid);
    key = new[index];
    mask = new[index];
    address = new[index];
    value = new[index];
    
    index = 0;
    fileid = $fopen(file_name, "r"); 
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", address[index],key[index],mask[index],value[index]);
                index = index + 1;
            end
        end        
    end
    $fclose(fileid);
    for (int i=0;i <index;i++)  begin
        $display("TCAM UPDATE %d: ADDRESS(dec) = %d KEY(hex) = %s MASK(hex) = %s VALUE(hex) = %s\n",i,address[i],key[i],mask[i],value[i]);
        TCAM_WriteEntry (1, address[i], key[i], mask[i], value[i]);
    end
endtask :  update_domain_tb_from_file


////////////// Update from file/////////////////
task update_l3_tb_from_file(input string file_name);
    integer fileid;
    integer count; 
    string  line; 
    integer index;
    string key[];
    int address[];
    string mask[];
    string value[];
    string temp_key;
    int temp_address;
    string temp_value;
    string temp_mask;

    fileid = $fopen(file_name, "r"); 
    if (fileid == 0) begin
        $display($sformatf("failed to open %s file",file_name));
        $finish;
    end
    index = 0;
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", temp_address,temp_mask, temp_key,temp_value);
                // parse string
                if (count != 4) begin
                    $display("error in %s:%d : invalid format of string %s, expected address(dec) key(hex) mask(hex) value(hex)\n", file_name, index, line);
                    $finish;
                end
                index = index + 1;
            end
        end
    end
    $fclose(fileid);
    key = new[index];
    mask = new[index];
    address = new[index];
    value = new[index];
    
    index = 0;
    fileid = $fopen(file_name, "r"); 
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", address[index],key[index],mask[index],value[index]);
                index = index + 1;
            end
        end        
    end
    $fclose(fileid);
    for (int i=0;i <index;i++)  begin
        $display("TCAM UPDATE %d: ADDRESS(dec) = %d KEY(hex) = %s MASK(hex) = %s VALUE(hex) = %s\n",i,address[i],key[i],mask[i],value[i]);
        TCAM_WriteEntry (2, address[i], key[i], mask[i], value[i]);
    end
endtask :  update_l3_tb_from_file


////////////// Update from file/////////////////
task update_pppL2_tb_from_file(input string file_name);
    integer fileid;
    integer count; 
    string  line; 
    integer index;
    string key[];
    int address[];
    string mask[];
    string value[];
    string temp_key;
    int temp_address;
    string temp_value;
    string temp_mask;

    fileid = $fopen(file_name, "r"); 
    if (fileid == 0) begin
        $display($sformatf("failed to open %s file",file_name));
        $finish;
    end
    index = 0;
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", temp_address,temp_mask, temp_key,temp_value);
                // parse string
                if (count != 4) begin
                    $display("error in %s:%d : invalid format of string %s, expected address(dec) key(hex) mask(hex) value(hex)\n", file_name, index, line);
                    $finish;
                end
                index = index + 1;
            end
        end
    end
    $fclose(fileid);
    key = new[index];
    mask = new[index];
    address = new[index];
    value = new[index];
    
    index = 0;
    fileid = $fopen(file_name, "r"); 
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", address[index],key[index],mask[index],value[index]);
                index = index + 1;
            end
        end        
    end
    $fclose(fileid);
    for (int i=0;i <index;i++)  begin
        $display("TCAM UPDATE %d: ADDRESS(dec) = %d KEY(hex) = %s MASK(hex) = %s VALUE(hex) = %s\n",i,address[i],key[i],mask[i],value[i]);
        TCAM_WriteEntry (3, address[i], key[i], mask[i], value[i]);
    end
endtask :  update_pppL2_tb_from_file


////////////// Update from file/////////////////
task update_extL2_tb_from_file(input string file_name);
    integer fileid;
    integer count; 
    string  line; 
    integer index;
    string key[];
    int address[];
    string mask[];
    string value[];
    string temp_key;
    int temp_address;
    string temp_value;
    string temp_mask;

    fileid = $fopen(file_name, "r"); 
    if (fileid == 0) begin
        $display($sformatf("failed to open %s file",file_name));
        $finish;
    end
    index = 0;
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", temp_address,temp_mask, temp_key,temp_value);
                // parse string
                if (count != 4) begin
                    $display("error in %s:%d : invalid format of string %s, expected address(dec) key(hex) mask(hex) value(hex)\n", file_name, index, line);
                    $finish;
                end
                index = index + 1;
            end
        end
    end
    $fclose(fileid);
    key = new[index];
    mask = new[index];
    address = new[index];
    value = new[index];
    
    index = 0;
    fileid = $fopen(file_name, "r"); 
    while(!$feof(fileid)) begin
        if($fgets(line, fileid)) begin
            if (line[0] != "#") begin //not a commented line
                count = $sscanf(line, "%d %s %s %s", address[index],key[index],mask[index],value[index]);
                index = index + 1;
            end
        end        
    end
    $fclose(fileid);
    for (int i=0;i <index;i++)  begin
        $display("TCAM UPDATE %d: ADDRESS(dec) = %d KEY(hex) = %s MASK(hex) = %s VALUE(hex) = %s\n",i,address[i],key[i],mask[i],value[i]);
        TCAM_WriteEntry (4, address[i], key[i], mask[i], value[i]);
    end
endtask :  update_extL2_tb_from_file





initial begin
    control_qinq_tb_S_AXI_AWADDR <= '0;
    control_qinq_tb_S_AXI_AWVALID <= 1'b0;
    control_qinq_tb_S_AXI_WDATA <= '0;
    control_qinq_tb_S_AXI_WSTRB <= '0;
    control_qinq_tb_S_AXI_WVALID <= 1'b0;
    control_qinq_tb_S_AXI_BREADY <= 1'b0;
    control_qinq_tb_S_AXI_ARADDR <= '0;
    control_qinq_tb_S_AXI_ARVALID <= 1'b0;
    control_qinq_tb_S_AXI_RREADY <= 1'b0;
end  

initial begin
    control_domain_tb_S_AXI_AWADDR <= '0;
    control_domain_tb_S_AXI_AWVALID <= 1'b0;
    control_domain_tb_S_AXI_WDATA <= '0;
    control_domain_tb_S_AXI_WSTRB <= '0;
    control_domain_tb_S_AXI_WVALID <= 1'b0;
    control_domain_tb_S_AXI_BREADY <= 1'b0;
    control_domain_tb_S_AXI_ARADDR <= '0;
    control_domain_tb_S_AXI_ARVALID <= 1'b0;
    control_domain_tb_S_AXI_RREADY <= 1'b0;
end  

initial begin
    control_l3_tb_S_AXI_AWADDR <= '0;
    control_l3_tb_S_AXI_AWVALID <= 1'b0;
    control_l3_tb_S_AXI_WDATA <= '0;
    control_l3_tb_S_AXI_WSTRB <= '0;
    control_l3_tb_S_AXI_WVALID <= 1'b0;
    control_l3_tb_S_AXI_BREADY <= 1'b0;
    control_l3_tb_S_AXI_ARADDR <= '0;
    control_l3_tb_S_AXI_ARVALID <= 1'b0;
    control_l3_tb_S_AXI_RREADY <= 1'b0;
end  

initial begin
    control_pppL2_tb_S_AXI_AWADDR <= '0;
    control_pppL2_tb_S_AXI_AWVALID <= 1'b0;
    control_pppL2_tb_S_AXI_WDATA <= '0;
    control_pppL2_tb_S_AXI_WSTRB <= '0;
    control_pppL2_tb_S_AXI_WVALID <= 1'b0;
    control_pppL2_tb_S_AXI_BREADY <= 1'b0;
    control_pppL2_tb_S_AXI_ARADDR <= '0;
    control_pppL2_tb_S_AXI_ARVALID <= 1'b0;
    control_pppL2_tb_S_AXI_RREADY <= 1'b0;
end  

initial begin
    control_extL2_tb_S_AXI_AWADDR <= '0;
    control_extL2_tb_S_AXI_AWVALID <= 1'b0;
    control_extL2_tb_S_AXI_WDATA <= '0;
    control_extL2_tb_S_AXI_WSTRB <= '0;
    control_extL2_tb_S_AXI_WVALID <= 1'b0;
    control_extL2_tb_S_AXI_BREADY <= 1'b0;
    control_extL2_tb_S_AXI_ARADDR <= '0;
    control_extL2_tb_S_AXI_ARVALID <= 1'b0;
    control_extL2_tb_S_AXI_RREADY <= 1'b0;
end  




string packet_file = "Packet.user"; 



string tuple_file = ""; 



import "DPI-C" context function void PPPOE_DPI( 
    input string t_packet_file,             
    input int    t_packet_in_type,          
    input string t_tuple_file,              
    input int    t_packet_out_type,         
    input int    t_bus_width,               
    input int    t_verbosity                
);                                          



initial begin
    if ($value$plusargs("PKT=%s", packet_file)) begin end
    if ($value$plusargs("TUP=%s",  tuple_file)) begin end
    PPPOE_DPI(packet_file, 0, tuple_file, 1, 256, 1);
    fw_done = 0;
    file_done = 1;
    wait(internal_rst_done);
    #10000 
    TCAM_Init(0,24,2,256,0,0,0);
    TCAM_Clean(0);
    update_qinq_tb_from_file("qinq_tb.tbl");
    TCAM_Init(1,32,3,256,0,0,0);
    TCAM_Clean(1);
    update_domain_tb_from_file("domain_tb.tbl");
    TCAM_Init(2,32,116,256,0,0,0);
    TCAM_Clean(2);
    update_l3_tb_from_file("l3_tb.tbl");
    TCAM_Init(3,48,29,256,0,0,0);
    TCAM_Clean(3);
    update_pppL2_tb_from_file("pppL2_tb.tbl");
    TCAM_Init(4,48,29,256,0,0,0);
    TCAM_Clean(4);
    update_extL2_tb_from_file("extL2_tb.tbl");
    #1000 fw_done = 1;
end



endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2017/07/31 12:13:46
// by Barista HDL generation library, version TRUNK @ 1007984


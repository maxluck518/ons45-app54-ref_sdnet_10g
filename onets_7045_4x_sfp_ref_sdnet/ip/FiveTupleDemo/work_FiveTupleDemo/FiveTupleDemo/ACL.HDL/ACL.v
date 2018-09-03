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
// Xilinx SDNet Compiler version 2017.4, build 2093981
//----------------------------------------------------------------------------
/*

*/

`timescale 1 ps / 1 ps

module ACL (
	clk_lookup_rst_high,
	clk_lookup,
	tuple_in_request_VALID,
	tuple_in_request_DATA,
	tuple_out_response_VALID,
	tuple_out_response_DATA,
	clk_control,
	clk_control_rst_low,
	control_S_AXI_AWADDR,
	control_S_AXI_AWVALID,
	control_S_AXI_AWREADY,
	control_S_AXI_WDATA,
	control_S_AXI_WSTRB,
	control_S_AXI_WVALID,
	control_S_AXI_WREADY,
	control_S_AXI_BREADY,
	control_S_AXI_BRESP,
	control_S_AXI_BVALID,
	control_S_AXI_ARADDR,
	control_S_AXI_ARVALID,
	control_S_AXI_ARREADY,
	control_S_AXI_RREADY,
	control_S_AXI_RDATA,
	control_S_AXI_RRESP,
	control_S_AXI_RVALID
);

localparam K = 112 ;
localparam V = 8 ;
localparam A = 6 ;
input clk_lookup_rst_high ;
input clk_lookup ;
input tuple_in_request_VALID ;
input [111:0] tuple_in_request_DATA ;
output tuple_out_response_VALID ;
output [7:0] tuple_out_response_DATA ;
input clk_control ;
input clk_control_rst_low ;
input [7:0] control_S_AXI_AWADDR ;
input control_S_AXI_AWVALID ;
output control_S_AXI_AWREADY ;
input [31:0] control_S_AXI_WDATA ;
input [3:0] control_S_AXI_WSTRB ;
input control_S_AXI_WVALID ;
output control_S_AXI_WREADY ;
input control_S_AXI_BREADY ;
output [1:0] control_S_AXI_BRESP ;
output control_S_AXI_BVALID ;
input [7:0] control_S_AXI_ARADDR ;
input control_S_AXI_ARVALID ;
output control_S_AXI_ARREADY ;
input control_S_AXI_RREADY ;
output [31:0] control_S_AXI_RDATA ;
output [1:0] control_S_AXI_RRESP ;
output control_S_AXI_RVALID ;

wire tuple_out_response_VALID ;
wire [7:0] tuple_out_response_DATA ;
wire control_S_AXI_AWREADY ;
wire control_S_AXI_WREADY ;
wire [1:0] control_S_AXI_BRESP ;
wire control_S_AXI_BVALID ;
wire control_S_AXI_ARREADY ;
wire [31:0] control_S_AXI_RDATA ;
wire [1:0] control_S_AXI_RRESP ;
wire control_S_AXI_RVALID ;
wire LookupReqValid ;
wire [111:0] LookupReqKey ;
wire LookupRespValid ;
wire LookupRespMatch ;
wire [111:0] LookupRespKey /* unused */ ;
wire [5:0] LookupRespAddr /* unused */ ;
wire [7:0] LookupRespValue ;
wire ReqValid ;
wire [2:0] ReqOp ;
wire [15:0] ReqAddr ;
wire [127:0] ReqKey ;
wire [127:0] ReqMask ;
wire [31:0] ReqValue ;
wire RespValidpulse ;
wire [31:0] RespValue ;
wire [127:0] RespMask ;
wire [127:0] RespKey ;
wire [6:0] Size /* unused */ ;
reg [2:0] ReqValid_del ;
wire ReqValid_int ;
wire RespValid ;
reg [2:0] RespValid_del ;
reg UpdateReqRcvd ;
reg UpdateRespAck ;
wire [31:0] deviceid ;

ACL_wrap
ACL_wrap_i
(
	.Rst                 	( clk_lookup_rst_high ),
	.Clk                 	( clk_lookup ),
	.LookupReqValid      	( LookupReqValid ),
	.LookupReqKey        	( LookupReqKey ),
	.LookupRespValid     	( LookupRespValid ),
	.LookupRespMatch     	( LookupRespMatch ),
	.LookupRespKey       	( LookupRespKey ),
	.LookupRespAddr      	( LookupRespAddr ),
	.LookupRespValue     	( LookupRespValue ),
	.Size                	( Size ),
	.UpdateReqValid      	( ReqValid ),
	.UpdateReqOp         	( ReqOp ),
	.UpdateReqAddr       	( ReqAddr[5:0] ),
	.UpdateReqKey        	( ReqKey[111:0] ),
	.UpdateReqMask       	( ReqMask[111:0] ),
	.UpdateReqValue      	( ReqValue[7:0] ),
	.UpdateRespValid     	( RespValid ),
	.UpdateRespKey       	( RespKey[111:0] ),
	.UpdateRespMask      	( RespMask[111:0] ),
	.UpdateRespData      	( RespValue[7:0] )
);

assign deviceid = 32'h12 ;

ACL_csr
ACL_csr_i
(
	.csrACL_csrDeviceID_UpdData	( deviceid ),
	.csrACL_csrDeviceID_UpdEn	( 1'd1 ),
	.csrACL_csrTcamPrgData0	( ReqKey[31:0] ),
	.csrACL_csrTcamPrgData0_UpdData	( RespKey[31:0] ),
	.csrACL_csrTcamPrgData0_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgData1	( ReqKey[63:32] ),
	.csrACL_csrTcamPrgData1_UpdData	( RespKey[63:32] ),
	.csrACL_csrTcamPrgData1_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgData2	( ReqKey[95:64] ),
	.csrACL_csrTcamPrgData2_UpdData	( RespKey[95:64] ),
	.csrACL_csrTcamPrgData2_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgData3	( ReqKey[127:96] ),
	.csrACL_csrTcamPrgData3_UpdData	( RespKey[127:96] ),
	.csrACL_csrTcamPrgData3_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgMask0	( ReqMask[31:0] ),
	.csrACL_csrTcamPrgMask0_UpdData	( RespMask[31:0] ),
	.csrACL_csrTcamPrgMask0_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgMask1	( ReqMask[63:32] ),
	.csrACL_csrTcamPrgMask1_UpdData	( RespMask[63:32] ),
	.csrACL_csrTcamPrgMask1_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgMask2	( ReqMask[95:64] ),
	.csrACL_csrTcamPrgMask2_UpdData	( RespMask[95:64] ),
	.csrACL_csrTcamPrgMask2_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgMask3	( ReqMask[127:96] ),
	.csrACL_csrTcamPrgMask3_UpdData	( RespMask[127:96] ),
	.csrACL_csrTcamPrgMask3_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamPrgInfo0	( ReqValue[31:0] ),
	.csrACL_csrTcamPrgInfo0_UpdData	( RespValue[31:0] ),
	.csrACL_csrTcamPrgInfo0_UpdEn	( RespValidpulse ),
	.csrACL_csrTcamUpdAck_UpdData	( RespValid_del[2] ),
	.csrACL_csrTcamUpdAck_UpdEn	( 1'd1 ),
	.csrACL_csrTcamUpdReqAddr	( ReqAddr ),
	.csrACL_csrTcamUpdReqCfgOp	( ReqOp[1:0] ),
	.csrACL_csrTcamUpdReqCfgOp_SwWrEn	( ReqValid_int ),
	.csrACL_csrTcamUpdReqCfgOp_WrAck	( 1'd1 ),
	.csrACL_csrTcamUpdVld	( ReqOp[2] ),
	.aclk                	( clk_control ),
	.aresetn             	( clk_control_rst_low ),
	.awaddr              	( control_S_AXI_AWADDR ),
	.awvalid             	( control_S_AXI_AWVALID ),
	.awready             	( control_S_AXI_AWREADY ),
	.wdata               	( control_S_AXI_WDATA ),
	.wstrb               	( control_S_AXI_WSTRB ),
	.wvalid              	( control_S_AXI_WVALID ),
	.wready              	( control_S_AXI_WREADY ),
	.bready              	( control_S_AXI_BREADY ),
	.bresp               	( control_S_AXI_BRESP ),
	.bvalid              	( control_S_AXI_BVALID ),
	.araddr              	( control_S_AXI_ARADDR ),
	.arvalid             	( control_S_AXI_ARVALID ),
	.arready             	( control_S_AXI_ARREADY ),
	.rready              	( control_S_AXI_RREADY ),
	.rdata               	( control_S_AXI_RDATA ),
	.rresp               	( control_S_AXI_RRESP ),
	.rvalid              	( control_S_AXI_RVALID )
);

always @( posedge clk_lookup ) begin
	ReqValid_del <= { ReqValid_del[1:0], ReqValid_int } ;
end

assign ReqValid = ( ~ReqValid_del[2] & ReqValid_del[1] ) ;

always @( posedge clk_control ) begin
	RespValid_del <= { RespValid_del[1:0], UpdateRespAck } ;
end

assign RespValidpulse = ( ~RespValid_del[2] & RespValid_del[1] ) ;

always @( posedge clk_lookup ) begin
	if ( clk_lookup_rst_high ) begin
		UpdateRespAck <= 1'd0 ;
		UpdateReqRcvd <= 1'd0 ;
	end
	else  begin
		if ( ~UpdateReqRcvd ) begin
			if ( ReqValid ) begin
				UpdateRespAck <= 1'd0 ;
				UpdateReqRcvd <= 1'd1 ;
			end
			else  begin
				UpdateRespAck <= 1'd1 ;
				UpdateReqRcvd <= 1'd0 ;
			end
		end
		else  begin
			if ( RespValid ) begin
				UpdateRespAck <= 1'd1 ;
				UpdateReqRcvd <= 1'd0 ;
			end
		end
	end
end

assign LookupReqValid = tuple_in_request_VALID ;

assign LookupReqKey = tuple_in_request_DATA ;

assign tuple_out_response_VALID = LookupRespValid ;

assign tuple_out_response_DATA = ( LookupRespMatch ? LookupRespValue : 8'd0 ) ;


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2018/06/28 08:54:32
// by Barista HDL generation library, version TRUNK @ 1007984


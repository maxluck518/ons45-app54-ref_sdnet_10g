// ----------------------------------------------------------------
// Copyright (c) 2004 Modelware, Inc.  All rights reserved.
//
// This source code is considered a trade secret of Modelware, Inc.
// and cannot be disclosed or reproduced without Modelware's
// prior written consent.
//
// Use of this source code is subject to a signed license agreement
// between Modelware or its licensees and the end-user.
//
//
// Modelware, Inc.
// 10 West Bergen Place
// Suite 105
// Red Bank, NJ 07701
//
// Phone  : (732)936-1808
// Fax    : (732)936-1838
// E-mail : info@modelware.com
// ----------------------------------------------------------------

`timescale 1ps / 1ps

// ----------------------------------------------------------------
// This file contains a single-channel descriptor buffer
// ----------------------------------------------------------------
/*
$Log: DscSCBuf.vlp  $
Revision 1.1 2004/02/05 22:27:07GMT dennis 
Initial revision
Member imported to project e:/MWI/Modelware/_Lib/storage/descriptor/DscSCBuf/vlog/rtl/DscSCBuf/project.pj
*/
// ----------------------------------------------------------------

module PPP_DscSCBuf
(
 Rst,
 Clk,

 // Descriptor Skip
 DscSkip,
 DscVal,
 DscData,

 // Descriptor Fifo
 Empty,
 RdEnb,
 RdVal,
 RdData
);


// configuration parameter
parameter               DscBits  = 1;
parameter               Latency  = 1;
parameter               BufSize  = 256;
parameter               CntBits  = 8;


// io ports
input                   Rst;
input                   Clk;

// 0-latency output port
input                   DscSkip;
output                  DscVal; reg                     DscVal;
output  [DscBits-1:0]   DscData;reg     [DscBits-1:0]   DscData;

// L-latency input port
input                   Empty;
output                  RdEnb;  reg                     RdEnb;
input                   RdVal;
input   [DscBits-1:0]   RdData;

// internal
reg     [DscBits-1:0]   BufData [BufSize-1:0];

reg     [CntBits:0]     WrPtr;
wire    [CntBits:0]     WrPtrInc = WrPtr + 1;

reg     [CntBits:0]     RdPtr;
wire    [CntBits:0]     RdPtrInc = RdPtr + 1;
wire    [CntBits-1:0]   RdPtrMux = ((DscSkip == 1) && (DscVal == 1)) ? (RdPtrInc[CntBits-1:0]) : (RdPtr[CntBits-1:0]);

wire    [CntBits:0]     Diff = WrPtr - RdPtr;

// data fetch process
//always @ (posedge Clk)
always @ (posedge Clk)
begin
    if (Rst == 1)
        RdEnb <= 0;
    else
        if ((Empty == 0) && (Diff < (BufSize-Latency-1)))
            RdEnb <= 1;
        else
            RdEnb <= 0;
end // always

// data write process
always @ (posedge Clk) if (RdVal == 1) BufData[WrPtr[CntBits-1:0]] <= RdData;

// write pointer
always @ (posedge Clk)
begin
    if (Rst == 1)
        WrPtr <= 0;
    else
        if (RdVal == 1) WrPtr <= WrPtrInc;
end // always

// read pointer
always @ (posedge Clk)
begin
    if (Rst == 1)
        RdPtr <= 0;
    else
        if ((DscSkip == 1) && (DscVal == 1))
            RdPtr <= RdPtrInc;
end // always

// output data
always @ (posedge Clk)
begin
    if (Rst == 1)
        DscData <= 0;
    else
        DscData <= BufData[RdPtrMux];

end // always

// output valid
always @ (posedge Clk)
begin
    if (Rst == 1)
        DscVal <= 0;
    else
        if ((DscSkip == 1) && (DscVal == 1))
            DscVal <= (WrPtr != RdPtrInc);
        else
            DscVal <= (WrPtr != RdPtr);

end // always

endmodule

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

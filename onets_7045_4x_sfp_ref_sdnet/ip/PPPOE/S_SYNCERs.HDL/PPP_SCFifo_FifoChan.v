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
// This file contains a per-channel FIFO logic slice.
// ----------------------------------------------------------------
/*
$Log: FifoChan.vlp  $
Revision 1.11 2011/03/18 12:43:27EST agk 
Added translate off/on pragmas around display and stop statements
Revision 1.10 2010/09/10 08:37:42EDT clancy 
1) added simplified (and faster from a static timing perspective) operation when rd and wr clocks
are synchrnous
2) added simulation function for monitoring HWM, this may help in determining how deep fifos need to be
Revision 1.9 2007/05/31 10:56:50EDT vrahimis 

Revision 1.8 2005/12/16 10:08:45EST vrahimis 

Revision 1.7 2005/12/15 21:34:27EST vrahimis
Reset polarity option added
Revision 1.6 2005/03/22 10:45:56EST cassod
Added FullPolarity parameter
Revision 1.5 2004/03/19 15:19:56EST dennis
improved timing in the RdCntDiff/WrCntDiff calculation
==========================================
Revision 1.4 2004/02/19 18:26:55EST dennis
reversed the sense of NameType option
===============================
Revision 1.3 2004/02/06 00:38:57EST dennis
added a look-ahead option to the almost-empty flag
to predict a conservative future state during reads
<AEmptyLookAhead>
 0 : no look-ahead
 1 : AEmpty(1) == Empty
 2 : AEmpty(B) is valid *during* last cycle of burst read,
      even if FIFO channel has 2*B-1 data words
Revision 1.2 2004/02/04 13:06:18EST dennis
Reversed the sense of the WrPtrDiffReg/RdPtrDiff  options
0 = asynchronous
1 = registered
Revision 1.1 2004/01/30 16:13:41EST dennis
Initial revision
Member imported to project c:/MWI/Modelware/_Lib/storage/fifo/FifoChan/vlog/rtl/FifoChan/project.pj
*/
// ----------------------------------------------------------------

module PPP_SCFifo_FifoChan
(


 WrRst,
 WrClk,
 WrEnb,
 WrAddr,

 RdRst,
 RdClk,
 RdEnb,
 RdVal,
 RdAddr,

 Empty,
 AFull_0,
 Full
);

// *************************************************************************************

// configuration parameters
parameter                       AddrBits = 9; // fifo depth = 2^AddrBits

// *************************************************************************************

// IO ports

parameter   [AddrBits-1:0]      ChanBase = 0;
parameter   [AddrBits:0]        ChanSize = 1<<AddrBits;

parameter   [AddrBits-1:0]      AFullAssert_0 = 0;
parameter   [AddrBits-1:0]      AFullNegate_0 = 0;
parameter                       FullPolarity=1;

// write
input                           WrRst;
input                           WrClk;
input                           WrEnb;
output      [AddrBits-1:0]      WrAddr;

// read
input                           RdRst;
input                           RdClk;
input                           RdEnb;
output                          RdVal;          reg                     RdVal;
output      [AddrBits-1:0]      RdAddr;

// flags
output                          Empty;          reg                     Empty;
output                          AFull_0;   reg                     AFull_0;
output                          Full;           reg                     Full;

// *************************************************************************************

// functions

// *** Gray Code Encoder ***
function [AddrBits:0] GrayEncode;
input    [AddrBits:0] A;
integer i;
begin
    GrayEncode[AddrBits] = A[AddrBits];
    for(i=0; i<=AddrBits-1;i=i+1)
        GrayEncode[i] = A[i+1]^A[i];
end
endfunction

// *** Gray Code Decoder ***
function [AddrBits:0] GrayDecode;
input    [AddrBits:0] A;
integer i;
begin
    GrayDecode[AddrBits] = A[AddrBits];
    for(i=AddrBits-1; i>=0; i=i-1)
        GrayDecode[i] = GrayDecode[i+1]^A[i];
end
endfunction
// *************************************************************************************

// masked read and write enables
wire                            RdEnb_i = RdEnb & ~Empty;

// -------------------------------------------------------------------------------------

wire                            WrEnb_i = WrEnb & ~Full;

// *************************************************************************************

// read signals
reg     [AddrBits:0]            RdCnt;
reg     [AddrBits:0]            RdCntNext;
always @ (posedge RdClk)
begin
    if (RdRst == 1)             RdCntNext <= 1;
    else if (RdEnb_i == 1)      RdCntNext <= RdCntNext + 1;
end // always
reg     [AddrBits:0]            RdCntGC;
wire    [AddrBits:0]            RdCntGC_s;
reg     [AddrBits:0]            RdCntDC;
always @ (posedge WrClk)        RdCntDC    <= GrayDecode(RdCntGC_s);
reg     [AddrBits-1:0]          RdPtr;
wire    [AddrBits-1:0]          RdPtrNext = RdPtr + 1;

// -------------------------------------------------------------------------------------

// write signals
reg     [AddrBits:0]            WrCnt;
reg     [AddrBits:0]            WrCntNext;
// write process
always @ (posedge WrClk)
begin
    if (WrRst == 1)             WrCntNext <= 1;
    else if (WrEnb_i == 1)      WrCntNext <= WrCntNext + 1;
end // always
reg     [AddrBits:0]            WrCntGC;
wire    [AddrBits:0]            WrCntGC_s;
reg     [AddrBits:0]            WrCntDC;
always @ (posedge RdClk)        WrCntDC    <= GrayDecode(WrCntGC_s);
reg     [AddrBits-1:0]          WrPtr;
wire    [AddrBits-1:0]          WrPtrNext = WrPtr + 1;

// *************************************************************************************

reg     [AddrBits:0]            RdCntDiff;
always @ (posedge RdClk)        RdCntDiff <= (RdEnb_i)?(WrCntDC - RdCntNext):(WrCntDC - RdCnt);

// -------------------------------------------------------------------------------------

reg     [AddrBits:0]            WrCntDiff;
always @ (posedge WrClk)        WrCntDiff <= (WrEnb_i)?(WrCntNext - RdCntDC):(WrCnt - RdCntDC);

// *************************************************************************************


// memory write address
assign  WrAddr = WrPtr;

// -------------------------------------------------------------------------------------

// memory read address
assign  RdAddr = RdPtr;

// *************************************************************************************
// synchronize cross-clock signals
PPP_SCFifo_Synchronizer
#(AddrBits+1)
Synchronizer_WrClk_inst (.Clk(WrClk), .In(RdCntGC), .Out(RdCntGC_s));
// -----------------------------
PPP_SCFifo_Synchronizer
#(AddrBits+1)
Synchronizer_RdClk_inst (.Clk(RdClk), .In(WrCntGC), .Out(WrCntGC_s));
// *************************************************************************************

always @ (posedge RdClk)
begin : read_process
    if (RdRst == 1)
     begin
        RdPtr       <= ChanBase;
        RdCnt       <= 0;
        RdCntGC     <= 0;
        Empty       <= 1;
        RdVal       <= 0;
     end // reset

    else
     begin
        //-------------------------------------------------------------------------

        // validate output data
        if ((RdEnb == 1) && (Empty == 0))   RdVal <= 1;
        else                                RdVal <= 0;

        //-------------------------------------------------------------------------


        //-------------------------------------------------------------------------

        // convert read counter to gray code
        // before sending it to the write clock domain
        RdCntGC  <= GrayEncode(RdCnt);

        //-------------------------------------------------------------------------

        if (Empty == 0)
        // if fifo not empty
         begin
            if (RdEnb == 1)
            // if read enable active
             begin
                // increment pointer
                RdPtr    <= RdPtrNext;
                // increment counter
                RdCnt    <= RdCntNext;
                // if reading last location
                if (RdCntDiff == 1)
                    // assert empty
                    Empty  <= 1;
             end
         end

        else
        // fifo is empty
         begin
            // wait until at least one location is written
            if (RdCntDiff != 0)
                // negate empty
                Empty <= 0;
         end
     end // clock
end // always

// *************************************************************************************

// write process
always @ (posedge WrClk)
begin : write_process
    if (WrRst == 1)
     begin
        WrPtr           <= ChanBase;
        WrCnt           <= 0;
        WrCntGC         <= 0;
        Full            <= FullPolarity;
        AFull_0    <= FullPolarity;
     end // reset

    else
     begin
        //-------------------------------------------------------------------------

        // almost full flag 0
	// original calculation is the delta from Full
        //if      (WrCntDiff >  ChanSize - {1'b0,AFullAssert_0}) AFull_0 <= 1;
        //else if (WrCntDiff <= ChanSize - {1'b0,AFullNegate_0}) AFull_0 <= 0;

	// modified because desired calculation is the delta from Empty ...
        if      (WrCntDiff >  {1'b0,AFullAssert_0}) AFull_0 <= 1;
        else if (WrCntDiff <= {1'b0,AFullNegate_0}) AFull_0 <= 0;

        //-------------------------------------------------------------------------

        // convert write counter to gray code
        // before sending it to the read clock domain
        WrCntGC  <= GrayEncode(WrCnt);

        //-------------------------------------------------------------------------

        if (Full == 0)
        // if fifo not full
         begin
            if (WrEnb == 1)
            // if write enable active
             begin
                // increment pointer
                WrPtr    <= WrPtrNext;
                // increment counter
                WrCnt    <= WrCntNext;
                // if writing last location
                if (WrCntDiff == (ChanSize-1))
                    // assert full
                    Full <= 1;
             end
         end

        else
        // fifo is full
         begin
            // if fifo channel is present
            // wait until at least one location is available
            if (WrCntDiff < ChanSize)
                // negate full
                Full <= 0;
         end
     end // clock
end // block: write_process



// *************************************************************************************

//synopsys translate_off
   integer hwm;
   always @(posedge WrClk or posedge WrRst)
     begin
        if (WrRst)
          begin
             hwm <= 0;
          end
        else
          begin
             if (WrCntDiff > hwm)
               begin
                  hwm <= WrCntDiff;
               end
          end
     end // always @ (posedge `st1_shaper_path.WrClk or posedge `st1_shaper_path.WrRst)
//synopsys translate_on

endmodule

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

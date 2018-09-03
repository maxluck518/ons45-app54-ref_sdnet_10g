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
// This file contains a single-channel FIFO.
// ----------------------------------------------------------------
/*
$Log: SCFifo.vlp  $
Revision 1.11 2011/03/18 14:56:08GMT agk 
Added translate off/on pragmas around display and stop statements
Revision 1.10 2010/09/10 13:44:20EDT clancy 
added support for overflow/underflow status ports
Revision 1.9 2010/08/20 08:53:01EDT clancy 
added simulation time to overflow message
Revision 1.8 2010/02/10 13:38:09EST clancy 
added stop_on_overflow feature for sim
Revision 1.7 2009/10/29 15:42:58EST clancy 
1) changed default offset for aempty and afull, as the existing defaults of zero essentially disable aempty and afull generation
Revision 1.6 2007/11/20 14:46:02EST cassod 
Overflow detection added 
Revision 1.5 2005/12/15 22:01:02EST vrahimis
reset polarity option added
Revision 1.4 2004/03/24 15:56:27EST dennis
Removed <BaseSizeType> option : always 0
====================================
Revision 1.3 2004/03/24 15:49:16GMT-05:00 dennis
added <SeparateRamReadClock> option
0=RAM is read on <RdClk>
1=RAM is read on <RdClkRam>, creates additonal <RdValRam> signal
========================================================
Revision 1.2 2004/02/04 16:00:49GMT-05:00 dennis
 add MemRdMode option to drive memory read enable
    MemRdMode == 0 : MemRdEnb = RdEnb
    MemRdMode == 1 : MemRdEnb = ~Empty
add MemWrMode option to drive memory write enable
    MemWrMode == 0 : MemWrEnb = WrEnb & ~Full
    MemWrMode == 1 : MemWrEnb = WrEnb
Revision 1.1 2004/01/30 16:13:35EST dennis
Initial revision
Member imported to project c:/MWI/Modelware/_Lib/storage/fifo/SCFifo/vlog/rtl/SCFifo/project.pj
*/
// ----------------------------------------------------------------

module PPP_SCFifo
(

 WrRst,
 WrClk,
 WrEnb,
 WrData,

 RdRst,
 RdClk,
 RdEnb,
 RdVal,
 RdData,



 Empty,
 AFull_0,
 Full
);

// *************************************************************************************

// configuration parameters
parameter                           AddrBits = 9; // fifo depth = 2^AddrBits
parameter                           DataBits = 662; // fifo width

// *************************************************************************************

parameter   [AddrBits-1:0]          ChanBase = 0;
parameter   [AddrBits:0]            ChanSize = 1<<AddrBits;

// *************************************************************************************

// IO ports
parameter   [AddrBits-1:0]          AFullAssert_0 = 2;
parameter   [AddrBits-1:0]          AFullNegate_0 = 2;

// write
input                               WrRst;
input                               WrClk;
input                               WrEnb;
input       [DataBits-1:0]          WrData;

// read
input                               RdRst;
input                               RdClk;
input                               RdEnb;
output                              RdVal;
output      [DataBits-1:0]          RdData;


// flags
output                              Empty;
output                              AFull_0;
output                              Full;

// *************************************************************************************

wire        [AddrBits-1:0]          WrAddr;
wire        [AddrBits-1:0]          RdAddr;

// *************************************************************************************

wire                                MemWrEnb = WrEnb & ~Full;
wire                                MemRdEnb = RdEnb;

// *************************************************************************************

PPP_SCFifo_FifoChan
#(
                                    AddrBits,
                                    ChanBase,
                                    ChanSize
                                    ,
                                    AFullAssert_0
                                    ,
                                    AFullNegate_0
)
FifoChan_inst
(

.WrRst                         (WrRst),
.WrClk                              (WrClk),
.WrEnb                              (WrEnb),
.WrAddr                             (WrAddr),

.RdRst                         (RdRst),
.RdClk                              (RdClk),
.RdEnb                              (RdEnb),
.RdVal                              (RdVal),
.RdAddr                             (RdAddr),

.Empty                              (Empty),
.AFull_0                       (AFull_0),
.Full                               (Full)
);

// *************************************************************************************

PPP_SCFifo_SramR1W1
#(
                                    AddrBits,
                                    DataBits
)
SramR1W1_inst
(
.WrClk                              (WrClk),
.WrEnb                              (MemWrEnb),
.WrAddr                             (WrAddr),
.WrData                             (WrData),

.RdClk                              (RdClk),
.RdEnb                              (MemRdEnb),
.RdAddr                             (RdAddr),
.RdData                             (RdData)
);

// *************************************************************************************


always @(posedge WrClk or posedge WrRst)
  begin
     if (WrRst)
       begin
       end
     else
       begin
          if(WrEnb & Full)
            begin
               //synopsys translate_off
               $display("%t:%m Overflow detected",$time);
               $stop;
               //synopsys translate_on
            end
       end // else: !if(WrRst)
  end // always @ (posedge WrClk or posedge WrRst)

always @(posedge RdClk)
  begin
     if (RdRst)
       begin
         end
     else
       begin
          if(RdEnb & Empty)
            begin
               //synopsys translate_off
               //$display("%t:%m Underflow detected",$time);
               //$stop;
               //synopsys translate_on
            end
       end // else: !if(RdRst)
  end

endmodule

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

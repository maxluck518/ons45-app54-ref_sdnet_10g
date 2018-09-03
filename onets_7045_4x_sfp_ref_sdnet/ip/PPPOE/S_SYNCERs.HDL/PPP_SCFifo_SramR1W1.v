//synopsys translate_off
//`define PDEFINE_FAST_SIMULATION_INIT 1
//synopsys translate_on
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
// This file contains the synchronous dual-port RAM
// ----------------------------------------------------------------
/*
$Log: SramR1W1.vlp  $
Revision 1.8 2012/12/05 14:33:36EST clancy 
1) added support for passing vivado style ram_style constraint string
Revision 1.7 2010/08/04 16:46:58EDT clancy 
swapped keyword pragma for synopsys as I ran into a case where xst did not recognize "pragma"
Revision 1.6 2010/07/06 15:09:10EDT clancy 

Revision 1.5 2010/06/26 07:47:54EDT clancy 
fixed data type on RdData
Revision 1.4 2010/06/23 09:44:03EDT clancy 
1) added the ability to use xilinx built in oregs
2) added the ability to insert ram style constraint
Revision 1.3 2006/02/20 14:28:55EST cassod 
Added optional Read Valid and Write Acknowledge signals 
Revision 1.2 2004/07/15 14:12:12EDT cassod
Added Ram init options
Revision 1.1 2004/01/30 16:13:42EST dennis
Initial revision
Member imported to project c:/MWI/Modelware/_Lib/storage/memory/SramR1W1/vlog/rtl/SramR1W1/project.pj
*/
// ----------------------------------------------------------------

module PPP_SCFifo_SramR1W1
(

 WrClk,
 WrEnb,
 WrAddr,
 WrData,


 RdClk,
 RdEnb,
 RdAddr,
 RdData
);

// configuration
parameter                   AddrBits = 9;
parameter                   DataBits = 1034;

// write port
input                       WrClk;
input                       WrEnb;
input   [AddrBits-1:0]      WrAddr;
input   [DataBits-1:0]      WrData;

// read port
input                       RdClk;
input                       RdEnb;
input   [AddrBits-1:0]      RdAddr;
output  reg [DataBits-1:0]      RdData;

// RAM
reg [DataBits-1:0]          RAM [(1<<AddrBits)-1:0]
;

// write process
always @ (posedge WrClk) if (WrEnb   == 1) RAM[WrAddr]   <= WrData;

// clocked address
reg     [AddrBits-1:0]      RdAddr_r;

// read process
always @ (posedge RdClk) if (RdEnb == 1) RdAddr_r <= RdAddr;

// output data
   wire [DataBits-1:0]      iRdData;
assign  iRdData = RAM[RdAddr_r];







   always @(*)
     begin
        RdData <= iRdData;
     end



endmodule

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

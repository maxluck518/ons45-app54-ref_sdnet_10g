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
// This file contains the signal synchronization module.
// ----------------------------------------------------------------
/*
$Log: Synchronizer.vlp  $
Revision 1.1 2004/01/30 21:13:37GMT dennis 
Initial revision
Member imported to project e:/MWI/Modelware/_Lib/synchronization/Synchronizer/vlog/rtl/Synchronizer/project.pj
*/
// ----------------------------------------------------------------

module PPP_SCFifo_Synchronizer
(
 Clk,
 In,
 Out
);

// configuration parameter
parameter           Bits = 10;

// I/O Ports
input               Clk;

input   [Bits-1:0]  In;
output  [Bits-1:0]  Out;

// internal signals
reg     [Bits-1:0]  In_r;
reg     [Bits-1:0]  In_r2;

// synchronization process
always @ (posedge Clk)
begin
    // twice re-clock input signal
    In_r  <= In;
    In_r2 <= In_r;
end // always

// output twice re-clocked signal
assign Out = In_r2;

endmodule

// XSIP watermark, do not delete 67d7842dbbe25473c3c32b93c0da8047785f30d78e8a024de1b57352245f9689

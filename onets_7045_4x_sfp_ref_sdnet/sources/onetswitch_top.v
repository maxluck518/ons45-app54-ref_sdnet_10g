`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/05/26 18:36:43
// Design Name: 
// Module Name: onetswitch_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module onetswitch_top(
   inout [14:0] DDR_addr,
   inout [2:0]  DDR_ba,
   inout        DDR_cas_n,
   inout        DDR_ck_n,
   inout        DDR_ck_p,
   inout        DDR_cke,
   inout        DDR_cs_n,
   inout [3:0]  DDR_dm,
   inout [31:0] DDR_dq,
   inout [3:0]  DDR_dqs_n,
   inout [3:0]  DDR_dqs_p,
   inout        DDR_odt,
   inout        DDR_ras_n,
   inout        DDR_reset_n,
   inout        DDR_we_n,
   inout        FIXED_IO_ddr_vrn,
   inout        FIXED_IO_ddr_vrp,
   inout [53:0] FIXED_IO_mio,
   inout        FIXED_IO_ps_clk,
   inout        FIXED_IO_ps_porb,
   inout        FIXED_IO_ps_srstb,

   input        refclk_p,
   input        refclk_n,
   
   input        reset,
   
   input  [3:0] rxn,
   input  [3:0] rxp,
   output [3:0] txp,
   output [3:0] txn,
   
   output [1:0] pl_led,
   output [1:0] pl_pmod   
);
    
   wire bd_fclk0_125m ;
   wire bd_fclk1_75m  ;
   wire bd_fclk2_200m ;

   reg [23:0] cnt_0;
   reg [23:0] cnt_1;
   reg [23:0] cnt_2;
   reg [23:0] cnt_3;

   always @(posedge bd_fclk0_125m) begin
     cnt_0 <= cnt_0 + 1'b1;
   end
   always @(posedge bd_fclk1_75m) begin
     cnt_1 <= cnt_1 + 1'b1;
   end
   always @(posedge bd_fclk2_200m) begin
     cnt_2 <= cnt_2 + 1'b1;
   end
   always @(posedge bd_fclk2_200m) begin
     cnt_3 <= cnt_3 + 1'b1;
   end

   assign pl_led[0]  = cnt_0[23];
   assign pl_led[1]  = cnt_1[23];
   assign pl_pmod[0] = cnt_2[23];
   assign pl_pmod[1] = cnt_3[23];
   
   onets_bd_wrapper i_onets_bd_wrapper(
      .DDR_addr                              (DDR_addr),
      .DDR_ba                                (DDR_ba),
      .DDR_cas_n                             (DDR_cas_n),
      .DDR_ck_n                              (DDR_ck_n),
      .DDR_ck_p                              (DDR_ck_p),
      .DDR_cke                               (DDR_cke),
      .DDR_cs_n                              (DDR_cs_n),
      .DDR_dm                                (DDR_dm),
      .DDR_dq                                (DDR_dq),
      .DDR_dqs_n                             (DDR_dqs_n),
      .DDR_dqs_p                             (DDR_dqs_p),
      .DDR_odt                               (DDR_odt),
      .DDR_ras_n                             (DDR_ras_n),
      .DDR_reset_n                           (DDR_reset_n),
      .DDR_we_n                              (DDR_we_n),
      .FIXED_IO_ddr_vrn                      (FIXED_IO_ddr_vrn),
      .FIXED_IO_ddr_vrp                      (FIXED_IO_ddr_vrp),
      .FIXED_IO_mio                          (FIXED_IO_mio),
      .FIXED_IO_ps_clk                       (FIXED_IO_ps_clk),
      .FIXED_IO_ps_porb                      (FIXED_IO_ps_porb),
      .FIXED_IO_ps_srstb                     (FIXED_IO_ps_srstb),
      
      .bd_fclk0_125m                         (bd_fclk0_125m),
      .bd_fclk1_75m                          (bd_fclk1_75m ),
      .bd_fclk2_200m                         (bd_fclk2_200m),
      .ext_reset_in                          (reset),
      .refclk_n                              (refclk_n),
      .refclk_p                              (refclk_p),
      .rxn_0                                 (rxn[0]),
      .rxn_1                                 (rxn[1]),
      .rxn_2                                 (rxn[2]),
      .rxn_3                                 (rxn[3]),
      .rxp_0                                 (rxp[0]),
      .rxp_1                                 (rxp[1]),
      .rxp_2                                 (rxp[2]),
      .rxp_3                                 (rxp[3]),
      .txn_0                                 (txn[0]),
      .txn_1                                 (txn[1]),
      .txn_2                                 (txn[2]),
      .txn_3                                 (txn[3]),
      .txp_0                                 (txp[0]),
      .txp_1                                 (txp[1]),
      .txp_2                                 (txp[2]),
      .txp_3                                 (txp[3])
   );
    
endmodule

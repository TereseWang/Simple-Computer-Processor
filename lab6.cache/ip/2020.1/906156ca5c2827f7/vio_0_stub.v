// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
// Date        : Tue Apr  5 14:44:39 2022
// Host        : WFXA4BB6DBB7727 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ vio_0_stub.v
// Design      : vio_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk, probe_in0, probe_in1, probe_in2, probe_in3, 
  probe_in4, probe_in5, probe_in6, probe_in7, probe_in8, probe_in9, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_in0[8:0],probe_in1[8:0],probe_in2[8:0],probe_in3[7:0],probe_in4[7:0],probe_in5[0:0],probe_in6[0:0],probe_in7[3:0],probe_in8[7:0],probe_in9[8:0],probe_out0[15:0]" */;
  input clk;
  input [8:0]probe_in0;
  input [8:0]probe_in1;
  input [8:0]probe_in2;
  input [7:0]probe_in3;
  input [7:0]probe_in4;
  input [0:0]probe_in5;
  input [0:0]probe_in6;
  input [3:0]probe_in7;
  input [7:0]probe_in8;
  input [8:0]probe_in9;
  output [15:0]probe_out0;
endmodule

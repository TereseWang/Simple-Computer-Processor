-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (win64) Build 2902540 Wed May 27 19:54:49 MDT 2020
-- Date        : Tue Apr  5 14:44:40 2022
-- Host        : WFXA4BB6DBB7727 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/wang.haoqi/Desktop/lab6/lab6.srcs/sources_1/ip/vio_0/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in5 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in6 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in7 : in STD_LOGIC_VECTOR ( 3 downto 0 );
    probe_in8 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    probe_in9 : in STD_LOGIC_VECTOR ( 8 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[8:0],probe_in1[8:0],probe_in2[8:0],probe_in3[7:0],probe_in4[7:0],probe_in5[0:0],probe_in6[0:0],probe_in7[3:0],probe_in8[7:0],probe_in9[8:0],probe_out0[15:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2020.1";
begin
end;

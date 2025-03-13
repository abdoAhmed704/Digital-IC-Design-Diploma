// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Mon Mar  3 09:10:43 2025
// Host        : Abdelrahman running 64-bit major release  (build 9200)
// Command     : write_verilog -force netlist_here.v
// Design      : monitor_111
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* D0_IS_1 = "3'b001" *) (* D0_NOT_1 = "3'b011" *) (* D1_IS_1 = "3'b010" *) 
(* D1_NOT_1 = "3'b100" *) (* START = "3'b000" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module monitor_111
   (Din,
    clk,
    rst,
    ERR);
  input [2:0]Din;
  input clk;
  input rst;
  output ERR;
  wire \<const1> ;
  wire [2:0]Din;
  wire [2:0]Din_IBUF;
  wire ERR;
  wire ERR_OBUF;
  wire \FSM_gray_ns_reg[0]_i_1_n_0 ;
  wire \FSM_gray_ns_reg[1]_i_1_n_0 ;
  wire \FSM_gray_ns_reg[2]_i_1_n_0 ;
  wire \FSM_gray_ns_reg[2]_i_2_n_0 ;
  wire GND_1;
  wire VCC_2;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  (* RTL_KEEP = "yes" *) wire [2:0]cs;
  wire [2:0]ns;
  wire rst;
  wire rst_IBUF;

  IBUF \Din_IBUF[0]_inst 
       (.I(Din[0]),
        .O(Din_IBUF[0]));
  IBUF \Din_IBUF[1]_inst 
       (.I(Din[1]),
        .O(Din_IBUF[1]));
  IBUF \Din_IBUF[2]_inst 
       (.I(Din[2]),
        .O(Din_IBUF[2]));
  OBUF ERR_OBUF_inst
       (.I(ERR_OBUF),
        .O(ERR));
  LUT4 #(
    .INIT(16'h0800)) 
    ERR_OBUF_inst_i_1
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(cs[2]),
        .I3(Din_IBUF[0]),
        .O(ERR_OBUF));
  (* FSM_ENCODED_STATES = "START:000,D0_NOT_1:010,D0_IS_1:001,D1_NOT_1:111,D1_IS_1:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(ns[0]),
        .Q(cs[0]));
  (* FSM_ENCODED_STATES = "START:000,D0_NOT_1:010,D0_IS_1:001,D1_NOT_1:111,D1_IS_1:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(ns[1]),
        .Q(cs[1]));
  (* FSM_ENCODED_STATES = "START:000,D0_NOT_1:010,D0_IS_1:001,D1_NOT_1:111,D1_IS_1:011" *) 
  (* KEEP = "yes" *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_gray_cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .CLR(rst_IBUF),
        .D(ns[2]),
        .Q(cs[2]));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_gray_ns_reg[0] 
       (.CLR(GND_1),
        .D(\FSM_gray_ns_reg[0]_i_1_n_0 ),
        .G(\FSM_gray_ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[0]));
  LUT4 #(
    .INIT(16'h1514)) 
    \FSM_gray_ns_reg[0]_i_1 
       (.I0(cs[2]),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(Din_IBUF[2]),
        .O(\FSM_gray_ns_reg[0]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_gray_ns_reg[1] 
       (.CLR(GND_1),
        .D(\FSM_gray_ns_reg[1]_i_1_n_0 ),
        .G(\FSM_gray_ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[1]));
  LUT4 #(
    .INIT(16'h1415)) 
    \FSM_gray_ns_reg[1]_i_1 
       (.I0(cs[2]),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(Din_IBUF[2]),
        .O(\FSM_gray_ns_reg[1]_i_1_n_0 ));
  (* XILINX_LEGACY_PRIM = "LD" *) 
  LDCE #(
    .INIT(1'b0)) 
    \FSM_gray_ns_reg[2] 
       (.CLR(GND_1),
        .D(\FSM_gray_ns_reg[2]_i_1_n_0 ),
        .G(\FSM_gray_ns_reg[2]_i_2_n_0 ),
        .GE(VCC_2),
        .Q(ns[2]));
  LUT4 #(
    .INIT(16'h0026)) 
    \FSM_gray_ns_reg[2]_i_1 
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(Din_IBUF[1]),
        .I3(cs[2]),
        .O(\FSM_gray_ns_reg[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD5)) 
    \FSM_gray_ns_reg[2]_i_2 
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .O(\FSM_gray_ns_reg[2]_i_2_n_0 ));
  GND GND
       (.G(GND_1));
  VCC VCC
       (.P(\<const1> ));
  VCC VCC_1
       (.P(VCC_2));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rst_IBUF_inst
       (.I(rst),
        .O(rst_IBUF));
endmodule

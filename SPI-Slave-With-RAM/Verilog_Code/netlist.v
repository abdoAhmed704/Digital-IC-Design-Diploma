// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Sun Mar 16 01:12:16 2025
// Host        : Abdelrahman running 64-bit major release  (build 9200)
// Command     : write_verilog C:/Users/ABDOU/Desktop/Questa-20250315T193333Z-001/Questa/project_7.v
// Design      : SPI_w_RAM
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module dbg_hub_CV
   (clk,
    sl_iport0_o,
    sl_oport0_i);
  input clk;
  output [0:36]sl_iport0_o;
  input [0:16]sl_oport0_i;


endmodule

module u_ila_0_CV
   (clk,
    probe0,
    SL_IPORT_I,
    SL_OPORT_O,
    probe1,
    probe2,
    probe3);
  input clk;
  input [0:0]probe0;
  input [0:36]SL_IPORT_I;
  output [0:16]SL_OPORT_O;
  input [0:0]probe1;
  input [0:0]probe2;
  input [0:0]probe3;


endmodule

module RAM
   (DOBDO,
    w3_tx_valid,
    MISO_reg,
    MISO_reg_0,
    clk_IBUF_BUFG,
    w4_rx_valid,
    \rx_data_reg[9] ,
    SR,
    Q,
    WEA,
    \rx_data_reg[9]_0 ,
    \counter_reg[2] ,
    E);
  output [1:0]DOBDO;
  output w3_tx_valid;
  output MISO_reg;
  output MISO_reg_0;
  input clk_IBUF_BUFG;
  input w4_rx_valid;
  input \rx_data_reg[9] ;
  input [0:0]SR;
  input [7:0]Q;
  input [0:0]WEA;
  input \rx_data_reg[9]_0 ;
  input [2:0]\counter_reg[2] ;
  input [0:0]E;

  wire \<const0> ;
  wire \<const1> ;
  wire [1:0]DOBDO;
  wire [0:0]E;
  wire MISO_reg;
  wire MISO_reg_0;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire [7:0]address;
  wire clk_IBUF_BUFG;
  wire [2:0]\counter_reg[2] ;
  wire \rx_data_reg[9] ;
  wire \rx_data_reg[9]_0 ;
  wire [7:1]w2_tx_data;
  wire w3_tx_valid;
  wire w4_rx_valid;

  GND GND
       (.G(\<const0> ));
  LUT6 #(
    .INIT(64'h000005050000303F)) 
    MISO_i_3
       (.I0(w2_tx_data[5]),
        .I1(w2_tx_data[6]),
        .I2(\counter_reg[2] [0]),
        .I3(w2_tx_data[7]),
        .I4(\counter_reg[2] [2]),
        .I5(\counter_reg[2] [1]),
        .O(MISO_reg_0));
  LUT6 #(
    .INIT(64'h05050000303F0000)) 
    MISO_i_6
       (.I0(w2_tx_data[1]),
        .I1(w2_tx_data[2]),
        .I2(\counter_reg[2] [0]),
        .I3(w2_tx_data[3]),
        .I4(\counter_reg[2] [2]),
        .I5(\counter_reg[2] [1]),
        .O(MISO_reg));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[0]),
        .Q(address[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[1]),
        .Q(address[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[2]),
        .Q(address[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[3]),
        .Q(address[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[4]),
        .Q(address[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[5]),
        .Q(address[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[6]),
        .Q(address[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \address_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[7]),
        .Q(address[7]),
        .R(SR));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,address,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,address,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,Q}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO({w2_tx_data[7:5],DOBDO[1],w2_tx_data[3:1],DOBDO[0]}),
        .ENARDEN(w4_rx_valid),
        .ENBWREN(\rx_data_reg[9] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(SR),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({WEA,WEA}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data_reg[9]_0 ),
        .Q(w3_tx_valid),
        .R(SR));
endmodule

module SPI_slave
   (w4_rx_valid,
    SR,
    MISO_OBUF,
    WEA,
    Q,
    \counter_reg[1]_0 ,
    E,
    tx_valid_reg,
    mem_reg,
    clk_IBUF_BUFG,
    rst_n_IBUF,
    ss_n_IBUF,
    MOSI_IBUF,
    DOBDO,
    w3_tx_valid,
    mem_reg_0,
    mem_reg_1);
  output w4_rx_valid;
  output [0:0]SR;
  output MISO_OBUF;
  output [0:0]WEA;
  output [7:0]Q;
  output [2:0]\counter_reg[1]_0 ;
  output [0:0]E;
  output tx_valid_reg;
  output mem_reg;
  input clk_IBUF_BUFG;
  input rst_n_IBUF;
  input ss_n_IBUF;
  input MOSI_IBUF;
  input [1:0]DOBDO;
  input w3_tx_valid;
  input mem_reg_0;
  input mem_reg_1;

  wire \<const1> ;
  wire [1:0]DOBDO;
  wire [0:0]E;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MISO_i_2_n_0;
  wire MISO_i_4_n_0;
  wire MISO_i_5_n_0;
  wire MOSI_IBUF;
  wire [7:0]Q;
  wire [0:0]SR;
  wire [0:0]WEA;
  wire check_read_i_1_n_0;
  wire clk_IBUF_BUFG;
  wire counter;
  wire \counter[0]_i_1_n_0 ;
  wire \counter[1]_i_1_n_0 ;
  wire \counter[2]_i_1_n_0 ;
  wire \counter[3]_i_2_n_0 ;
  wire [2:0]\counter_reg[1]_0 ;
  wire \counter_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire [2:0]cs;
  wire mem_reg;
  wire mem_reg_0;
  wire mem_reg_1;
  wire [2:0]ns;
  wire [1:1]p_0_in;
  wire rst_n_IBUF;
  wire [9:0]rx_data1_in;
  wire \rx_data[9]_i_1_n_0 ;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire ss_n_IBUF;
  wire tx_valid_reg;
  wire [9:8]w1_rx_data;
  wire w3_tx_valid;
  wire w4_rx_valid;

  LUT6 #(
    .INIT(64'h0407040401010101)) 
    \FSM_sequential_cs[0]_i_1 
       (.I0(ss_n_IBUF),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(p_0_in),
        .I4(MOSI_IBUF),
        .I5(cs[0]),
        .O(ns[0]));
  LUT6 #(
    .INIT(64'h0055003F00550000)) 
    \FSM_sequential_cs[1]_i_1 
       (.I0(ss_n_IBUF),
        .I1(MOSI_IBUF),
        .I2(p_0_in),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(ns[1]));
  LUT1 #(
    .INIT(2'h1)) 
    \FSM_sequential_cs[2]_i_1 
       (.I0(rst_n_IBUF),
        .O(SR));
  LUT6 #(
    .INIT(64'h550055C055005500)) 
    \FSM_sequential_cs[2]_i_2 
       (.I0(ss_n_IBUF),
        .I1(MOSI_IBUF),
        .I2(p_0_in),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(ns[2]));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[0]),
        .Q(cs[0]),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[1]),
        .Q(cs[1]),
        .R(SR));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[2]),
        .Q(cs[2]),
        .R(SR));
  LUT3 #(
    .INIT(8'h07)) 
    MISO_i_1
       (.I0(cs[0]),
        .I1(cs[2]),
        .I2(cs[1]),
        .O(MISO_i_1_n_0));
  LUT5 #(
    .INIT(32'h00000001)) 
    MISO_i_2
       (.I0(cs[0]),
        .I1(mem_reg_0),
        .I2(MISO_i_4_n_0),
        .I3(MISO_i_5_n_0),
        .I4(mem_reg_1),
        .O(MISO_i_2_n_0));
  LUT3 #(
    .INIT(8'hDF)) 
    MISO_i_4
       (.I0(w3_tx_valid),
        .I1(\counter_reg_n_0_[3] ),
        .I2(cs[2]),
        .O(MISO_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h400040C0)) 
    MISO_i_5
       (.I0(DOBDO[0]),
        .I1(\counter_reg[1]_0 [0]),
        .I2(\counter_reg[1]_0 [1]),
        .I3(\counter_reg[1]_0 [2]),
        .I4(DOBDO[1]),
        .O(MISO_i_5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(clk_IBUF_BUFG),
        .CE(MISO_i_1_n_0),
        .D(MISO_i_2_n_0),
        .Q(MISO_OBUF),
        .R(SR));
  VCC VCC
       (.P(\<const1> ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    \address[7]_i_1 
       (.I0(w4_rx_valid),
        .I1(w1_rx_data[8]),
        .O(E));
  LUT5 #(
    .INIT(32'hFFFF0042)) 
    check_read_i_1
       (.I0(cs[2]),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(rx_valid_i_2_n_0),
        .I4(p_0_in),
        .O(check_read_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    check_read_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(check_read_i_1_n_0),
        .Q(p_0_in),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00DF)) 
    \counter[0]_i_1 
       (.I0(\counter_reg[1]_0 [1]),
        .I1(\counter_reg[1]_0 [2]),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg[1]_0 [0]),
        .O(\counter[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h0FD0)) 
    \counter[1]_i_1 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg[1]_0 [2]),
        .I2(\counter_reg[1]_0 [1]),
        .I3(\counter_reg[1]_0 [0]),
        .O(\counter[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \counter[2]_i_1 
       (.I0(\counter_reg[1]_0 [2]),
        .I1(\counter_reg[1]_0 [1]),
        .I2(\counter_reg[1]_0 [0]),
        .O(\counter[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h34)) 
    \counter[3]_i_1 
       (.I0(cs[0]),
        .I1(cs[2]),
        .I2(cs[1]),
        .O(counter));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6C8C)) 
    \counter[3]_i_2 
       (.I0(\counter_reg[1]_0 [2]),
        .I1(\counter_reg_n_0_[3] ),
        .I2(\counter_reg[1]_0 [1]),
        .I3(\counter_reg[1]_0 [0]),
        .O(\counter[3]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(counter),
        .D(\counter[0]_i_1_n_0 ),
        .Q(\counter_reg[1]_0 [0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(counter),
        .D(\counter[1]_i_1_n_0 ),
        .Q(\counter_reg[1]_0 [1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(counter),
        .D(\counter[2]_i_1_n_0 ),
        .Q(\counter_reg[1]_0 [2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(counter),
        .D(\counter[3]_i_2_n_0 ),
        .Q(\counter_reg_n_0_[3] ),
        .R(SR));
  LUT3 #(
    .INIT(8'h8F)) 
    mem_reg_i_1
       (.I0(w1_rx_data[9]),
        .I1(w1_rx_data[8]),
        .I2(rst_n_IBUF),
        .O(mem_reg));
  LUT3 #(
    .INIT(8'h40)) 
    mem_reg_i_2
       (.I0(w1_rx_data[9]),
        .I1(w1_rx_data[8]),
        .I2(rst_n_IBUF),
        .O(WEA));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[0]_i_1 
       (.I0(MOSI_IBUF),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[0]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[1]_i_1 
       (.I0(Q[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[1]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[2]_i_1 
       (.I0(Q[1]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[2]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[3]_i_1 
       (.I0(Q[2]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[3]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[4]_i_1 
       (.I0(Q[3]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[4]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[5]_i_1 
       (.I0(Q[4]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[5]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[6]_i_1 
       (.I0(Q[5]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[6]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[7]_i_1 
       (.I0(Q[6]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[7]));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[8]_i_1 
       (.I0(Q[7]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[8]));
  LUT3 #(
    .INIT(8'h1F)) 
    \rx_data[9]_i_1 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .O(\rx_data[9]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0828)) 
    \rx_data[9]_i_2 
       (.I0(w1_rx_data[8]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(cs[0]),
        .O(rx_data1_in[9]));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[2]),
        .Q(Q[2]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[3]),
        .Q(Q[3]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[4]),
        .Q(Q[4]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[5]),
        .Q(Q[5]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[6]),
        .Q(Q[6]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[7]),
        .Q(Q[7]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[8]),
        .Q(w1_rx_data[8]),
        .R(SR));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_data1_in[9]),
        .Q(w1_rx_data[9]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0026)) 
    rx_valid_i_1
       (.I0(cs[1]),
        .I1(cs[2]),
        .I2(cs[0]),
        .I3(rx_valid_i_2_n_0),
        .O(rx_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFDF)) 
    rx_valid_i_2
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg[1]_0 [2]),
        .I2(\counter_reg[1]_0 [1]),
        .I3(\counter_reg[1]_0 [0]),
        .O(rx_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\rx_data[9]_i_1_n_0 ),
        .D(rx_valid_i_1_n_0),
        .Q(w4_rx_valid),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'hBA)) 
    tx_valid_i_1
       (.I0(w1_rx_data[9]),
        .I1(w4_rx_valid),
        .I2(w3_tx_valid),
        .O(tx_valid_reg));
endmodule

(* ADDR_SIZE = "8" *) (* MEM_DEPTH = "256" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module SPI_w_RAM
   (MISO,
    MOSI,
    rst_n,
    ss_n,
    clk);
  output MISO;
  input MOSI;
  input rst_n;
  input ss_n;
  input clk;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire R1_n_3;
  wire R1_n_4;
  wire S1_n_1;
  wire S1_n_12;
  wire S1_n_13;
  wire S1_n_14;
  wire S1_n_15;
  wire S1_n_16;
  wire S1_n_17;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire mem;
  wire rst_n;
  wire rst_n_IBUF;
  wire [0:36]sl_iport0_o_0;
  wire [0:16]sl_oport0_i_0;
  wire ss_n;
  wire ss_n_IBUF;
  wire [7:0]w1_rx_data;
  wire [4:0]w2_tx_data;
  wire w3_tx_valid;
  wire w4_rx_valid;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  RAM R1
       (.DOBDO({w2_tx_data[4],w2_tx_data[0]}),
        .E(S1_n_15),
        .MISO_reg(R1_n_3),
        .MISO_reg_0(R1_n_4),
        .Q(w1_rx_data),
        .SR(S1_n_1),
        .WEA(mem),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_reg[2] ({S1_n_12,S1_n_13,S1_n_14}),
        .\rx_data_reg[9] (S1_n_17),
        .\rx_data_reg[9]_0 (S1_n_16),
        .w3_tx_valid(w3_tx_valid),
        .w4_rx_valid(w4_rx_valid));
  SPI_slave S1
       (.DOBDO({w2_tx_data[4],w2_tx_data[0]}),
        .E(S1_n_15),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .Q(w1_rx_data),
        .SR(S1_n_1),
        .WEA(mem),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_reg[1]_0 ({S1_n_12,S1_n_13,S1_n_14}),
        .mem_reg(S1_n_17),
        .mem_reg_0(R1_n_4),
        .mem_reg_1(R1_n_3),
        .rst_n_IBUF(rst_n_IBUF),
        .ss_n_IBUF(ss_n_IBUF),
        .tx_valid_reg(S1_n_16),
        .w3_tx_valid(w3_tx_valid),
        .w4_rx_valid(w4_rx_valid));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* CORE_GENERATION_INFO = "dbg_hub,labtools_xsdbm_v3_00_a,{C_BSCAN_MODE=false,C_BSCAN_MODE_WITH_CORE=false,C_CLK_INPUT_FREQ_HZ=300000000,C_ENABLE_CLK_DIVIDER=false,C_EN_BSCANID_VEC=false,C_NUM_BSCAN_MASTER_PORTS=0,C_TWO_PRIM_MODE=false,C_USER_SCAN_CHAIN=1,C_USE_EXT_BSCAN=false,C_XSDB_NUM_SLAVES=1,component_name=dbg_hub_CV}" *) 
  (* DEBUG_PORT_clk = "" *) 
  (* IS_DEBUG_CORE *) 
  dbg_hub_CV dbg_hub
       (.clk(clk_IBUF_BUFG),
        .sl_iport0_o(sl_iport0_o_0),
        .sl_oport0_i(sl_oport0_i_0));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  IBUF ss_n_IBUF_inst
       (.I(ss_n),
        .O(ss_n_IBUF));
  (* CORE_GENERATION_INFO = "u_ila_0,labtools_ila_v6_00_a,{ALL_PROBE_SAME_MU=true,ALL_PROBE_SAME_MU_CNT=1,C_ADV_TRIGGER=false,C_DATA_DEPTH=1024,C_EN_STRG_QUAL=false,C_INPUT_PIPE_STAGES=0,C_NUM_OF_PROBES=4,C_PROBE0_TYPE=0,C_PROBE0_WIDTH=1,C_PROBE1_TYPE=0,C_PROBE1_WIDTH=1,C_PROBE2_TYPE=0,C_PROBE2_WIDTH=1,C_PROBE3_TYPE=0,C_PROBE3_WIDTH=1,C_TRIGIN_EN=0,C_TRIGOUT_EN=0,component_name=u_ila_0_CV}" *) 
  (* DEBUG_PORT_clk = "n:clk_IBUF_BUFG" *) 
  (* DEBUG_PORT_probe0 = "n:clk_IBUF" *) 
  (* DEBUG_PORT_probe1 = "n:MOSI_IBUF" *) 
  (* DEBUG_PORT_probe2 = "n:rst_n_IBUF" *) 
  (* DEBUG_PORT_probe3 = "n:ss_n_IBUF" *) 
  (* IS_DEBUG_CORE *) 
  u_ila_0_CV u_ila_0
       (.SL_IPORT_I(sl_iport0_o_0),
        .SL_OPORT_O(sl_oport0_i_0),
        .clk(clk_IBUF_BUFG),
        .probe0(clk_IBUF),
        .probe1(MOSI_IBUF),
        .probe2(rst_n_IBUF),
        .probe3(ss_n_IBUF));
endmodule

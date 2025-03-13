module DSP48A1(
            A, B, C, D, opmode, CARRYIN, PCIN, // inputs ports
            RSTA, RSTB, RSTC, RSTD, RSTOPMODE, RSTM, RSTCARRYIN, RSTP, // rests
            CEA, CEB, CEC, CED, CEOPMODE, CEM, CECARRYIN, CEP,  // enables
            clk, BCIN,
            PCOUT, P, CARRYOUT, CARRYOUTF, BCOUT, M// outputs
        );

////////////////////////////////

parameter RSTTYPE = "SYNC";

/// parameters for pipeline stages
parameter A0REG = 0; // no reg
parameter A1REG = 1; // reg
parameter B0REG = 0; // no reg
parameter B1REG = 1; // reg
parameter DREG = 1; // reg
parameter CREG = 1; // reg
parameter OPMODEREG = 1; // reg
parameter MREG = 1; // reg
parameter CARRYINREG = 1; //reg
parameter PREG = 1; // reg
parameter CARRYOUTREG = 1;

parameter B_INPUT = "DIRECT";
parameter CARRYINSEL = "OPMODE5";


input [7:0] opmode;
input [17:0] A, B, D, BCIN;
input [47:0] C, PCIN;
input RSTA, RSTB, RSTC, RSTD, RSTOPMODE, RSTM, RSTCARRYIN, RSTP, clk;
input CEA, CEB, CEC, CED, CEOPMODE, CEM, CECARRYIN, CEP;
input CARRYIN;

wire [17:0] A0_stg, A1_stg, B_BCIN_stg, B0_stg, B1_stg;
wire [17:0] d_stg;
wire [47:0] c_reg;
wire [7:0] op_stg;
wire [17:0] pre_add_sub, mux_out_pre_b;
wire [35:0] mul_a1_b1, mul_a1_b1_reg;
wire op5_CARRYIN_stg, op5_CARRYIN_stg2, carryout_post;
wire [47:0] mux_x_out, mux_z_out, out_post_add_sub;
// wire [47:0] d_a_b_con;

output reg [35:0] M;
output reg [17:0] BCOUT;
output reg [47:0] PCOUT;
output  [47:0] P;
output CARRYOUT;
output reg CARRYOUTF;


/// opmode reg
dff_mux #(.REG(OPMODEREG), .RSTTYPE(RSTTYPE), .SIZE(8)) opstg(opmode, clk, CEOPMODE, RSTOPMODE, op_stg);

/// Path For A
dff_mux #(.REG(A0REG), .RSTTYPE(RSTTYPE)) astg0(A, clk, CEA, RSTA, A0_stg);
dff_mux #(.REG(A1REG), .RSTTYPE(RSTTYPE)) astg1(A0_stg, clk, CEA, RSTA, A1_stg);

///////////////
/// Path For B
// mux_for_B_BCIN #(.B_INPUT(B_INPUT))  mfbb(B, BCIN, B_BCIN_stg);
mux_for_B_BCIN #(.B_INPUT(B_INPUT)) mfbb(.B(B), .BCIN(BCIN), .B_BCIN_stg(B_BCIN_stg));

dff_mux #(.REG(B0REG), .RSTTYPE(RSTTYPE)) bstg0(B_BCIN_stg, clk, CEB, RSTB, B0_stg);
/// Path For D
dff_mux #(.REG(DREG), .RSTTYPE(RSTTYPE)) dstg(D, clk, CED, RSTD, d_stg);
///////////////

/// pre-Adder/Subtracter Block
pre_add_sub pas(d_stg, B0_stg, op_stg[6], pre_add_sub);

/// SELECE pre_add_sub OR B0_stg
mux mux_add_dir(pre_add_sub, B0_stg, op_stg[4], mux_out_pre_b);

/// mux_out_pre_b -> B1
dff_mux #(.REG(B1REG), .RSTTYPE(RSTTYPE)) dff_mux_tob1(mux_out_pre_b, clk, CEB, RSTB, B1_stg);

always @(*) begin
    BCOUT = B1_stg;
end

/// multiplication of B1_stg * A1_stg:
mul mul_ba (A1_stg, B1_stg, mul_a1_b1);
dff_mux #(.REG(MREG), .RSTTYPE(RSTTYPE), .SIZE(36)) dff_mul_sig(mul_a1_b1, clk, CEM, RSTM, mul_a1_b1_reg);

always @(*) begin
    M = mul_a1_b1_reg;
end

/// Carry Cascaded
mux_for_op5_cin #(.CARRYINSEL(CARRYINSEL)) mfoc (.opcode5(op_stg[5]), .CARRYIN(CARRYIN), .op5_CARRYIN_stg(op5_CARRYIN_stg));

/// stage reg for op5_CARRYIN_stg
dff_mux #(.REG(CARRYINREG), .RSTTYPE(RSTTYPE), .SIZE(1)) op5_CARRYIN_st (op5_CARRYIN_stg, clk, CECARRYIN, RSTCARRYIN, op5_CARRYIN_stg2);

/// Path for C
dff_mux #(.REG(CREG), .RSTTYPE(RSTTYPE), .SIZE(48)) cstg(C, clk, CEC, RSTC, c_reg);


/// MUX ( X )
mux_x mxx ({d_stg[11:0], A1_stg[17:0], B1_stg[17:0]}, mul_a1_b1_reg, PCOUT, op_stg[1:0], mux_x_out);

/// MUX ( Z )
mux_z mzz(c_reg, PCIN, PCOUT, op_stg[3:2], mux_z_out);

/// post-Adder/Subtracter Block

post_add_sub pass (mux_x_out, mux_z_out, op_stg[7], op5_CARRYIN_stg2, carryout_post, out_post_add_sub);

/// PREG 
dff_mux #(.REG(PREG), .RSTTYPE(RSTTYPE), .SIZE(48)) dff_p (out_post_add_sub, clk, CEP, RSTP, P);

always @(*) begin
    PCOUT = P;
end

/// CARRY CASCADED carryout_post 

dff_mux #(.REG(CARRYOUTREG), .RSTTYPE(RSTTYPE), .SIZE(1)) cyout (carryout_post, clk, CECARRYIN, RSTCARRYIN, CARRYOUT);
always @(*) begin
    CARRYOUTF = CARRYOUT;
end



endmodule
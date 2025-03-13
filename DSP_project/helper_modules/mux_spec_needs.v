module mux_for_B_BCIN(B, BCIN, B_BCIN_stg);
parameter B_INPUT = "DIRECT";

input [17:0] B;
input [17:0] BCIN;
output reg [17:0] B_BCIN_stg;

always @(*) begin
    if (B_INPUT == "DIRECT")
        B_BCIN_stg = B;
    else if (B_INPUT == "CASCADE")
        B_BCIN_stg = BCIN;
    else
        B_BCIN_stg = 18'b0;
end

endmodule

/////////////////////////////////


module mux_for_op5_cin(opcode5, CARRYIN, op5_CARRYIN_stg);
parameter CARRYINSEL = "OPMODE5";

input opcode5, CARRYIN;
output reg op5_CARRYIN_stg;

always @(*) begin
    if (CARRYINSEL == "OPMODE5")
        op5_CARRYIN_stg = opcode5;
    else if (CARRYINSEL == "CARRYIN")
        op5_CARRYIN_stg = CARRYIN;
    else
        op5_CARRYIN_stg = 0;
end

endmodule
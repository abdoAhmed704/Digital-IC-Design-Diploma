module mux_z(c_reg, PCIN, PCOUT, OPCODE_23, out);

input [47:0] c_reg, PCIN, PCOUT;
input [1:0] OPCODE_23;
output reg [47:0] out;

always @(*) begin
    case(OPCODE_23)
        0: out = 48'b0;
        1: out = PCIN;
        2: out = PCOUT;
        3: out = c_reg;
        default: out = 48'bx;  // Catch unexpected cases
    endcase
end

endmodule


module mux_x(d_a_b_con, mul_a1_b1_reg, PCOUT, OPCODE_01, out);

input[47:0] d_a_b_con;
input[35:0] mul_a1_b1_reg;
input[47:0] PCOUT;
input[1:0] OPCODE_01;

output reg [47:0] out;

always @(*) begin
    case(OPCODE_01)
        0: out = 48'b0;
        1: out = {mul_a1_b1_reg, 12'b0};
        2: out = PCOUT;
        3: out = d_a_b_con;
        default: out = 48'bx;  // Catch unexpected cases
    endcase
end

endmodule
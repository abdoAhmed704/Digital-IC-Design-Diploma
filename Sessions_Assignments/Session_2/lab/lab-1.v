module Alu(A, B, op, out);

parameter W1 = 4;
input [W1-1: 0] A, B;
output reg [W1-1: 0] out;
input [1:0] op;

always @(*) begin
    case (op)
        2'b00: out = A + B;
        2'b01: out = A | B;
        2'b10: out = A - B;
        2'b11: out = A ^ B;
    endcase
end


endmodule
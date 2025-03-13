module Alu(A, B, op, out);
    parameter W1 = 4;
    input [W1-1:0] A, B;
    input [1:0] op;
    output reg [W1:0] out;

    wire [W1:0] add_result;

    NBitAdder #(W1) adder (
        .A(A),
        .B(B),
        .C(add_result)
    );

    always @(*) begin
        case (op)
            2'b00: out = add_result;
            2'b01: out = A | B;
            2'b10: out = A - B;
            2'b11: out = A ^ B;
            default: out = 0;
        endcase
    end
endmodule

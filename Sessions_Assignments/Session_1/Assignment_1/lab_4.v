module Even_parity_bit(input [7:0] A, output [8:0] out);

wire parity_bit;
assign parity_bit = ^A;
assign out = {A, parity_bit};

endmodule
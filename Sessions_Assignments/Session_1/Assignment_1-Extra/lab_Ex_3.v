module circuit_3(input A, B, C, output F);

wire W1, W2;

assign W1 = A ^ B;
assign W2 = B ~^ C;
assign F = W1 & W2 & C;

endmodule
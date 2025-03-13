module circuit_1(D, A, B, C, Sel, out, out_bar);
input [2:0] D;
input A, B, C, Sel;
output out, out_bar;

and(w1, D[0], D[1]);
or(w2, D[2], w1);
xnor(w3, A, B, C);

assign out = (Sel == 0) ? w2 : w3;

assign out_bar = !out;

endmodule
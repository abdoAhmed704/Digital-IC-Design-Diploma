module first_circuit (output newOut, out_bar, input A, B,C,D,E,F, selector);

wire w1, w2 ;

assign w1 = A && B && C;
assign w2 = D ~^ E ~^ F;

mux2 m(.out(newOut), .in0(w1), .in1(w2), .sel(selector));

assign out_bar = !newOut; 

endmodule
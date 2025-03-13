module mux_assign (input D0, D1, D2, S0, S1, output out);

assign out = (S0 == 0 && S1 == 1) ? D0 : (S0 == 1 && S1 == 0) ? D1 : D2;

endmodule
module circut_1 (input [3:0] A, output out);

assign out = (A > 4'b0010) & (A < 4'b1000);

endmodule
module decoder(input A0, A1, output D0, D1, D2, D3);

assign D0 = (A1 == 0 && A0 == 0) ? 1 : 0;
assign D1 = (A1 == 0 && A0 == 1) ? 1 : 0;
assign D2 = (A1 == 1 && A0 == 0) ? 1 : 0;
assign D3 = (A1 == 1 && A0 == 1) ? 1 : 0;

endmodule

module mux_assign (input D0, D1, D2, S0, S1, output reg out);

always @(*) begin 
    if (S0 == 0 && S1 == 1)
        out = D0;
    else if (S0 == 1 && S1 == 0)
        out = D1;
    else if (S1 == 1)
        out = D2;
    end

endmodule
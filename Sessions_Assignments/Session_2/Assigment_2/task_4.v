module NBitAdder #(parameter W = 1)(
    input [W-1:0] A, B,
    output [W:0] C
);
    
    assign C = A + B;

endmodule
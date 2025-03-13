module circuit_2(input reg [3:0] x, output reg [1:0] y);

always @(x) begin
    casez (x)
        4'b000? : y = 2'b00;
        4'b001? : y = 2'b01;
        4'b01?? : y = 2'b10;
        4'b1??? : y = 2'b11;
        default : y = 2'b00;
    endcase
end

endmodule
module gray_counter_fsm(input rst, clk, output [1:0] gray_output);

parameter A = 2'b00;
parameter B = 2'b01;
parameter C = 2'b11;
parameter D = 2'b10;

reg [1:0] ns, cs;

always @(*) begin
    case (cs)
        A: ns = B;
        B: ns = C;
        C: ns = D;
        D: ns = A;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        cs <= A;
    else
        cs <= ns;
end

assign gray_output = cs;

endmodule

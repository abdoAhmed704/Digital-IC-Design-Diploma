module lab(input [3:0]a, [3:0]b, [1:0]op, rst, clk, output reg [7:0]out);

reg [3:0] a_ff, b_ff;
reg [1:0] op_ff;
always @(posedge clk, posedge rst) begin
    if(rst)
        a_ff <= 0;
        b_ff <= 0;
        op_ff <= 0;
    else begin
        a_ff <= a;
        b_ff <= b;
        op_ff <= op;
    end
end

always @(posedge clk, posedge rst) begin
    if(rst)
        out <= 0;
    else begin
        case (op_ff)
            2'b00: out <= a_ff + b_ff;
            2'b01: out <= a_ff * b_ff;
            2'b10: out <= a_ff | b_ff;
            2'b11: out <= a_ff & b_ff;
        endcase
    end
end

endmodule
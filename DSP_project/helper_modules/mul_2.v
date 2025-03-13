module mul(a, b, out);
parameter SIZE = 18;
input [SIZE-1:0] a, b;
output reg [SIZE*2-1: 0] out;

always @(*) begin
    out = a * b;
end

endmodule

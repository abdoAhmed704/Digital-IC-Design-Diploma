module post_add_sub(x, z, op, carryin, carryout, out);

input [47:0] x, z;
input op, carryin; // op -> 0 addition;
output reg carryout;
output reg [47:0] out;
reg [48:0] result;

always @(*) begin
    result = (op) ? (z - x - carryin) : (z + x + carryin);
    out = result[47:0];
    carryout = result[48]; 
end

endmodule

module pre_add_sub(d, b, op, out);
input [17:0] d, b;
input op; // 0 addition
output reg [17:0] out;

always @(*) begin
    if(op)
        out = d - b;
    else
        out = d + b;
end

endmodule

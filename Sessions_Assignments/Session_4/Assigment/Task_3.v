module TDM (
    input  clk,
    input  rst,
    input  [1:0] in0,
    input  [1:0] in1,
    input  [1:0] in2,
    input  [1:0] in3,
    output reg [1:0] out
);

reg [1:0] counter;

always @(posedge clk, posedge rst) begin
    if (rst)
        counter = 0;
    else 
        counter = counter + 1;
end

always @(*) begin
    case (counter)
            0: out <= in0;
            1: out <= in1;
            2: out <= in2;
            3: out <= in3;
    endcase
end

endmodule
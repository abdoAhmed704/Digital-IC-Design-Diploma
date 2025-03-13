module DFF(d, rstn, clk, q);
    parameter k = 4;
    input [k-1:0] d, rstn, clk;
    output reg [k-1:0] q;
    always @(posedge clk, negedge rstn) begin
        if (~rstn)
            q <= 0;
        else
            q <= d;
    end
endmodule
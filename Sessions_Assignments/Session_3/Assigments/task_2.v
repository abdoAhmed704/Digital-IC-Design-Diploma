module TFF(
    input  t, rstn, clk,
    output reg q, q_bar
);

always @(posedge clk, negedge rstn) begin
    if (~rstn) q <= 1'b0;
    else begin
        if (t) q <= ~ q;
        // else q <= q // do not do this
    end
    q_bar = ~q; 
end
endmodule 
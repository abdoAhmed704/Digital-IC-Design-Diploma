module Dff(input d, rstn, clk, output reg q, q_bar);

    always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
          q <= 1'b0;
          q_bar <= 1'b1;
        end
        else begin
          q <= d;
          q_bar <= ~d;
        end
    end
endmodule
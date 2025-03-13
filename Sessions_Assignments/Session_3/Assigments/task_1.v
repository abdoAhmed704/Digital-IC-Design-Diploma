module latch(input clr, d, g, output reg q);
    always @(*) begin
        if (!clr)
            q = 1'b0;
        else if (g == 1) begin
            q = d;
        end
    end

endmodule
module gray_counter(input rst, clk, output [1:0] gray_output);

reg [1:0] bin_counter;
always @(posedge clk or posedge clk) begin
    if (rst)
        bin_counter <= 2'b00;
    else begin
        bin_counter <= bin_counter + 1;
    end
end

assign gray_output[1] = bin_counter[1];
assign gray_output[0] = ^bin_counter;

endmodule

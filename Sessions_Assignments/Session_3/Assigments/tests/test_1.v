module Latch_tb();
reg clk, d, g;
wire q;
integer i = 0;

Latch Latch_tb(clk, d, g, q);

initial begin
    clk = 0;
    forever begin
        #1 clk = ~clk;
    end
end

initial begin
    for (i = 0; i < 25; i = i + 1) begin
        d = $random;
        g = $random;
        #1;
    end 
    $stop;
end

initial begin
$monitor("Time=%0t | clk=%b | g=%b | d=%b | q=%b", $time, clk, g, d, q);

end

endmodule
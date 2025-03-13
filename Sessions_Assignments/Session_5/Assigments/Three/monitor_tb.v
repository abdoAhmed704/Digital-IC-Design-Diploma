module monitor_111_tb();
reg [2:0] Din;
reg rst, clk;
wire ERR;

monitor_111 m1(.*);

initial begin
    clk = 0;
    forever begin
        #3 clk = ~clk;
    end
end

initial begin
    rst = 1;
    Din = 3'b000;
    repeat(3)
    @(negedge clk);

    repeat(300)begin    
        rst = 0;
        Din = $random;
        repeat(3)
        @(negedge clk);
    end
    $stop;
end

initial begin
    $monitor("Din = %b, ERR = %b", Din, ERR);
end
endmodule

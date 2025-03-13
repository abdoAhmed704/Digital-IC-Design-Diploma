module FIFO_RAM_tb();
parameter FIFO_WIDTH = 16;
parameter FIFO_DEPTH = 512;
parameter ADDR = 9;

reg wen_a, ren_b, clk_a, clk_b, rst;
reg [FIFO_WIDTH - 1:0] din_a;
wire full, empty;
wire [FIFO_WIDTH - 1:0] dout_b;

FIFO_RAM F_RAM (.*);

initial begin
    clk_a = 0;
    clk_b = 0;
    forever begin
        #2 clk_a = ~clk_a;
        #2 clk_b = ~clk_b;
    end
end

initial begin
    $readmemh("mem.dat", F_RAM.RAM);
    rst = 1;
    #100
    
    rst = 0;
    #100

    // test write
    ren_b = 0;
    repeat(150)begin
        din_a = $random;
        wen_a = $random;
        #4;
    end
    
    // test read
    wen_a = 0;
    repeat(150)begin
        ren_b = $random;
        #4;
    end

    //test both
    repeat(150)begin
        din_a = $random;
        ren_b = $random;
        wen_a = $random;
        #4;
    end

    $stop;
end

endmodule
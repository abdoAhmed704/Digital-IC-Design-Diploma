module mem_tb();
parameter MEM_WIDTH = 16;
parameter MEM_DEPTH = 1024;
parameter ADDR_SIZE = 10;


reg wr_en, rd_en, blk_select, clk, rst;
reg [MEM_WIDTH-1:0] din;
reg [ADDR_SIZE-1:0] addr_wr, addr_rd;
wire [MEM_WIDTH-1:0] dout;
dpr_sync m1(din, addr_wr, addr_rd, wr_en, rd_en, blk_select, clk, rst, dout);

integer i;

initial begin
    clk = 0;
    #10 clk = ~clk;
end

initial begin 
    rst = 0;
    $readmemh("mem.dat", m1.mem);

    // Writing... ......
    rd_en = 0;
    addr_rd = 0;
    for(i = 0; i < 100; i = i + 1)begin
        blk_select = $random; 
        din = $random;
        addr_wr = $random;
        wr_en = $random;
        #1;
    end

    // reading............
    wr_en = 0;
    for(i = 0; i < 100; i = i + 1)begin
        blk_select = $random;
        addr_rd = $random;
        rd_en = $random;
        #1;
    end

    // both
    wr_en = 1;
    rd_en = 1;
    for(i = 0; i < 100; i = i + 1)begin
        blk_select = $random;
        din = $random;
        rd_en = $random;
        wr_en = $random;
        addr_rd = $random;
        addr_wr = ~addr_rd;
        #1;
    end
    $stop;
end

initial begin
    $monitor("din = %b, addr_wr = %b, addr_rd = %b, wr_en = %b, rd_en = %b, blk_select = %b, clk = %b, rst = %b, dout = %b", din, addr_wr, addr_rd, wr_en, rd_en, blk_select, clk, rst, dout);
end

endmodule
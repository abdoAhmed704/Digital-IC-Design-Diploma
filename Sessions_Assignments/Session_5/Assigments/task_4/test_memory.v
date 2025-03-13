module RAM_SINGLE_PORT_tb();

parameter MEM_WIDTH = 16;
parameter MEM_DEPTH = 1024;
parameter ADDR_SIZE = 10;
parameter ADDR_PIPELINE = "FALSE";
parameter DOUT_PIPELINE = "TRUE";
parameter PARITY_ENABLE = 1;

reg clk, rst, wr_en, rd_en, blk_select, addr_en, dout_en;
reg [MEM_WIDTH-1:0] din;
reg [ADDR_SIZE-1:0] addr;

wire [MEM_WIDTH-1:0] dout;
wire parity_out;

RAM_SINGLE_PORT#(MEM_WIDTH, MEM_DEPTH, ADDR_SIZE, ADDR_PIPELINE, DOUT_PIPELINE, PARITY_ENABLE) mem (.*);


initial begin
    clk = 0;
    forever
    #5 clk = ~clk;
end

initial begin
    $readmemh("mem.dat", mem.mem);
    rst = 1;
    addr = 0;
    addr_en = 0;
    din = 0;
    rd_en = 0;
    blk_select = 0;
    dout_en = 0;
    #50
    rst = 0;
    #100;

    repeat(150) begin
        #10
        blk_select = $random;
        din = $random;
        addr = $random;
        wr_en = $random;
        addr_en = $random;
        dout_en = $random;
    end

    wr_en = 0;
    repeat(150) begin
        #10
        blk_select = $random;
        addr = $random;
        wr_en = $random;
        addr_en = $random;
        dout_en = $random;
    end

    rd_en = 1;
    wr_en = 1;
    repeat(150) begin
        #10
        blk_select = $random;
        din = $random;
        addr = $random;
        wr_en = $random;
        rd_en = $random;
        addr_en = $random;
        dout_en = $random;
    end
    $stop;
end

endmodule
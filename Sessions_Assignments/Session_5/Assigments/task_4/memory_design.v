module RAM_SINGLE_PORT (clk, rst, din, addr, wr_en, rd_en, blk_select, addr_en, dout_en, dout, parity_out);

parameter MEM_WIDTH = 16;
parameter MEM_DEPTH = 1024;
parameter ADDR_SIZE = 10;
parameter ADDR_PIPELINE = "FALSE";
parameter DOUT_PIPELINE = "TRUE";
parameter PARITY_ENABLE = 1;

input clk, rst, wr_en, rd_en, blk_select, addr_en, dout_en;
input [MEM_WIDTH-1:0] din;
input [ADDR_SIZE-1:0] addr;

output [MEM_WIDTH-1:0] dout;
output parity_out;

// Memory Declaration
reg [MEM_WIDTH-1:0] mem [MEM_DEPTH - 1 : 0];

// we need to check if the ADDR_PIPELINE is False or not,
// if the ADDR_PIPELINE is true, you should pipline the addr
// to for examble addr_pipe
reg  [ADDR_SIZE-1:0] addr_pipe; 
wire [ADDR_SIZE-1:0]addr_inside;

// also the same as the dout. we need also the dout of the RAM[Address]
reg [MEM_WIDTH-1:0] dout_pipe, dout_after;

always @(posedge clk) begin
    if(rst)begin
        dout_pipe <= 0;
        dout_after <= 0;
        addr_pipe <= 0;
    end
    else begin
        if (addr_en)
            addr_pipe <= addr;
        if (dout_en)
            dout_pipe <= dout_after;
        if(blk_select)begin
            if (wr_en)
                mem[addr_inside] <= din;
            if (rd_en)
                dout_after <= mem[addr_inside];
        end
    end
end

assign addr_inside = (ADDR_PIPELINE == "TRUE")? addr_pipe : (ADDR_PIPELINE == "FALSE")? addr: 0;
assign dout = (DOUT_PIPELINE == "TRUE")? dout_pipe: (DOUT_PIPELINE == "FALSE")? dout_after: 0;
assign parity_out = (PARITY_ENABLE) ? ^dout : 0;

endmodule

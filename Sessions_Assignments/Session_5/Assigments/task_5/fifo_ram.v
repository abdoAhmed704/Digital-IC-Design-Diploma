module FIFO_RAM (din_a, wen_a, ren_b, clk_a, clk_b, rst, dout_b, full, empty);

parameter FIFO_WIDTH = 16;
parameter FIFO_DEPTH = 512;
parameter ADDR = 9;

input wen_a, ren_b, clk_a, clk_b, rst;
input [FIFO_WIDTH - 1:0] din_a;
output full, empty;
output reg [FIFO_WIDTH - 1:0] dout_b;
reg [FIFO_WIDTH - 1:0] RAM [FIFO_DEPTH - 1:0];

reg [ADDR:0] rd_ptr, wr_ptr;

always @(posedge clk_a) begin
    if (rst) begin
        wr_ptr <= 0;
    end
    else begin
        if (wen_a && full != 1) begin
            RAM[wr_ptr[ADDR - 1:0]] <= din_a;
            wr_ptr <= wr_ptr + 1;
        end
    end
end

always @(posedge clk_b) begin
    if (rst) begin
        rd_ptr <= 0;
    end
    else begin
        if (ren_b && empty != 1) begin
            dout_b <= RAM[rd_ptr[ADDR - 1:0]];
            rd_ptr <= rd_ptr + 1;
        end
    end
end

assign empty = (wr_ptr == rd_ptr) ? 1 : 0;
assign full = ((wr_ptr[ADDR - 1:0] == rd_ptr[ADDR - 1:0]) && (wr_ptr[ADDR] != rd_ptr[ADDR])) ? 1 : 0;
endmodule


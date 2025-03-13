module dpr_sync_tb();
    reg wr_en, rd_en, blk_select, clk, rst;
    reg [15:0] din;
    reg [9:0] addr_wr, addr_rd;
    wire [15:0] dout;

    dpr_sync m1(.*);

    integer i;

    initial begin
        clk = 0;
        forever
            #1 clk = ~clk;
    end

    // reset and initial values for inputs
    initial begin
        $readmemb("mem.dat", m1.mem);
        rst = 1;
        @(negedge clk);
        rst = 0;
        rd_en = 0;
        addr_rd = 0;

        // Test write operation only
        for (i = 0; i < 10000; i = i + 1) begin
            blk_select = $random;
            din = $random;
            addr_wr = $random;
            wr_en = $random;
            @(negedge clk);
        end

        // Read operation only
        wr_en = 0;
        for (i = 0; i < 10000; i = i + 1) begin
            blk_select = $random;
            addr_rd = $random;
            rd_en = $random;
            @(negedge clk);
        end

        // Test both read and write
        rd_en = 1;
        wr_en = 1;
        for (i = 0; i < 10000; i = i + 1) begin
            blk_select = $random;
            addr_rd = $random;
            // Avoid address collision
            addr_wr = ~addr_rd;
            rd_en = $random;
            wr_en = $random;
            din = $random;
            @(negedge clk);
        end
        $stop;
    end

    // Test monitor and results
    initial begin
        $monitor("din = %b, dout = %b, wr_en = %b, rd_en = %b, blk_select = %b, addr_rd = %b, addr_wr = %b", din, dout, wr_en, rd_en, blk_select, addr_rd, addr_wr);
    end
endmodule

module Shift_register_test();
parameter LOAD_AVALUE = 2;
parameter LOAD_SVALUE = 4;
parameter SHIFT_DIRECTION = "LEFT";
parameter SHIFT_WIDTH = 8;

reg sclr, sset, shiftin, load, clk, enable, aclr, aset;
reg  [SHIFT_WIDTH-1:0]data;
wire shiftout;
wire [SHIFT_WIDTH-1:0]q;
Shift_register #(LOAD_AVALUE, LOAD_SVALUE, SHIFT_DIRECTION, SHIFT_WIDTH) shift_r_tb (sclr, sset, shiftin, load, data, clk, enable, aclr, aset, shiftout, q);

initial begin
    clk = 0;
    forever begin
        #10 clk = ~clk;
    end
end

integer i;

//// TEST ASYNC aclr = 1 //////

initial begin
    aclr = 1;
    aset = 1;
    for (i = 0; i < 50; i = i + 1) begin
        sclr = $random;
        sset = $random;
        shiftin = $random;
        load = $random; 
        data = $random;
        enable = $random;
        @(negedge clk);
        
        if (q != 1'b0)begin
            $display("ASYNC Signal Error while aclr = 1");
            $stop;
        end
    end

//// TEST ASYNC aclr = 0 //////

    aclr = 0;
    aset = 1;
    for (i = 0; i < 50; i = i + 1) begin
        sclr = $random;
        sset = $random;
        shiftin = $random;
        load = $random; 
        data = $random;
        enable = $random;
        @(negedge clk);
        
        if (q != LOAD_AVALUE)begin
            $display("ASYNC Signal Error while aclr = 1");
            $stop;
        end
    end

//// SYNC ///// 
    aclr = 0;
    aset = 0;
    sclr = 1;
    sset = 1;
    for (i = 0; i < 50; i = i + 1) begin
        shiftin = $random;
        load = $random; 
        data = $random;
        enable = $random;
        @(negedge clk);
        
        if (q != 0)begin
            $display("Sync Signal Error while sclr = 1");
            $stop;
        end
    end


    sclr = 0;
    sset = 1;
    for (i = 0; i < 50; i = i + 1) begin
        shiftin = $random;
        load = $random; 
        data = $random;
        enable = $random;
        @(negedge clk);
        
        if (q != LOAD_SVALUE)begin
            $display("Sync Signal Error while sclr = 0");
            $stop;
        end
    end

    sset = 0;
    load = 1;
    for (i = 0; i < 50; i = i + 1) begin
        shiftin = $random;
        data = $random;
        enable = $random;
        @(negedge clk);
        
        if (q != data && enable == 1)begin
            $display("Sync Signal Error while while load is 1");
            $stop;
        end
    end


    load = 0;
    for (i = 0; i < 50; i = i + 1) begin
        shiftin = $random;
        data = $random;
        enable = $random;
        @(negedge clk);
    end
    $display("ALL TESTS PASSED :)))");
    $stop;

end


endmodule
module test_gray_counter();
reg clk, rst;

wire [1:0] gray_output, gray_output_fsm;
gray_counter gc(rst, clk, gray_output);
gray_counter_fsm gc_fsm(rst, clk, gray_output_fsm);

initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
    end
end

integer counter = 0;

initial begin
    rst = 1;
    @(negedge clk);
    if (gray_output_fsm != gray_output)begin
        $display("(1) Error");
        counter = counter + 1;
    end

    rst = 0;
    @(negedge clk);
    if (gray_output_fsm != gray_output && gray_output_fsm != 2'b00)begin
        $display("(2) Error");
        counter = counter + 1;
    end
    @(negedge clk);
    if (gray_output_fsm != gray_output && gray_output_fsm != 2'b01)begin
        $display("(3) Error");
        counter = counter + 1;
    end
    @(negedge clk);
    if (gray_output_fsm != gray_output && gray_output_fsm != 2'b11)begin
        $display("(4) Error");
        counter = counter + 1;
    end
    @(negedge clk);
    if (gray_output_fsm != gray_output && gray_output_fsm != 2'b10)begin
        $display("(5) Error");
        counter = counter + 1;
    end

    if(counter)begin
        $display("You got [%0d] Errors", counter);
    end
    else begin
        $display("All Tests Passed successfully");
    end
    $stop;
end

endmodule
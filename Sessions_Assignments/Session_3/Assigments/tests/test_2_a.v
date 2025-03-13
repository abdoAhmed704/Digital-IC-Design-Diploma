module TFF_tb();
    reg t, rstn, clk;
    reg expected_q;
    wire q, qbar;
    integer i;

    TFF tff_test(t, rstn, clk, q, qbar);

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    // Test sequence
    initial begin
        rstn = 0;
        expected_q = 0;
        // Phase 1:
        for (i = 0; i < 50; i = i + 1) begin
            t = $random;
            @(negedge clk);
            if (q !== 0) begin
                $display("Error at time %0dns: q should be 0 during reset. q = %b", $time, q);
                $stop;
            end
        end

        // Phase 2:
        rstn = 1;
        for (i = 0; i < 1000; i = i + 1) begin
            t = $random;
            @(negedge clk);
            if (t) begin
                expected_q = ~expected_q;
                if (q !== expected_q) begin
                    $display("Error at time %0dns: q = %b, expected = %b", $time, q, expected_q);
                    $stop;
                end
            end
        end

        $display("All tests passed.");
        $stop;
    end
endmodule

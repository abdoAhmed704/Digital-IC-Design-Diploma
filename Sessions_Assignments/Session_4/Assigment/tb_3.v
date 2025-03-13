module TDM_tb;

    reg clk;
    reg rst;
    reg [1:0] in0, in1, in2, in3;
    wire [1:0] out;

    TDM tdm1(.*);

    initial begin
        clk = 0;
        forever
            #5 clk = ~clk;     
    end

    initial begin
        rst = 1;
        in0 = $random;
        in1 = $random;
        in2 = $random;
        in3 = $random;
        @(negedge clk);
        if (out != in0)begin
            $display("Error in counter 0");
        end
        rst = 0;
        @(negedge clk);
        if (out != in1)begin
            $display("Error in counter 1");
        end

        @(negedge clk);
        if (out != in2)begin
            $display("Error in counter 2");
        end

        @(negedge clk);
        if (out != in3)begin
            $display("Error in counter 3");
        end

        @(negedge clk);

        $display("OUT AFTER 4 = %b", out);
        @(negedge clk);

        $display("OUT AFTER 4 = %b", out);
        @(negedge clk);

        $display("OUT AFTER 4 = %b", out);

        $display("All tests passed");
        $stop;
    end

endmodule
module latch_tb ();
    reg clr, d, g;
    wire q;
    latch la (clr, d, g, q);
    
    integer i;
    initial begin
        clr = 0;
        for (i = 0; i < 50; i = i + 1)begin
            d = $random;
            g = $random;
            #10
            if (q != 0) begin
                $display("Error here");
                $stop;
            end
        end
        clr = 1;
        for (i = 0; i < 100; i = i + 1)begin
            d = $random;
            g = $random;
            #10

            if (g && q != d) begin
                $display("Error here");
                $stop;
            end
            $display("All Tests passed");
        end
        $stop;
    end
endmodule
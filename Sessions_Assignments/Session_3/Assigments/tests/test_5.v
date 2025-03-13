module tb_sle();

wire q;
reg clk, d, en, aln, adn, sln, sd, lat;


initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

// DUT 
SLE A(q, clk, d, en, aln, adn, sln, sd, lat);


initial begin
    aln = 1'b0;
    @(negedge clk);
    aln = 1'b1;
    lat = 1'b0;

    repeat (50) begin
        d = $random;
        en = $random;
        adn = $random;
        sln = $random;
        sd = $random;
        @(negedge clk);
    end


    lat = 1'b1;

    repeat (50) begin
        d = $random;
        en = $random;
        adn = $random;
        sln = $random;
        sd = $random;
        @(negedge clk);
    end

    $stop;
end

endmodule

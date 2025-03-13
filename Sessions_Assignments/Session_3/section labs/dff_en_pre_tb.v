module dff_en_pre_tb();

reg E_tb, D_tb, clk_tb, PRE_tb;

reg Q_expected;
wire Q_dut;

dff_en_pre dff_en_pre_dut (E_tb, D_tb, clk_tb, PRE_tb, Q_dut);

initial begin
    clk_tb = 0;
    forever begin
        #5 clk_tb = ~clk_tb;
    end
end

integer i;


initial begin
    PRE_tb = 1;
    D_tb = 0;
    @(negedge clk_tb);
    PRE_tb = 0;
    for (i=0; i<20; i=i+1) begin
        E_tb = $random;
        D_tb = $random;
        if (~PRE_tb)
            Q_expected <= 1'b1;
        else if (E_tb)
            Q_expected <= D_tb;
        @(negedge clk_tb);
        if (Q_expected != Q_dut) begin
            $display("Error, Not matched");
            $stop;
        end
    end
    $stop;
end
initial begin
    $monitor("Q_expected = %b, Q_dut = %b, D_tb = %b", Q_expected, Q_dut, D_tb);
end

endmodule


endmodule
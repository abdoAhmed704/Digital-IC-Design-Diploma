module circuit_1_tb();

    reg [2:0] D_tb;
    reg A_tb, B_tb, C_tb, Sel_tb, out_expected;
    wire out_dut, out_bar_dut;
    // DUT instantiation
    circuit_1 test_circuit_1(D_tb, A_tb, B_tb, C_tb, Sel_tb, out_dut, out_bar_dut);
    integer i;

    initial begin
        for (i=0; i<25; i=i+1) begin
            D_tb = $random;
            A_tb = $random;
            B_tb = $random;
            C_tb = $random;
            Sel_tb = $random;

            out_expected = (Sel_tb == 0) ? (D_tb[2] | (D_tb[0] & D_tb[1])) : ~(A_tb ^ B_tb ^ C_tb);
            #10
            if (out_expected != out_dut)begin
                $display("Error- output not matched");
                $stop;
            end
        end
        $stop;
    end
    initial begin
        $monitor("== D_tb = %b --- A_tb =%b --- B_tb =%b --- C_tb =%b --- Sel_tb = %b --- out_dut = %b", D_tb, A_tb, B_tb, C_tb, Sel_tb, out_dut);

    end

endmodule

module NBitAdder_tb();
    parameter W = 1;
    reg [W-1:0] A_tb, B_tb;
    reg [W:0] C_expected;
    wire [W:0] C_dut;

    NBitAdder NBitAdder_test(A_tb, B_tb, C_dut);

    integer i;
    initial begin
        for (i = 0; i < 10; i = i + 1) begin
            A_tb = $random;
            B_tb = $random;
            C_expected = A_tb + B_tb;
            #10
            if (C_dut != C_expected) begin
                $display("Error outputs not matched");
                $stop;
            end 
        end
    end
    initial begin
        $monitor("A_tb = %b, B_tb = %b, C_expected = %b, C_dut = %b", A_tb, B_tb, C_expected, C_dut);
        end

endmodule
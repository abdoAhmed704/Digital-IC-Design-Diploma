module DecimalToBCD_tb();

reg [9:0] D_tb;

reg [3:0] Y_expected;
wire [3:0] Y_dut;

DecimalToBCD DecimalToBC_dut (D_tb, Y_dut);

integer i;

initial begin
    for (i=0; i<200; i=i+1) begin
        D_tb = $random;
        case (D_tb)
            10'b0000000001: Y_expected = 4'b0000;
            10'b0000000010: Y_expected = 4'b0001;
            10'b0000000100: Y_expected = 4'b0010;
            10'b0000001000: Y_expected = 4'b0011;
            10'b0000010000: Y_expected = 4'b0100;
            10'b0000100000: Y_expected = 4'b0101;
            10'b0001000000: Y_expected = 4'b0110;
            10'b0010000000: Y_expected = 4'b0111;
            10'b0100000000: Y_expected = 4'b1000;
            10'b1000000000: Y_expected = 4'b1001;
            default: Y_expected = 4'b0000;
        endcase
        #10
        if (Y_expected != Y_dut) begin
            $display("Error, Not matched");
            $stop;
        end
    end
end
initial begin
    $monitor("D_tb = %b, Y_expected = %b, Y_dut = %b", D_tb, Y_expected, Y_dut);
end

endmodule

module circuit_2_tb();
reg [3:0] x_tb;
wire [1:0] y_dut;
reg [1:0] y_expected;

circuit_2 test_circuit_2(x_tb, y_dut);

integer i;
initial begin
    for (i=0; i<30; i=i+1) begin
        x_tb = $random;
        casez (x_tb)
            4'b000? : y_expected = 2'b00;
            4'b001? : y_expected = 2'b01;
            4'b01?? : y_expected = 2'b10;
            4'b1??? : y_expected = 2'b11;
            default : y_expected = 2'b00;
        endcase

        #10
        if (y_dut != y_expected)begin
            $display("Error Unexpected output");
            $stop;
        end
    end
end
initial begin
    $monitor("x_tb = %b ---- y_dut = %b ---- y_expected = %b", x_tb, y_dut, y_expected);
end

endmodule

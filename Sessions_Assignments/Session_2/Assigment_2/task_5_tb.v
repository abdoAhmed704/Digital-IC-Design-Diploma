module Alu_tb();
    parameter W1 = 4;
    reg [W1-1:0] A_tb, B_tb;
    reg [1:0] op_tb;
    reg [W1:0] out_expected;
    wire [W1:0] out_dut;

    Alu Alu_test(A_tb, B_tb, op_tb, out_dut);

    integer i;
    initial begin
        for (i = 0; i < 100; i = i + 1) begin
            A_tb = $random; 
            B_tb = $random; 
            op_tb = $random;

            case (op_tb)
                2'b00: out_expected = A_tb + B_tb;
                2'b01: out_expected = A_tb | B_tb;
                2'b10: out_expected = A_tb - B_tb;
                2'b11: out_expected = A_tb ^ B_tb;
                default: out_expected = 0;
            endcase

            #10
            if (out_expected != out_dut) begin
                $display("Error outputs not matched");
                $stop;
            end
       
        end
    end
    initial begin 
        $monitor("A_tb = %b, B_tb = %b, op_tb = %b, out_dut = %b, out_expected = %b", A_tb, B_tb, op_tb, out_dut, out_expected);
    end
endmodule
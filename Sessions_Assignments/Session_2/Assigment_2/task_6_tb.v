module Seven_Segment_tb();
    parameter W = 4;
    reg [W-1:0] A_tb, B_tb;
    reg [1:0] op_tb;
    reg enable_tb;
    reg [6:0] seg_expected;
    wire [6:0] seg_dut;
    wire [W-1:0] alu_output;
    Seven_Segment #(4) Seven_Segment_test(
        A_tb, B_tb, op_tb, enable_tb, seg_dut);

    Alu #(W) operations(A_tb, B_tb, op_tb, alu_output);

    integer i;
    initial begin
        for (i = 0; i < 100; i = i + 1) begin
            A_tb = $random;
            B_tb = $random;
            op_tb = $random;
            enable_tb = 1;
            #1;
            case (alu_output)
                4'h0: seg_expected = 7'b1111110;
                4'h1: seg_expected = 7'b0110000;
                4'h2: seg_expected = 7'b1101101;
                4'h3: seg_expected = 7'b1111001;
                4'h4: seg_expected = 7'b0110011;
                4'h5: seg_expected = 7'b1011011;
                4'h6: seg_expected = 7'b1011111;
                4'h7: seg_expected = 7'b1110000;
                4'h8: seg_expected = 7'b1111111;
                4'h9: seg_expected = 7'b1111011;
                4'hA: seg_expected = 7'b1110111;
                4'hB: seg_expected = 7'b0011111; 
                4'hC: seg_expected = 7'b1001110;
                4'hD: seg_expected = 7'b0111101;
                4'hE: seg_expected = 7'b1001111;
                4'hF: seg_expected = 7'b1000111;
                default: seg_expected = 7'b0000000;
            endcase
            #10
            if (seg_dut != seg_expected) begin
              $display("Error outputs are not matched");
              $stop;
            end
        end
    end

    initial begin
        $monitor("alu_output = %b, seg_expected = %b, seg_dut = %b", alu_output, seg_expected, seg_dut);
    end

endmodule
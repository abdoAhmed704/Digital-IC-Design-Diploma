module DSP48A1_tb;

    // Inputs
    reg [17:0] A;
    reg [17:0] B;
    reg [47:0] C;
    reg [17:0] D;
    reg clk;
    reg rst_n;

    wire [47:0] P;

    DSP48A1 #(.OPERATION("ADD")) dut_add (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .clk(clk),
        .rst_n(rst_n),
        .P(P)
    );

    DSP48A1 #(.OPERATION("SUBTRACT")) dut_sub (
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .clk(clk),
        .rst_n(rst_n),
        .P(P)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        A = 18'b0;
        B = 18'b0;
        C = 48'b0;
        D = 18'b0;
        rst_n = 0;

        #20;
        rst_n = 1;

        A = 18'h1; B = 18'h2; C = 48'h3; D = 18'h4;
        #20;
        if (P !== 48'h9) begin
            $display("Error: Test case 1 failed. P = %h (expected 9)", P);
            $stop;
        end

        A = 18'h2; B = 18'h3; C = 48'h10; D = 18'h1;
        #20;
        if (P !== 48'h9) begin
            $display("Error: Test case 2 failed. P = %h (expected 9)", P);
            $stop;
        end

        A = 18'b0; B = 18'b0; C = 48'b0; D = 18'b0;
        #20;
        if (P !== 48'b0) begin
            $display("Error: Test case 3 failed. P = %h (expected 0)", P);
            $stop;
        end

        A = 18'h3FFF; B = 18'h3FFF; C = 48'hFFFFFFFF; D = 18'h3FFF;
        #20;
        if (P !== 48'hFFFFFFFF + (18'h3FFF * 18'h3FFF) + 18'h3FFF) begin
            $display("Error: Test case 4 failed. P = %h", P);
            $stop;
        end

        $display("All test cases passed!");
        $stop;
    end

endmodule
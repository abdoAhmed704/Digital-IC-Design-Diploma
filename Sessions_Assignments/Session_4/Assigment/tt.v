module ALSU_tb;

    // Inputs
    reg [2:0] A, B;
    reg [2:0] opcode;
    reg cin;
    reg serial_in;
    reg direction;
    reg red_op_A, red_op_B;
    reg bypass_A, bypass_B;
    reg clk, rst;

    // Outputs
    wire [5:0] out;
    wire [15:0] leds;

    // Instantiate the ALSU module
    ALSU dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .cin(cin),
        .serial_in(serial_in),
        .direction(direction),
        .red_op_A(red_op_A),
        .red_op_B(red_op_B),
        .bypass_A(bypass_A),
        .bypass_B(bypass_B),
        .clk(clk),
        .rst(rst),
        .out(out),
        .leds(leds)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle clock every 5 time units
    end

    // Test sequence
    initial begin
        // Initialize inputs
        rst = 1;
        A = 0;
        B = 0;
        opcode = 0;
        cin = 0;
        serial_in = 0;
        direction = 0;
        red_op_A = 0;
        red_op_B = 0;
        bypass_A = 0;
        bypass_B = 0;

        // Release reset
        #10;
        rst = 0;

        // Test opcode = 0 (AND operation)
        $display("Testing opcode 0 (AND operation)");

        // Test all combinations of red_op_A and red_op_B
        repeat (100) begin
            // Randomize inputs
            A = $random;
            B = $random;
            red_op_A = $random;
            red_op_B = $random;

            // Wait for two clock cycles to allow the design to process inputs
            repeat (2) @(negedge clk);

            // Check the output based on red_op_A and red_op_B
            if (red_op_A && red_op_B) begin
                if (out !== {5'b0, &A | &B}) begin
                    $display("Error: red_op_A = %b, red_op_B = %b, A = %b, B = %b, out = %b (expected %b)",
                             red_op_A, red_op_B, A, B, out, {5'b0, &A | &B});
                    $stop;
                end
            end
            else if (red_op_A) begin
                if (out !== {5'b0, &A}) begin
                    $display("Error: red_op_A = %b, red_op_B = %b, A = %b, B = %b, out = %b (expected %b)",
                             red_op_A, red_op_B, A, B, out, {5'b0, &A});
                    $stop;
                end
            end
            else if (red_op_B) begin
                if (out !== {5'b0, &B}) begin
                    $display("Error: red_op_A = %b, red_op_B = %b, A = %b, B = %b, out = %b (expected %b)",
                             red_op_A, red_op_B, A, B, out, {5'b0, &B});
                    $stop;
                end
            end
            else begin
                if (out !== A & B) begin
                    $display("Error: red_op_A = %b, red_op_B = %b, A = %b, B = %b, out = %b (expected %b)",
                             red_op_A, red_op_B, A, B, out, A & B);
                    $stop;
                end
            end
        end

        // Test edge cases explicitly
        $display("Testing edge cases for opcode 0");

        // Case 1: A = 3'b000, B = 3'b000
        A = 3'b000; B = 3'b000; red_op_A = 0; red_op_B = 0;
        repeat (2) @(negedge clk);
        if (out !== 3'b000) begin
            $display("Error: A = %b, B = %b, out = %b (expected 3'b000)", A, B, out);
            $stop;
        end

        // Case 2: A = 3'b111, B = 3'b111
        A = 3'b111; B = 3'b111; red_op_A = 0; red_op_B = 0;
        repeat (2) @(negedge clk);
        if (out !== 3'b111) begin
            $display("Error: A = %b, B = %b, out = %b (expected 3'b111)", A, B, out);
            $stop;
        end

        // Case 3: A = 3'b101, B = 3'b010
        A = 3'b101; B = 3'b010; red_op_A = 0; red_op_B = 
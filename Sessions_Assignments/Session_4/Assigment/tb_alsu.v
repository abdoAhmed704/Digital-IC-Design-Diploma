module ALSU_tb();
parameter INPUT_PRIORITY = "A";
parameter FULL_ADDER = "ON";

reg [2:0] A, B, opcode;
reg cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, clk, rst;
reg [5:0] outBefore;
wire [5:0] out;
wire [15:0] leds;

ALSU alsu_1 (A, B, opcode, cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B, clk, rst, out, leds);

initial begin
    clk = 0;
    forever begin
        #10 clk = ~clk;
    end
end

initial begin
    //////////////////////
    /// Test rst = 1 /////
    //////////////////////
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
    @(negedge clk);
    if (out != 0 || leds != 0)begin
        $display("Error in (1)");
        $stop;
    end

    //////////////////////
    /// Test bypass //////
    //////////////////////
    rst = 0;
    bypass_A = 1;
    bypass_B = 1;
    repeat(20)begin
        A       = $random;
        B       = $random;
        opcode  = $urandom_range(0, 5);
        @(negedge clk);
        @(negedge clk);
        if(INPUT_PRIORITY == "A")begin
            if(out != A || leds != 0)begin
                $display("Error in (2.1)");
                $stop;
            end
        end
        else if(INPUT_PRIORITY == "B")begin
            if(out != B || leds != 0)begin
                $display("Error in (2.2)");
                $stop;
            end
        end
    end


    ////////////////////////
    /// Test opcode 0 //////
    ////////////////////////
    bypass_A = 0;
    bypass_B = 0;
    opcode = 0;

    repeat(100)begin
        A   = $random;
        B   = $random;
        red_op_A    = $random;
        red_op_B    = $random;
        repeat(2) @(negedge clk);
        if (red_op_A && red_op_B) begin
            if ((INPUT_PRIORITY == "A" && out != &A) || ((INPUT_PRIORITY == "B" && out != &B)))begin
                $display("Error in (3.1)");
                $stop;
            end
        end
        else if (red_op_A) begin
            if(out != &A)begin
                $display("Error in (3.2)");
                $stop;
            end
        end
        else if (red_op_B) begin
            if(out != &B)begin
                $display("Error in (3.3)");
                $stop;
            end
        end
        else begin
            if(out != (A & B))begin
                $display("Error in (3.4)");
                $stop;
            end
        end
    end

    ////////////////////////
    /// Test opcode 1 //////
    ////////////////////////

    opcode = 1;
    repeat(100)begin
        A   = $random;
        B   = $random;
        red_op_A    = $random;
        red_op_B    = $random;
        repeat(2) @(negedge clk);
        if (red_op_A && red_op_B) begin
            if ((INPUT_PRIORITY == "A" && out != ^A) || ((INPUT_PRIORITY == "B" && out != ^B)))begin
                $display("Error in (4.1)");
                $stop;
            end
        end
        else if (red_op_A) begin
            if(out != ^A)begin
                $display("Error in (4.2)");
                $stop;
            end
        end
        else if (red_op_B) begin
            if(out != ^B)begin
                $display("Error in (4.3)");
                $stop;
            end
        end
        else begin
            if(out != (A ^ B))begin
                $display("Error in (4.4)");
                $stop;
            end
        end
    end
    
    ////////////////////////
    /// Test opcode 2 //////
    ////////////////////////
    red_op_A    = 0;
    red_op_B    = 0;
    opcode = 2;

    repeat(100)begin
        A = $random;
        B = $random;
        cin = $random;
        repeat(2) @(negedge clk);
        if (FULL_ADDER == "ON")begin
            if (out != A + B + cin)begin
                $display("Error in (5.1)");
                $stop;
            end
        end
            
        else if (FULL_ADDER == "OFF")
            if (out != A + B)begin
                $display("Error in (5.2)");
                $stop;
            end
        else 
            if (out != 0)begin
                $display("Error in (5.2)");
                $stop;
            end
    end

    ////////////////////////
    /// Test opcode 3 //////
    ////////////////////////
    cin = 0;
    opcode = 3;
    repeat(100) begin
        A = $random;
        B = $random;
        repeat(2) @(negedge clk);
        if (out != A * B)begin
            $display("ERROR in (6)");
            $stop;
        end
    end

    ////////////////////////
    /// Test opcode 4 //////
    ////////////////////////
    opcode = 4;
    repeat(100)begin
        outBefore = out;
        A = $random;
        B = $random;
        direction = $random;
        serial_in = $random;
    end


    ////////////////////////
    /// Test opcode 5 //////
    ////////////////////////
    opcode = 5;
    repeat(100)begin
        outBefore = out;
        A = $random;
        B = $random;
        direction = $random;
        serial_in = $random;
    end

    $display("All Tests Passed");
    $stop;
end

endmodule
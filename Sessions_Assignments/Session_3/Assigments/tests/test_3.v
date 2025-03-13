module Counter_TB;

    reg clk, rstn;  
    wire [3:0] out;
    Counter uut (
        .clk(clk),
        .rstn(rstn),
        .out(out)
    );

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end


    initial begin
        clk = 0;
        rstn = 0;

        #30;
        rstn = 1;

        #500;

        $finish;
    end
    initial begin
        $monitor("Time = %0t | Reset = %b | Count = %b", $time, rstn, out);
    end

endmodule

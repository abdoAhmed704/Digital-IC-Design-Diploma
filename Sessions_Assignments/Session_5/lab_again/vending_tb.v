module vending_machine_tb();
reg dollar, quarter, clk, rstn;
wire dispense, change;

vending_machine vm (.*);

initial begin
    clk = 0;
    forever 
        #10 clk = ~clk;
end

integer counter = 0;
initial begin

    //// reset = 0
    rstn = 0;
    quarter = 0;
    dollar = 1;
    @(negedge clk);
    if (dispense != 0 && change != 0)begin
        $display("Error in 1");
        counter = counter + 1;
    end

    quarter = 1;
    dollar = 0;
    @(negedge clk);
    if (dispense != 0 && change != 0)begin
        $display("Error in 2");
        counter = counter + 1;
    end

    //// reset = 1

    rstn = 1;
    quarter = 0;
    dollar = 1;
    @(negedge clk);
    if (dispense != 1 && change != 1)begin
        $display("Error in 3");
        counter = counter + 1;
    end

    quarter = 1;
    dollar = 0;
    @(negedge clk);
    if (dispense != 0 && change != 0)begin
        $display("Error in 4");
        counter = counter + 1;
    end

    quarter = 1;
    dollar = 0;
    @(negedge clk);
    if (dispense != 0 && change != 0)begin
        $display("Error in 5");
        counter = counter + 1;
    end

    quarter = 1;
    dollar = 0;
    @(negedge clk);
    if (dispense != 1 && change != 0)begin
        $display("Error in 6");
        counter = counter + 1;
    end

    $display("Error count is %d", counter);
    $stop;

end

initial begin
    $monitor("dollar = %b, quarter = %b, rstn = %b, dispense = %b, change = %b", dollar, quarter, rstn, dispense, change);
end

endmodule
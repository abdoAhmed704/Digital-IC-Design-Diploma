module tb_car_speed_control();

reg [7:0] speed_limit, car_speed;
reg [6:0] leading_distance;
reg clk, rst;
wire unlock_doors, accelerate_car;

parameter MIN_DISTANCE = 7'd40;

car_speed_control c1(.*);

initial begin
    clk = 0;
    forever begin
        #3 clk = ~clk;
    end
end

integer  ErrorCounter = 0;
initial begin
    //////////////////////
    /////  WHEN RESET = 1
    /////////////////////
    rst = 1;
    speed_limit = 0;
    car_speed = 0;
    leading_distance  = $random; 
    @(negedge clk);
    if (unlock_doors != 1 && accelerate_car != 0)begin
        $display("(1) Error In Reset State");
        ErrorCounter = ErrorCounter + 1;
    end

    /////////////////////////////////////////////////////////
    /////  WHEN RESET = 0 and leading_distance > MIN_DISTANCE
    /////////////////////////////////////////////////////////

    rst = 0;
    leading_distance = 7'd45;
    @(negedge clk);
    if (unlock_doors != 0 && accelerate_car != 1)begin
        $display("(2) Error while leading_distance > MIN_DISTANCE");
        ErrorCounter = ErrorCounter + 1;
    end
    
    /////////////////////////////////////////////////////////
    /////  WHEN RESET = 0 and leading_distance > MIN_DISTANCE 
    /////                 and car speed < limit
    /////////////////////////////////////////////////////////

    car_speed = 8'd65;
    speed_limit = 8'd100;
    @(negedge clk);
    if (unlock_doors != 0 && accelerate_car != 1)begin
        $display("(3) Error while speed of car < speed limit");
        ErrorCounter = ErrorCounter + 1;
    end

    /////////////////////////////////////////////////////////
    /////  WHEN RESET = 0 and leading_distance < MIN_DISTANCE 
    /////                 and car speed < limit
    /////////////////////////////////////////////////////////

    leading_distance = 7'd30;
    @(negedge clk);
    if (unlock_doors != 0 && accelerate_car != 0)begin
        $display("(4) Error here the state should be DECELERATION");
        ErrorCounter = ErrorCounter + 1;
    end

    /////////////////////////////////////////
    /////  WHEN RESET = 0  and car speed = 0;
    /////////////////////////////////////////
    car_speed = 0;
    @(negedge clk);
    if (unlock_doors != 1 && accelerate_car != 0)begin
        $display("(5) should return back to the STOP state");
        ErrorCounter = ErrorCounter + 1;
    end
    if (ErrorCounter == 0)
        $display("ALL Tests Passed");
    else 
        $display("You have [%d] Error", ErrorCounter);
    $stop;
end

initial begin
    
    $monitor("speed_limit = %d, car_speed = %d, leading_distance = %d, rst = %b, unlock_doors = %b, accelerate_car = %b", speed_limit, car_speed, leading_distance, rst, unlock_doors, accelerate_car);
end

endmodule
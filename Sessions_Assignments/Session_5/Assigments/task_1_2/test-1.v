module Tesla_Car (speed_limit, car_speed, leading_distance, clk, rst, unlock_doors, accelerate_car);

parameter MIN_DISTANCE = 7'd40; // 40 meters
parameter ACCELERATE   = 2'b00;
parameter STOP         = 2'b01;
parameter DECELERATE   = 2'b10;

input [7:0] speed_limit, car_speed;
input [6:0] leading_distance;
input clk, rst;

output reg unlock_doors, accelerate_car;
reg [1:0] ns, cs;

// Next State Logic
always @(*) begin
    case (cs)
        ACCELERATE: begin
            if ((leading_distance >= MIN_DISTANCE) && (car_speed < speed_limit))
                ns = ACCELERATE;
            else if ((leading_distance < MIN_DISTANCE) || (car_speed > speed_limit))
                ns = DECELERATE;
        end
        STOP: begin
            if (leading_distance < MIN_DISTANCE)
                ns = STOP;
            else if (leading_distance >= MIN_DISTANCE)
                ns = ACCELERATE;
        end
        DECELERATE: begin
            if ((leading_distance < MIN_DISTANCE) || (car_speed > speed_limit))
                ns = DECELERATE;
            else if ((leading_distance >= MIN_DISTANCE) && (car_speed < speed_limit))
                ns = ACCELERATE;
            else if (car_speed == 0)
                ns = STOP;
            else
                ns = STOP;
        end
        default: ns = STOP;
    endcase
end

// State Memory
always @(posedge clk or posedge rst) begin
    if (rst)
        cs <= STOP;
    else
        cs <= ns;
end

// Output Logic
always @(cs) begin
    case (cs)
        ACCELERATE: begin
            unlock_doors = 0;
            accelerate_car = 1;
        end
        STOP: begin
            unlock_doors = 1;
            accelerate_car = 0;
        end
        DECELERATE: begin
            unlock_doors = 0;
            accelerate_car = 0;
        end
    endcase
end

endmodule

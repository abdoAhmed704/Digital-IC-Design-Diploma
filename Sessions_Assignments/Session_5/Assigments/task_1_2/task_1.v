module car_speed_control(
    input [7:0] speed_limit, car_speed, 
    input [6:0] leading_distance, 
    input clk, rst, 
    output reg unlock_doors, accelerate_car
);
parameter MIN_DISTANCE = 7'd40;

parameter STOP = 2'b00;
parameter ACCELERATE = 2'b01;
parameter DECELERATE = 2'b10;

(* fsm_encoding = "sequential" *)
reg [1:0] ns, cs;

always @(*) begin
    case (cs)
        STOP: begin
            if (leading_distance < MIN_DISTANCE)
                ns = STOP;
            else
                ns = ACCELERATE; 
        end
        ACCELERATE: begin
            if (leading_distance < MIN_DISTANCE || car_speed > speed_limit) 
                ns = DECELERATE;
            else if (leading_distance >= MIN_DISTANCE && car_speed < speed_limit)
                ns = ACCELERATE;
            else 
                ns = ACCELERATE;
        end
        DECELERATE: begin
            if (leading_distance < MIN_DISTANCE || car_speed > speed_limit)
                ns = DECELERATE;
            else if (leading_distance >= MIN_DISTANCE && car_speed < speed_limit)
                ns = ACCELERATE;
            else if (car_speed == 0)
                ns = STOP;
            else 
                ns = STOP;
        end
        default: begin
            ns = STOP;
        end

    endcase
end


always @(posedge clk or posedge rst) begin
    if(rst)
        cs <= STOP;
    else begin
        cs <= ns;
    end
end

always @(cs)begin
    case (cs)
        STOP: begin
            unlock_doors = 1;
            accelerate_car = 0;
        end
        ACCELERATE: begin
            unlock_doors = 0;
            accelerate_car = 1;
        end
        DECELERATE: begin
            unlock_doors = 0;
            accelerate_car = 0;
        end

    endcase
end


endmodule
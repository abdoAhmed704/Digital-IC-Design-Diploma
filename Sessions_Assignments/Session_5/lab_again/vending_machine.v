module vending_machine(input dollar, quarter, clk, rstn, output reg dispense, change);

parameter WAIT = 2'b00;
parameter Q_50 = 2'b01;
parameter Q_25 = 2'b10;

reg [1:0] cs, ns;

// nextstage
always @(quarter, cs) begin
    case (cs)
        WAIT: begin
            if (quarter)
                ns = Q_25;
            else
                ns = WAIT;
        end
        Q_50: begin
            if (quarter)
                ns = WAIT;
            else
                ns = Q_50;
        end
        Q_25: begin
            if (quarter)
                ns = Q_50;
            else
                ns = Q_25;
        end
        default: ns = WAIT;
    endcase
end

// sequential

always @(posedge clk, negedge rstn) begin
    if (~rstn)
        cs = WAIT;
    else
        cs = ns;
end


// output

always @(cs, quarter, dollar) begin
    if ((cs == WAIT && dollar == 1'b1) || (cs == Q_50 && quarter == 1'b1))
        dispense = 1'b1;
    else
        dispense = 1'b0;

    if (cs == WAIT && dollar == 1'b1)
        change = 1'b1;
    else
        change = 1'b0;
end

endmodule
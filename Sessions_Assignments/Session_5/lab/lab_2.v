module vending_machine(input coin, clk, rstn, output reg dispense, change);

-parameter quarter = 2'b01;
parameter dollar = 2'b10;
parameter half = 2'b11;
reg [1:0] cs, nc;


//// stage  1
always @(cs) begin
    case(cs)
      quarter: nc = 3'b100;
      half: nc = 3'b100 ;
      dollar:   nc = 3'b111;
      default: nc = 3'b000;
    endcase
end
//// stage  2




always @(posedge clk or negedge rstn) begin
    if (~rstn)begin
        cs = 3'b000;
    end
    cs = nc;
end

always @(cs) begin
    case(cs)
        3'b111: begin
            change = 1;
            dispense = 1;
        end
        default: begin
            change = 0;
            dispense = 0;
        end   
    endcase
end

endmodule
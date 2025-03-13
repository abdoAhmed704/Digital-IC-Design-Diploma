module monitor_111(Din, clk, rst, ERR);
input [2:0] Din;
input clk, rst;
output ERR;

parameter START = 3'b000;
parameter D0_IS_1 = 3'b001;
parameter D1_IS_1 = 3'b010;
parameter D0_NOT_1 = 3'b011;
parameter D1_NOT_1 = 3'b100;

reg [2:0] ns, cs;

always @(*) begin
    case (cs)
        START: begin
            if(Din[2] == 1)
                ns = D0_IS_1;
            else 
                ns = D0_NOT_1;
        end
        
        D0_IS_1: begin
            if(Din[1] == 1)
                ns = D1_IS_1;
            else 
                ns = D1_NOT_1;
        end

        D0_NOT_1: ns = D1_NOT_1;
        
        D1_NOT_1: ns = START;
        
        D1_IS_1: begin
            ns = START;
        end
        default: ns = START;
    endcase
end

always @(posedge clk or posedge rst) begin
    if (rst)
        cs <= START;
    else
        cs <= ns;
end

assign ERR = (cs == D1_IS_1 && Din[0] == 1) ? 1: 0;

endmodule
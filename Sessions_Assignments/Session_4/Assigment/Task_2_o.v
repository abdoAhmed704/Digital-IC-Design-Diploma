module DSP48A1 (
    input  [17:0] A,     
    input  [17:0] B,     
    input  [47:0] C,     
    input  [17:0] D,     
    input  clk,         
    input  rst_n,    
    output reg [47:0] P  
);
parameter OPERATION = "ADD"; // Default operation is ADD

reg  [17:0] A_F1, A_F2;      
reg  [17:0] B_F1;     
reg  [47:0] C_F1;     
reg  [17:0] D_F1;
reg  [17:0] add_a_b, add_a_b_F2;


always @(posedge clk, negedge rst_n) begin
    if(~rst_n)begin
        P <= 0;
        A_F1 <= 0;
        B_F1 <= 0;
        C_F1 <= 0;
        D_F1 <= 0;
    end
    else begin
        A_F1 <= A;
        B_F1 <= B;
        C_F1 <= C;
        D_F1 <= D;

        add_a_b = (OPERATION == "ADD")? (B_F1 + D_F1): (B_F1 - D_F1);
        
        A_F2 <= A_F1;
        add_a_b_F2 <= add_a_b;

        multiplier_out <= add_a_b_F2 * A_F2;
        multiplier_out_F3 <= multiplier_out;

        Final_add = (OPERATION == "ADD")? (multiplier_out_F3 + C_F1): (multiplier_out_F3 - C_F1);
        p <= Final_add;
    end
end

endmodule
module dsp_module_1 (
    input  [17:0] A,     
    input  [17:0] B,     
    input  [47:0] C,     
    input  [17:0] D,     
    input  clk,         
    input  rst_n,    
    output reg [47:0] P  
);

parameter OPERATION = "ADD"; // Default operation is ADD
wire [17:0] add_sub_1;
reg [17:0] add_sub_1_f2;
wire [47:0] add_sub_2;

wire [35:0] multiplier_out;
reg [35:0] multiplier_out_F3;


reg  [17:0] A_F1;   
reg  [17:0] A_F2;     
reg  [17:0] B_F1;     
reg  [47:0] C_F1;     
reg  [17:0] D_F1;

always @(posedge clk, negedge rst_n) begin
    if(~rst_n)begin
        P <= 0;
    end
    else begin
        A_F1 <= A;
        B_F1 <= B;
        C_F1 <= C;
        D_F1 <= D;
    end
end

assign add_sub_1 = (OPERATION == "ADD") ? (D_F1 + B_F1): (D_F1 - B_F1);


always @(posedge clk, negedge rst_n) begin
    A_F2 <= A_F1;
    add_sub_1_f2 <= add_sub_1;
end

assign multiplier_out = add_sub_1_f2 * A_F2; // 18 + 18 = 36

always @(posedge clk, negedge rst_n) begin
    multiplier_out_F3 <= multiplier_out;
end
// 36 + 48 -> 48
assign add_sub_2 = (OPERATION == "ADD") ? (multiplier_out_F3 + C_F1): (multiplier_out_F3 - C_F1);

always @(posedge clk, negedge rst_n) begin
    P <= add_sub_2;
end

endmodule
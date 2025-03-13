module dff (D, clk, enable, rst, Q);

parameter SIZE = 18;
parameter RSTTYPE = "SYNC";

input [SIZE-1:0]  D;
input enable, rst, clk;
output reg [SIZE-1:0]  Q;

generate 
    if (RSTTYPE == "SYNC")begin
        always @(posedge clk or posedge rst) begin
            if(rst)
                Q <= 0;
            else begin
                if (enable)
                    Q <= D;
            end
        end
    end
    else begin
        always @(posedge clk) begin
            if(rst)
                Q <= 0;
            else begin
                if (enable)
                    Q <= D;
            end
        end
    end
endgenerate

endmodule
//////////////////////////////////////////////////////////////////////////


module mux(a, b, sel, out);

parameter SIZE = 18;

input [SIZE-1:0] a; // THE DFF OUTPUT 
input [SIZE-1:0] b;
input sel; // = 1; registered
output reg [SIZE-1:0] out;

always @(*) begin
    out = (sel) ? a : b;
end

endmodule

///////////////////////////////////////////////////////////

module mux_param(a, b, out);

parameter SIZE = 18;
parameter REG = 1; // reg

input [SIZE-1:0] a; // THE DFF OUTPUT 
input [SIZE-1:0] b;

output reg [SIZE-1:0] out;

always @(*) begin
    out = (REG) ? a : b;
end

endmodule


///////////////////////////////////////////////////////////


module dff_mux(a, clk, enable, RST, out);

parameter REG = 1; // reg
parameter SIZE = 18;
parameter RSTTYPE = "SYNC";

input [SIZE-1:0] a;
input clk, RST, enable;
output [SIZE-1:0] out;
wire [SIZE-1:0] out_tmp;

dff #(.SIZE(SIZE), .RSTTYPE(RSTTYPE)) d1 (a, clk, enable, RST, out_tmp);

mux_param #(.SIZE(SIZE), .REG(REG)) mx_p_sr (out_tmp, a, out);

endmodule

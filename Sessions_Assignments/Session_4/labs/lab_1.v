module Alu(output reg out,input[3:0]a,b,input[1:0]opcode,input rst ,clk);
reg[3:0]a_temp,b_temp;
reg[1:0]opcode_temp;
always@(posedge clk,posedge rst)begin
  if(rst)begin
  a_temp=4'b0000;
  b_temp=4'b0000;
opcode_temp=2'b00;
end
else begin
a_temp<=a;
b_temp<=b;
opcode_temp<=opcode;
end
end

always@(posedge clk,posedge rst)begin
if(rst)begin
out<=0;
end
else 
case(opcode_temp)
2'b00: out<=a_temp+b_temp;
2'b01: out<=a_temp*b_temp;
2'b10: out<=a_temp|b_temp;
2'b11: out<=a_temp&b_temp;
endcase 
end

/*always@(posedge clk,negedge rst)begin
if(!rst)begin
out<=0;
end
else 
out<=out_temp;
end*/
endmodule
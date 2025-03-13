module ALSU(
    input [2:0] A_,
    input [2:0] B_,
    input [2:0] opcode_,
    input cin_, serial_in_, direction_, 
    input red_op_A_, red_op_B_, bypass_A_,
    input bypass_B_, clk, rst,
    output reg [5:0] out,
    output reg [15:0] leds
);

parameter INPUT_PRIORITY = "A";
parameter FULL_ADDER = "ON";

reg [2:0] A, B;
reg [2:0] opcode;
reg cin, serial_in, direction, red_op_A, red_op_B, bypass_A, bypass_B;

wire[5:0] out_mul;

//FIRST IP:
mult_gen_0 m1 (
  .A(A),  // input wire [2 : 0] A
  .B(B),  // input wire [2 : 0] B
  .P(out_mul)  // output wire [5 : 0] P
);

//SECOND IP
// No time sorry :(

assign Invalid_reg = (red_op_B | red_op_A) & (opcode[1] | opcode[2]);
assign Invalid_opcode = opcode[1] & opcode[2];
assign Invalid = Invalid_reg | Invalid_opcode;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        A <= 0;
        B <= 0;
        opcode <= 0;
        cin <= 0;
        serial_in <= 0;
        direction <= 0;
        red_op_A <= 0;
        red_op_B <= 0;
        bypass_A <= 0;
        bypass_B <= 0;
    end
    else begin
        A <= A_;
        B <= B_;
        opcode <= opcode_;
        cin <= cin_;
        serial_in <= serial_in_;
        direction <= direction_;
        red_op_A <= red_op_A_;
        red_op_B <= red_op_B_;
        bypass_A <= bypass_A_;
        bypass_B <= bypass_B_;
    end
end

// Leds blinking
always @(posedge clk, posedge rst) begin
    if (rst)
        leds <= 0;
    else begin
        if (Invalid)
            leds <= ~leds;
        else
            leds <= 0;
    end
end

always @(posedge clk, posedge rst) begin
    if (rst)
        out <= 0;
    else
    begin
        if (bypass_A && bypass_B) begin
                if(INPUT_PRIORITY == "A")
                    out <= A;
                else if (INPUT_PRIORITY == "B")
                    out <= B;
                else
                    out <= 6'b0;
        end
        else if (bypass_A)
            out <= A;
        else if (bypass_B)
            out <= B;
        else if(Invalid)
            out <= 0;
        else begin
            case (opcode)
                0:  begin // AND operation
                        if (red_op_A && red_op_B) begin
                            
                            out <= (INPUT_PRIORITY == "A") ? &A : &B;
                        end
                        else if (red_op_A) begin
                        
                            out <= &A;
                        end
                        else if (red_op_B) begin
                            out <= &B;
                        end
                        else begin
                            out <= A & B;
                        end
                    end
                1: begin // AND operation
                        if (red_op_A && red_op_B) begin
                            
                            out <= (INPUT_PRIORITY == "A") ? ^A : ^B;
                        end
                        else if (red_op_A) begin
                        
                            out <= ^A;
                        end
                        else if (red_op_B) begin
                            out <= ^B;
                        end
                        else begin
                            out <= A ^ B;
                        end
                    end
                2: begin
                        if (FULL_ADDER == "ON")
                            out <= A + B + cin;
                        else if (FULL_ADDER == "OFF")
                            out <= A + B;
                        else 
                            out <= 0;
                    end
                3: out <= out_mul;
                4: out <= (direction) ? {out[4:0], serial_in}: {serial_in, out[5:1]};
                5: out <= (direction) ? {out[4:0], out[5]}: {out[0], out[5:1]};
            endcase
        end 
    end
end
endmodule
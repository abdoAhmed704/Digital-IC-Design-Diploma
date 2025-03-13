module Shift_register #(
    parameter   LOAD_AVALUE = 1, LOAD_SVALUE = 1,
                SHIFT_DIR = "LEFT",
                SHIFT_WIDTH = 8
    )(
    input   sclr, sset, shiftin,  
            load, [SHIFT_WIDTH-1:0]data,
            clk, enable, aclr, aset,
    output reg shiftout, [SHIFT_WIDTH-1:0]q 
    );


always @(posedge clk, posedge aclr, posedge aset) begin
    if (aclr)
      q <= 1'b0;
    else if (aset)
      q <= LOAD_AVALUE;
    else begin
        if(enable)
        begin
            if(sclr)
              q <= 0;
            else if(sset)
              q <= LOAD_SVALUE; 
            else if(load)
              q <= data;
              
            else begin
              if (SHIFT_DIR == "LEFT")
                {shiftout, q} <= {q, shiftin};
              else if (SHIFT_DIR == "RIGHT")
                {q, shiftout} <= {shiftin, q};
              end
            end
      end
end
endmodule
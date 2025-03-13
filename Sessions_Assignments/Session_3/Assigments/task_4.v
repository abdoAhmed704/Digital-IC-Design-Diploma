module D_T_FF #(parameter FF_TYPE = "DFF")  (input d, rstn , clk, output reg q, qbar);

always @(posedge clk or negedge rstn) begin
        if(~rstn)begin
        	q <= 1'b0;
        	qbar <= 1'b1;
        end
        else begin
        	if (FF_TYPE == "DFF")begin
                q <= d;
                qbar <= ~d;
            end
            else if (FF_TYPE == "TFF") begin
                if (d) begin
                	q <= ~q;
					qbar <= ~qbar;
                end
            end
        end 
end



endmodule
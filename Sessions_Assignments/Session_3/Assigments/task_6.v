module SLE_6(d, clk, en, aln, adn, sln, sd, lat, q);

input d, clk, en, aln, adn, sln, sd, lat;
output reg q;

always @(posedge clk, negedge aln) begin
    if (~aln)
        q <= adn;
    else begin
        if (en)begin
            if(~sln)
                q <= sd;
            else
                q <= d;
        end
    end
end
    
endmodule
module mux_3_tb();

reg D0_tb, D1_tb, D2_tb, S0_tb, S1_tb;
wire out_assign, out_always;

mux_assign Mux_assi (D0_tb, D1_tb, D2_tb, S0_tb, S1_tb, out_assign);
mux_assign Mux_always (D0_tb, D1_tb, D2_tb, S0_tb, S1_tb, out_always);
integer i;

initial begin
    for (i = 0; i < 99; i = i + 1) begin
        D0_tb = $random; 
        D1_tb = $random; 
        D2_tb = $random; 
        S0_tb = $random; 
        S1_tb = $random;
        #10
        if (out_assign != out_always) begin
            $display("Error -- Muxes is not matches");
            $stop;
        end
    end
    $stop;
end

initial begin
    $monitor("D0_tb = %b, D1_tb = %b, D2_tb = %b, S0_tb = %b, S1_tb = %b, out_assign = %b, out_always = %b", D0_tb, D1_tb, D2_tb, S0_tb, S1_tb, out_assign, out_always);
    end
endmodule
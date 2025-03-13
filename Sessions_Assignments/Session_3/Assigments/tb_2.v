module TFF_tb();
reg t, rstn, clk, q_ex;
wire q, q_bar;

TFF tff_tb(t, rstn, clk, q, q_bar);

initial begin
        clk = 0;
        forever #2 clk = ~clk;
end

integer i;

initial begin 
    rstn = 1;
    for(i = 0; i < 100; i = i + 1)begin
        t = $random;
        #10;
    end
    $display("All Tests Passed");
end


endmodule
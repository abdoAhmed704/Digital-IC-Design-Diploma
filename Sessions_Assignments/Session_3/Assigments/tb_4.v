module FF_tb();
    parameter FF_TYPE = "DFF"; //TFF

    reg d, rstn , clk;

    wire q_From_DFF, qbar_From_DFF;

    wire q_From_D_T_FF, qbar_From_D_T_FF;

    D_T_FF #(.FF_TYPE(FF_TYPE)) d_t_ff( d, rstn , clk, q_From_D_T_FF, qbar_From_D_T_FF);
    
    Dff dff_tb (d, rstn , clk,  q_From_DFF, qbar_From_DFF);

    initial begin
        clk = 0; 
        forever begin
          #10 clk = ~clk;
        end
    end

    integer i;

    initial begin
        rstn = 1;
        for(i = 0; i < 100; i = i + 1)begin
            d = $random;
            #10
            if((q_From_D_T_FF != q_From_DFF) && (qbar_From_D_T_FF != qbar_From_DFF)) begin
                $display("Error");
                $stop;
            end
        end
        $display("All Tests Passed");
        $stop;
    end
    initial begin
        $monitor("q_From_D_T_FF = %b, q_From_DFF = %b", q_From_D_T_FF, q_From_DFF);
    end
endmodule
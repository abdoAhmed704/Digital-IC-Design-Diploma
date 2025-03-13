module shift_register_tb();

//parameters
parameter LOAD_AVALUE=2;
parameter SHIFT_DIRECTION=1;
parameter LOAD_SVALUE=4;
parameter SHIFT_WIDTH=8;

//signal declaration
integer i;
wire [SHIFT_WIDTH-1:0]q;
reg [SHIFT_WIDTH-1:0]qexp;
wire shiftout;
reg shiftoutexp;
reg sclr,sset,shiftin,load,clk,enable,aclr,aset;
reg [SHIFT_WIDTH-1:0]data;


//clk generation
initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

//DUT instantiation
shift_register #(
                .LOAD_AVALUE(LOAD_AVALUE),
                .SHIFT_DIRECTION(SHIFT_DIRECTION),
                .LOAD_SVALUE(LOAD_SVALUE),
                .SHIFT_WIDTH(SHIFT_WIDTH)
) sr (q,shiftout,sclr,sset,shiftin,load,clk,enable,aclr,aset,data);



initial begin

    aclr=1'b1;
    aset=1'b1;
    for (i = 0; i < 50; i = i + 1) begin
        sclr = $random;
        sset = $random;
        shiftin = $random;
        load = $random;
        enable = $random;
        data = $random;

        @(negedge clk);

        if(q != 0) begin
            $display("error");
            $stop;
        end
    end
    $stop;


    aclr = 1'b0;
    aset = 1'b1;
    for (i = 50; i < 100; i = i + 1) begin
        sclr = $random;
        sset = $random;
        shiftin = $random;
        load = $random;
        enable = $random;
        data = $random;

        @(negedge clk);

        if (q != LOAD_AVALUE)begin
            $display("error");
            $stop;
        end
    end

    $stop;


    aclr = 1'b0;
    aset = 1'b0;
    sclr = 1'b1;
    sset = 1'b1;
    enable = 1'b1;
    for(i = 100; i < 150; i = i + 1) begin
        shiftin = $random;
        load = $random;
        data = $random;

        @(negedge clk);

        if(q != 0)begin
            $display("error");
            $stop;
        end
    end
    $stop;

    aclr = 1'b0;
    aset = 1'b0;
    sclr = 1'b0;
    sset = 1'b1;
    enable = 1'b1;
    for(i = 150; i < 200; i = i + 1)begin
        shiftin = $random;
        load = $random;
        data = $random;

        @(negedge clk);

        if(q != LOAD_SVALUE)begin
            $display("error");
            $stop;
        end
    end
    $stop;
 
    aclr = 1'b0;
    aset = 1'b0;
    sclr = 1'b0;
    sset = 1'b0;
    load = 1'b1;
    enable = 1'b0;
    for(i=200;i<250;i=i+1)begin
        shiftin=$random;
        data=$random;

        if(load) qexp<=data;
  
            else if((!load) && (SHIFT_DIRECTION == 1)) begin   
            qexp <= {qexp[SHIFT_WIDTH-2:0], shiftin};           
            shiftoutexp <= qexp[SHIFT_WIDTH-1];
            end
            else if((!load) && (SHIFT_DIRECTION==0))begin  
                qexp <= {shiftin,qexp[SHIFT_WIDTH-1:1]};
                shiftoutexp <= qexp[0];
            end

        @(negedge clk);
 
         if(q!=qexp)begin
            $display("error");
            $stop;
        end
    end
    $stop;


    aclr = 1'b0;
    aset = 1'b0;
    sclr = 1'b0;
    sset = 1'b0;
    load = 1'b0;
    enable=1'b0;
    for(i=250; i<300; i=i+1)begin
    shiftin = $random;
    data = $random;


    if(load) qexp<=data;
  
        else if((!load) && (SHIFT_DIRECTION==1)) begin
        qexp<={qexp[SHIFT_WIDTH-2:0],shiftin};           
        shiftoutexp<=qexp[SHIFT_WIDTH-1];
        end
        else if((!load)&&(SHIFT_DIRECTION==0))begin
            qexp<={shiftin,qexp[SHIFT_WIDTH-1:1]};
            shiftoutexp<=qexp[0];
        end

    @(negedge clk);

    if(q!=qexp)begin
        $display("error");
        $stop;
    end
    end
    $stop;

end

endmodule
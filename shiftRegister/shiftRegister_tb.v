module testbench;

    reg clk;
    reg d;
    wire [3:0] q;

    top dut (
        .clk(clk),
        .d(d),
        .q(q)
    );
    always begin
        #5 clk = ~clk;
    end
    initial begin
        $monitor("time is %0t, clk = %b, d = %b, q = %b.", $time, clk, d, q);
        clk = 0;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        d = 0;
        #10;
        d = 1;
        #10;
        
        #50;
        $finish;

    end

endmodule
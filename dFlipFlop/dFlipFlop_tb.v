module testbench;

    reg clk;
    reg d;
    wire q;

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
        #12;
        d = 1;
        #20;
        $finish;

    end

endmodule
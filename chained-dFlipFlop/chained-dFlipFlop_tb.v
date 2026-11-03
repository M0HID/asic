module testbench;

    reg clk;
    reg d;
    wire q1;
    wire q2;
    wire q3;
    wire q4;

    top dut (
        .clk(clk),
        .d(d),
        .q4(q4),
        .q1(q1),
        .q2(q2),
        .q3(q3)
    );
    always begin
        #5 clk = ~clk;
    end
    initial begin
        $monitor("time is %0t, clk = %b, d = %b, q1 = %b, q2 = %b, q3 = %b, q4 = %b.", $time, clk, d, q1, q2, q3, q4);
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
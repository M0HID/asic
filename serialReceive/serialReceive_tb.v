module testbench;

    reg clk;
    reg d;
    reg sample;
    reg reset;
    wire [7:0] q;
    wire [3:0] count;
    wire done;

    serialReceive dut (
        .clk(clk),
        .d(d),
        .sample(sample),
        .reset(reset),
        .q(q),
        .count(count),
        .done(done)
    );
    always begin
        #5 clk = ~clk;
    end
    initial begin
        sample = 1;
        reset = 1;
        clk = 0;
        d = 0;
        $monitor("time is %0t, clk = %b, d = %b, q = %b, count = %0d, done = %b", $time, clk, d, q, count, done);

        #10;
        reset = 0;
        d = 1;
        #10;
        d = 1;
        #10;
        d = 0;
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
        sample = 0;
        #10;
        $finish;

    end

endmodule
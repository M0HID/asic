module testbench;
    reg clk;
    reg reset;
    reg enable;
    wire sample;
    wire [3:0] count;
    wire done;
    reg d;
    wire [7:0] q;


    sampleGen timer (
        .clk(clk),
        .rst(reset),
        .tick(sample),
        .enable(enable)
    );

    serialReceive receiver (
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
        clk = 0;
        d = 1;
        enable = 0;
        reset = 1;
        #10;
        reset = 0;
        $monitor("Sample is %b, count is at %0d, q is %b, enable state is %b and done is %b.", sample, count, q, enable, done);
        #50
        enable = 1;
        #50;
        d = 0;
        #40;
        d = 1;
        #40;
        d = 1;
        #40;
        d = 0;
        #40;
        d = 0;
        #40;
        d = 1;
        #40;
        d = 0;
        #40;
        d = 1;
        #40;
        d = 0;
        #40;
        
        d = 1;
        #50;
        d = 1;
        #80;
        $finish;
    end
endmodule
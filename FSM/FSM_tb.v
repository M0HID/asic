module testbench;
    reg clk;
    reg rst;
    reg start;
    wire [1:0] state;
    top dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .state(state)
    );

    always begin
        #5 clk = ~clk;
    end
    initial begin
        $monitor("Current state is: %b. Clock is %b", state, clk);
        clk = 0;
        start = 0;
        rst = 1;
        #10;
        rst = 0;
        #10
        start = 1;
        #100;
        $finish;
    end
endmodule
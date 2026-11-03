module testbench;
    reg clk;
    reg rst;
    wire [3:0] count;
    wire tick;

    sampleGen dut (
        .clk(clk),
        .rst(rst),
        .count(count),
        .tick(tick)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin 
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        $monitor("Count is %b and tick is %b", count, tick);
        #100;
        $finish;
    end
endmodule
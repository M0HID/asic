module testbench;
    reg clk;
    reg rst;
    wire [3:0] count;

    top dut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always begin
        #5 clk = ~clk;
    end

    initial begin 
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
        $monitor("Count is %b", count);
        #100;
        $finish;
    end
endmodule
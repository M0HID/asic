module testbench;

    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] out;

    top dut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin

        a = 8'b01010100;
        b = 8'b10101001;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        a = 8'b01110101;
        b = 8'b01101010;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        $finish;

    end

endmodule
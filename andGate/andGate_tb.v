module testbench;

    reg a;
    reg b;
    wire out;

    top dut (
        .a(a),
        .b(b),
        .out(out)
    );

    initial begin

        a = 0;
        b = 0;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        a = 1;
        b = 0;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        a = 0;
        b = 1;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        a = 1;
        b = 1;
        #10;
        $display("a = %b, b = %b, out = %b", a, b, out);

        $finish;

    end

endmodule
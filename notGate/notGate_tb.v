module testbench;

    reg a;
    wire out;

    top dut (
        .a(a),
        .out(out)
    );

    initial begin

        a = 0;
        #10;
        $display("a = %b, out = %b", a, out);

        a = 1;
        #10;
        $display("a = %b, out = %b", a, out);

        $finish;

    end

endmodule
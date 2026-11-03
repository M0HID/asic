module testbench;

    reg a;
    reg b;
    reg c;
    wire out;
    integer i;

    top dut (
        .a(a),
        .b(b),
        .c(c),
        .out(out)
    );

    initial begin

        for (i = 0; i < 8; i=i+1) begin
            a = i[2];
            b = i[1];
            c = i[0];
            #10;
            if (out != ((a & b) | c)) begin
                $display("Error for value %b, %b, %b. Should be %b, but actually was %b.", a, b, c, (a & b) | c, out);
            end
        end
        $finish;

    end

endmodule
module top (
    input a,
    input b,
    input c,
    output out
);

    assign out = c | a & b;

endmodule
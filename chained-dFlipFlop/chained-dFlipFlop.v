module top (
    input clk,
    input d,
    output reg q4,
    output reg q1,
    output reg q2,
    output reg q3
    
);

    always @(posedge clk) begin
        q4 <= q3;
        q3 <= q2;
        q2 <= q1;
        q1 <= d;
    end

endmodule
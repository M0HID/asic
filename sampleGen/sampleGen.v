module sampleGen (
    input clk,
    input rst,
    input enable,
    output reg [3:0] count,
    output tick
);
    assign tick = (count == 3);
    always @(posedge clk) begin
        if (rst) begin
            count <= 0;
        end else if (enable) begin
            if (count < 3) begin
                count <= count + 1;
            end else begin
                count <= 0;
            end
        end else begin
            count <= 0;
        end
    end

endmodule
module serialReceive (
    input clk,
    input d,
    input sample,
    input reset,
    output reg done,
    output reg [7:0] q,
    output reg [3:0] count,
    output reg [1:0] state,
    output enable
    // 00: WAITING      01: RECEIVING       10: STOP           11: finished
);
    always @(posedge clk) begin
        if (reset) begin
            q <= 8'b00000000;
            count <= 0;
            state <= 0;
            done <= 0;
        end else if (state < 3) begin
            if (state == 0 && d == 0) begin
                state <= 1;
            end else if (sample && state == 1) begin
                q <= {d, q[7:1]};
                count <= count + 1;
                if (count == 7) begin
                    state <= 2;
                end
            end else if (sample && state == 2) begin
                if (d) begin
                    done <= 1;
                end else begin
                    q <= 8'b00000000;
                end
                state <= 3;
            end
        end
    end

endmodule
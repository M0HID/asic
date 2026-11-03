module top (
    input clk,
    input rst,
    input start,
    output reg [1:0] state
);

    always @(posedge clk) begin
        if (rst) begin
            state <= 2'b00;
        end else begin
            case (state)
            // 00: IDLE    01: START    10: DATA    11: STOP
                2'b00: begin
                    if (start) begin
                        state <= 2'b01;
                    end else begin
                        state <= 2'b00;
                    end
                end
                2'b01: state <= 2'b10;
                2'b10: state <= 2'b11;
                2'b11: state <= 2'b00;
            endcase
        end
    end


endmodule
`timescale 1ns / 1ps

module sequence_detector(
    input  stream,
    input  clk,
    input  reset,
    output reg out
);
    localparam S1 = 3'b000;  // IDLE
    localparam S2 = 3'b001;  // got 1
    localparam S3 = 3'b010;  // got 10
    localparam S4 = 3'b011;  // got 101
    localparam S5 = 3'b100;  // got 1011 ? DETECT

    reg [2:0] current_state, next_state;

    // Block 1 - State Register
    always @(posedge clk) begin
        if (reset) current_state <= S1;
        else       current_state <= next_state;
    end

    // Block 2 - Next State Logic
    always @(*) begin
        case(current_state)
            S1:      next_state = stream ? S2 : S1;
            S2:      next_state = stream ? S2 : S3; // 1?S2 stays, not reset
            S3:      next_state = stream ? S4 : S1;
            S4:      next_state = stream ? S5 : S3; // overlap on 0
            S5:      next_state = stream ? S2 : S1; // overlap after detect
            default: next_state = S1;
        endcase
    end

    // Block 3 - Output Logic (Moore)
    always @(*) begin
        out = (current_state == S5) ? 1'b1 : 1'b0;
    end

endmodule
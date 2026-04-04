`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 18:58:02
// Design Name: 
// Module Name: output_stage
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module output_stage(
input clk,
input rst,
input s3_zero,
input s3_carry,
input s3_sign,
input s3_overflow,
input [15:0]s3_c,
input s3_valid,
output reg [15:0] result,
output reg   flag_zero,
output reg   flag_sign,
output reg   flag_carry,
output reg   flag_overflow,
output reg   result_valid

    );
    always @(posedge clk) begin
    if (rst) begin
        result        <= 16'b0;
        flag_zero     <= 1'b0;
        flag_sign      <= 1'b0;
        flag_carry    <= 1'b0;
        flag_overflow <= 1'b0;
        result_valid  <= 1'b0;
    end else begin
        result        <= s3_c;
        flag_zero     <= s3_zero;
        flag_sign      <= s3_sign;
        flag_carry    <= s3_carry;
        flag_overflow <= s3_overflow;
        result_valid  <= s3_valid;
    end
end
endmodule

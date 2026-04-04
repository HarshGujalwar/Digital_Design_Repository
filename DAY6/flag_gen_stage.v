`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2026 17:49:17
// Design Name: 
// Module Name: flag_gen_stage
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


module flag_gen_stage(
input s2_cout,
input s2_valid,
input [15:0]s2_c,
input s2_a_sign,
input s2_b_sign,
input [3:0]s2_op,
input rst,
input clk,

output reg s3_zero,
output reg s3_carry,
output reg s3_sign,
output reg s3_overflow,
output reg [15:0]s3_c,
output reg s3_valid
    );
    
    always@(posedge clk)
    if(rst)begin
    s3_zero<=1'b0;
    s3_carry<=1'b0;
    s3_sign<=1'b0;
    s3_overflow<=1'b0;
    s3_c<=16'b0;
    s3_valid<=1'b0;
    end
    else begin
    s3_zero<=(s3_c==16'b0);
    
    if(s2_op==4'b0000|s2_op==4'b0001) begin
    s3_carry<=s2_cout;
    s3_overflow<=(s2_a_sign==s2_b_sign)&&(s2_c[15]==s2_a_sign);
    end
    else begin
    s3_carry<=0;
    s3_overflow<=0;
    end
    
    s3_sign<=s2_c[15];
    s3_valid<=s2_valid;
    s3_c<=s2_c;
    end
    
    
endmodule

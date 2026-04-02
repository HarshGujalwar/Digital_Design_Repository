`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 15:30:19
// Design Name: 
// Module Name: decode_stage
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


module decode_stage(
    input clk,
    input rst,
    input [3:0] opcode,
    input [15:0] a,
    input [15:0] b,
    input valid,
    output reg [3:0]s_op,
    output reg [15:0] s_a,
    output reg [15:0] s_b,
    output reg s_valid
    );
    always@(posedge clk)begin
    if (rst) begin
        s_op    <= 4'b0;
        s_a     <= 16'b0;
        s_b     <= 16'b0;
        s_valid <= 1'b0;
    end else begin
        s_op    <= opcode;
        s_a     <= a;
        s_b     <= b;
        s_valid <= valid;
    end
    end
    
endmodule

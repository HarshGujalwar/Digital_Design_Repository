`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 19:34:59
// Design Name: 
// Module Name: counter_generate
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

module counter_generate #(
parameter MAX_WIDTH=8)(
input clk,
input rst,
input in,
input up,
output reg [MAX_WIDTH-1:0] out
    );
    always@(posedge clk)begin
    if(rst) out<=12'b0;
    else if(in)begin
    if(up) out=out+1;
    else out=out-1;
    end 
    end
endmodule

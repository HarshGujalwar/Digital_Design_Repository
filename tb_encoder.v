`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2026 21:25:34
// Design Name: 
// Module Name: structural_mux
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


module structural_mux(
input [3:0] A,
input [1:0] sel,
output reg out
    );
    
    always@(*)begin
    out = (A[1]&sel[0] | A[0]&(~sel[0]))&(~sel[1]) | (A[3]&sel[0] | A[2]&(~sel[0]))&(sel[1]);
    end
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2026 21:11:00
// Design Name: 
// Module Name: mux
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


module mux(
input [3:0] A,
input [1:0] sel,
output reg out
    );
    always@(*)begin
    case (sel)
    2'b00:out=A[0];
    2'b01:out=A[1];
    2'b10:out=A[2];
    2'b11:out=A[3];
    default : out=0;
endcase
end
endmodule

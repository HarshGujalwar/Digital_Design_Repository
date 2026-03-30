`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 22:12:02
// Design Name: 
// Module Name: Dff
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


module Dff(
input D, 
input reset,
input clk,
output reg q,
output reg Q

    );
    always@(posedge clk) begin
    if(reset) Q<=0;
    else begin
    q<=D;
    Q<=~D;
    end
    end
endmodule

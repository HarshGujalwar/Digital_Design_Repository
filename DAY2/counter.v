`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 20:23:06
// Design Name: 
// Module Name: counter
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


module counter #(
parameter DATA_WIDTH=8)(
    input en,
    input up,
    input load,
    input [$clog2(DATA_WIDTH)-1:0] data_in,
    input reset,
    input clk,
    output reg [$clog2(DATA_WIDTH)-1:0]cnt
    );
    always@(posedge clk)begin
    if(reset) cnt<=0;
    else if(load) cnt<=data_in;
    else if (en) cnt<= up? cnt+1:cnt-1;
    end
endmodule

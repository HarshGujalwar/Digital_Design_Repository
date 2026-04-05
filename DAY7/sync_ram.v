`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 15:38:58
// Design Name: 
// Module Name: sync_ram
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


module sync_ram #(
parameter WIDTH=8,
parameter DEPTH=128)(
input clk,
input we,
input [WIDTH-1:0]din,
input [$clog2(DEPTH)-1:0] addr,
output reg [WIDTH-1:0] dout
    );
 localparam ADDR_WIDTH=$clog2(DEPTH);
 reg [WIDTH-1:0] mem [0:DEPTH-1];
    
    always@(posedge clk)begin
    if(we) mem[addr]<=din;
    dout<=mem[addr];
    end
    
endmodule

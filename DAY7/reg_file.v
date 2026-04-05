`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 16:43:20
// Design Name: 
// Module Name: reg_file
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


module reg_file #(
parameter WIDTH=8,
parameter DEPTH=16)(
input clk,
input [$clog2(DEPTH)-1:0] waddr,
input [$clog2(DEPTH)-1:0] raddr1,
input [$clog2(DEPTH)-1:0] raddr2,
input we,
output [WIDTH-1:0]rdata1,
output [WIDTH-1:0]rdata2,
input [WIDTH-1:0] wdata
    );
    reg [WIDTH-1:0] rf[0:DEPTH-1];
    always@(posedge clk) begin
    if((we ==1'b1) && (waddr!=0)) rf[waddr]<=wdata; 
    end
    assign rdata1=rf[raddr1];
    assign rdata2 = rf[raddr2];
endmodule

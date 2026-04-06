`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 23:33:36
// Design Name: 
// Module Name: pipeline_stage
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


module pipeline_stage #(
parameter WIDTH=8)(
input clk,
input rst,
input [WIDTH-1:0] in_data,
input in_valid,
input out_ready,
output in_ready,
output reg out_valid,
output reg [WIDTH-1:0] out_data

    );
 assign in_ready=out_ready && !out_valid;
    always@(posedge clk)begin
    if(rst)begin
    out_data<={WIDTH{1'b0}};
    out_valid<=1'b0;
    end
    else if(in_ready)begin
    out_data<=in_data;
    out_valid<=in_valid;
    end    
    end
endmodule

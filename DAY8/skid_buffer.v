`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2026 11:54:54
// Design Name: 
// Module Name: skid_buffer
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


module skid_buffer #(
parameter WIDTH=8)(
input clk,
input rst,
input [WIDTH-1:0] in_data,
input in_valid,
input out_ready,
output reg [WIDTH-1:0] out_data,
output reg out_valid,
output reg in_ready

    );
    reg buf_valid;
    reg [WIDTH-1:0] buf_data;
    always@(posedge clk)begin
    if(rst) begin
    buf_valid<=0;out_valid<=0;
    end
    else if(out_ready|| !out_valid)begin
    if(buf_valid)begin
    out_data<=buf_data;
    out_valid<=1'b1;
    buf_valid<=0;
    in_ready<=1;
    end
    else begin
    out_data<=in_data;
    out_valid<=in_valid;
    in_ready<=1;
    end
    end
    else if(in_valid && in_ready)begin
    buf_data<=in_data;
    buf_valid<=1;
    in_ready=0;
    end
    
    end
endmodule

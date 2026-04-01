`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 19:40:41
// Design Name: 
// Module Name: tb_counter_param
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


module tb_counter_param();
reg in=0;
reg clk=1;
reg up=1;
reg rst=1;
wire [11:0]out;
counter_generate #(
.MAX_WIDTH(12))DUT (
.clk(clk),
.rst(rst),
.up(up),
.in(in),
.out(out)
);
initial begin
forever #5 clk=~clk;
end
initial begin
#10 rst=0;in=1;
#50 in=0;
#20 in=1;
#20 up=0;
#50 up=1;
#500 in=0;
rst=1;
#30 rst=0;in=0;
end
initial begin
$monitor ("Time=&t,input1=&b,input2=&b,input3=&b,input4=&b,output1=&b",$time,clk,rst,in,up,out);
end
endmodule

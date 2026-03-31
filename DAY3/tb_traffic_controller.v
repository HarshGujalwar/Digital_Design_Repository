`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 00:32:58
// Design Name: 
// Module Name: tb_traffic_controller
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


module tb_traffic_controller( );
reg clk=0;
reg cnt=0;
reg reset=1;
wire [1:0]out;
initial begin
forever #5 clk=~clk;
end
traffic_controller DUT(
.clk(clk),
.cnt(cnt),
.reset(reset),
.out(out));

initial begin
#10 reset=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=0;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=0;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
#5 cnt=0;
#5 cnt=0;
#5 cnt=1;
#5 cnt=0;
end
initial begin
$monitor("Time=&t,input1=&b,input2=&b,input3=&b,output1=&b",$time,clk,cnt,reset,out);
end
endmodule

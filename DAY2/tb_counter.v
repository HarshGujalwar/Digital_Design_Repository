`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 20:32:07
// Design Name: 
// Module Name: tb_counter
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


module tb_counter();
reg en;
reg up;
reg [2:0]data_in;
reg load;
reg reset;
wire [2:0] cnt;
reg clk;
initial begin
clk=1;
end
initial begin
forever #5 clk<= ~clk;
end
initial begin
data_in=3'b000;up=0;en=0;load=0;
reset=1;#20
reset=0;

up=1;en=1;#20
up=0;en=0;
load=1;data_in=3'b101;#20
reset=1;#10
reset=0;
end

initial begin
$monitor("Time=&t,input1=&b,input2=&b,input3=&b,input4=&b,input5=&b,input6=&b,output1=&b",$time,clk,reset,en,up,load,data_in);
end
counter DUT(
.en(en),
.up(up),
.data_in(data_in),
.load(load),
.reset(reset),
.cnt(cnt),
.clk(clk));



endmodule

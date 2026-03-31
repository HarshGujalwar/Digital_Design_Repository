`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 23:26:09
// Design Name: 
// Module Name: tb_sequence_detector
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


module tb_sequence_detector( );
reg stream=0;
reg clk=1;
reg reset=1;
wire out;

initial begin
forever #5 clk=~clk;
end

sequence_detector DUT(
.stream(stream),
.clk(clk),
.reset(reset),
.out(out));

initial begin
#10reset=0;

#8 stream=1;
#10 stream=0;
#10 stream=1;
#10 stream=1;
#10 stream=0;
#10 stream=1;
#10 stream=1;
#10 stream=1;
#10 stream=0;
#10 stream=1;
#10 stream=1;
end

initial begin
$monitor("Time=&t,Input1=&b,Input2=&b,Input3=&b,output1=&b",$time,stream,reset,clk,out);
end
endmodule

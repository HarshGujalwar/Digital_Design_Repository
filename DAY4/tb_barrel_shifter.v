`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 23:09:35
// Design Name: 
// Module Name: tb_barrel_shifter
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


module tb_barrel_shifter();
reg [7:0] in=8'b00010111;
reg [2:0]amount=3'b000;
wire [7:0] out;

barrel_shifter DUT(
.in(in),
.amount(amount),
.out(out));
initial begin
#20 amount=3'b011;
#20 amount=3'b011;
end
initial begin
$monitor("Time=&t,input1=&b,input2=&b,output1=&b",$time,in,amount,out);
end
endmodule

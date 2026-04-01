`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 20:44:16
// Design Name: 
// Module Name: tb_rca
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


module tb_rca();
reg [7:0] a;
reg [7:0] b;
reg cin;
wire [7:0] s;
wire cout;

ripple_carry_adder DUT(
.a(a),
.b(b),
.cin(cin),
.s(s),
.cout(cout));
initial begin
a=8'b01010101;b=8'b10111011;cin=1'b1;
end
initial begin
$monitor("Time=&t,input1=&b,input2=&b,input3=&b,output1=&b,output2=&b",$time,a,b,cin,s,cout);
end
endmodule

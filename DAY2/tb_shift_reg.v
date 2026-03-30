`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2026 00:10:10
// Design Name: 
// Module Name: tb_shift_reg
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


module tb_shift_reg();
reg clk =1;
reg reset;
reg mode;
reg load;
reg [7:0]PI;
reg SI;
wire SO;
wire [7:0]PO;

shift_register DUT(
.clk(clk),
.reset(reset),
.mode(mode),
.load(load),
.PI(PI),
.SI(SI),
.SO(SO),
.PO(PO));

initial begin
forever #5 clk=~clk;
end
initial begin
reset=1;
#10 reset=0;
#20 mode=1;load=1;PI=8'b10101000;
#20 load=0;
#120 mode=0; SI=0;
#10 SI=1;
#10 SI=1;
#10 SI=1;
#10 SI=0;
#10 SI=0;
#10 SI=1;
#10 SI=0;
#10 reset=1;
#10 reset=0;

end

initial begin
$monitor("Time=&t,input1=&b,input2=&b,input3=&b,input4=&b,input5=&b,input6=&b,output1=&b,output2=&b",$time,clk,reset,SI,PI,load,mode,PO,SO);
end
endmodule

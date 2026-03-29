`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2026 21:17:57
// Design Name: 
// Module Name: tb_mux
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


module tb_structural_mux();
reg [3:0]A;
reg [1:0]sel;
wire out;
structural_mux DUT(.A(A),.sel(sel),.out(out));
initial begin
#5 A = 4'b1110;
#5 sel=2'b00;
#5 sel=2'b01;
#5 sel=2'b10;
#5 sel=2'b11;
#5 A = 4'b1010;
#5 sel=2'b00;
#5 sel=2'b01;
#5 sel=2'b10;
#5 sel=2'b11;
end
initial begin
$monitor("Time=%t,input1=%b,input2=%b,output1=%b",$time,A , sel ,out);
end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 21:58:36
// Design Name: 
// Module Name: tb_decoder_stage
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


module tb_decoder_stage();
reg clk=1;
reg rst=1;
reg [15:0]a=16'b0;reg [15:0]b=16'b0;reg [3:0]opcode=4'b0;reg valid=1'b0;
wire [15:0]s_a;wire [15:0]s_b;wire [3:0]s_op;wire s_valid;
wire [15:0]s2_c; wire s2_valid;
initial begin
forever  #5 clk=~clk;
end

decode_stage DUT(
.clk(clk),
.rst(rst),
.a(a),
.b(b),
.opcode(opcode),
.valid(valid),
.s_a(s_a),
.s_b(s_b),
.s_op(s_op),
.s_valid(s_valid));

compute_stage DUT2(
.clk(clk),
.rst(rst),
.s_a(s_a),
.s_b(s_b),
.s2_c(s2_c),
.s_op(s_op),
.s_valid(s_valid),
.s2_valid(s2_valid)

);
initial begin
#7 rst=0;
#3 a=16'hABCD;b=16'h0123;valid=1'b1;opcode=4'b0000;
#10 a=16'hABCD;b=16'h0123;opcode=4'b0100;

end
initial begin
$monitor("Time=%t,input1=%b,input2=%b,input3=%b,input4=%b,input5=%b,input6=%b,output1=%b,output2=%b,output3=%b,output4=%b,output5=%b,output6=%b",$time,clk,rst,valid,a,b,opcode,s_a,s_b,s_op,s_valid,s2_c,s2_valid);
end
endmodule

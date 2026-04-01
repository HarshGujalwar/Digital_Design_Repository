`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 20:10:58
// Design Name: 
// Module Name: ripple_carry_adder
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


module ripple_carry_adder #(
parameter WIDTH=8)(
input [WIDTH-1:0] a,
input [WIDTH-1:0] b,
input cin,
output  cout,
output  [WIDTH-1:0] s
    );
    wire [WIDTH:0] carry;
    assign carry[0] = cin;
    genvar i;
    generate
    for(i=0;i<WIDTH;i=i+1)begin :adder_chain
    full_adder fa(.a(a[i]),.b(b[i]),.cin(carry[i]),.s(s[i]),.cout(carry[i+1]));
    end
    endgenerate
    assign cout=carry[WIDTH];

endmodule

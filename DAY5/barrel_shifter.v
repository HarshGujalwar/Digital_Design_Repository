`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 23:21:12
// Design Name: 
// Module Name: barrel_shifter
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


module barrel_shifter #(
parameter WIDTH=16,
parameter DIRECTION=1'b0)(
input [WIDTH-1:0] in,
input [WIDTH-1:0] amount,
output [WIDTH-1:0] out
    );
    wire [WIDTH-1:0] candidates [0:WIDTH-1];
    genvar s;
    generate
        if(DIRECTION==1'b0)begin : gen_left
            for(s=0;s<WIDTH;s=s+1)begin:gen_shift
            assign candidates[s] = in<<s;
            end   
         end
         else begin: gen_right 
            for (s=0;s<WIDTH;s=s+1) begin :gen_shift
            assign candidates[s] = in>>s;
            end
          end
      endgenerate
      assign out=candidates[amount];
endmodule

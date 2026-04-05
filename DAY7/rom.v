`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 16:20:55
// Design Name: 
// Module Name: rom
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


module rom#(
parameter WIDTH=8,
parameter DEPTH=8)(
input [$clog2(DEPTH)-1:0] addr,
output [WIDTH-1:0] dout
    );
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    initial begin
    $readmemh("rom_init.mem",mem);
    end
    assign dout=mem[addr];
endmodule

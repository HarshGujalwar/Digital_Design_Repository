`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 20:45:56
// Design Name: 
// Module Name: tb_rom
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


module tb_rom();
reg [2:0]addr;wire [7:0]dout;

rom DUT(
.addr(addr),
.dout(dout)
);
initial begin
#10 addr=3'b001;
#10 addr=3'b010;
end
endmodule

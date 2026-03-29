`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2026 20:24:04
// Design Name: 
// Module Name: tb_encoder
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


module tb_encoder();
reg [7:0]D;
wire [2:0]Q;
priority_encoder DUT(
.D(D),
.Q(Q));
initial begin
#5 D=8'H84;
#5 D=8'H44;
#5 D=8'H24;
#5 D=8'H04;
#5 D=8'H08;
end

initial begin
$monitor("Time = %t, Input1 = %b, Output1 = %b", $time, D, Q);

end
endmodule

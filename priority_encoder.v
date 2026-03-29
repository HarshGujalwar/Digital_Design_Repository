`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2026 19:51:42
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder #
(parameter Data_width=8)(
input [Data_width-1:0] D,
output reg [$clog2(Data_width)-1:0]Q
    );
    
    integer i;
    always@(*)begin
    Q=0;
    for(i=0;i<=Data_width-1;i=i+1)begin
    if(D[i]==1'b1) begin
    Q=i[$clog2(Data_width)-1:0];
    end
    end
    end
    

endmodule

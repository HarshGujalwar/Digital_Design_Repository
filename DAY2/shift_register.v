`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2026 21:05:33
// Design Name: 
// Module Name: shift_register
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


module shift_register #
(parameter DATA_WIDTH=8)(
input mode,
input clk,
input reset,
input load,
input [DATA_WIDTH-1:0] PI,
input SI,
output reg [DATA_WIDTH-1:0] PO,
output reg SO
    );
    reg [DATA_WIDTH-1:0] D;
    reg [DATA_WIDTH-1:0]temp;

    always@(posedge clk) begin
    if(reset) begin
        SO<=0;
        PO<=0;
        D<=0;
        temp<=DATA_WIDTH-1;
    end
    else if(mode) begin
        if(load)begin
            D<=PI;
            temp<=DATA_WIDTH-1;
        end
        else begin
            SO<=D[temp];
            if (temp!=0) temp=temp-1;
        end
    end
        else if(!mode) begin
            D<={D[DATA_WIDTH-2:0],SI};
            PO<={D[DATA_WIDTH-2:0],SI};
        end
    end
    
endmodule

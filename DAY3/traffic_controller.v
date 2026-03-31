`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2026 00:24:10
// Design Name: 
// Module Name: traffic_controller
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


module traffic_controller(
    input clk,
    input cnt,
    input reset,
    output reg [1:0] out
    );
    reg [1:0] current_state,next_state;
    localparam S0=2'b00; //red
    localparam S1=2'b01; //yellow
    localparam S2=2'b10;//green
    

    always@(posedge clk)begin
    if(reset) current_state=S0;
    current_state=next_state;
    end
    always @(*)begin
    case(current_state)
    S0:next_state=cnt?S1:S0;
    S1:next_state=cnt?S2:S1;
    S2:next_state=cnt?S0:S2;
    default:next_state=S0;
    endcase
    end
    always@(*)begin
    out=current_state;
    end
endmodule

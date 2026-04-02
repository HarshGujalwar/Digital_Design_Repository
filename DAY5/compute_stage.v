`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2026 23:05:11
// Design Name: 
// Module Name: compute_stage
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


module compute_stage(
    input clk,
    input rst,
    input [15:0] s_a,
    input [15:0] s_b,
    input [3:0] s_op,
    input s_valid,
    output reg [15:0]  s2_c,
    output reg s2_valid
    );
    wire [15:0] rca_sum;
    wire rca_cout;
    wire sub_mode;
    assign sub_mode=(s_op==4'b001);

    ripple_carry_adder A1(
    .a(s_a),
    .b(s_b),
    .cin(sub_mode),
    .cout(rca_cout),
    .s(rca_sum)
    );
    wire [15:0] shift_left_out;
    wire [15:0] shift_right_out;
    
    // instantiate both directions at module level
    barrel_shifter #(.DIRECTION(0)) u_shl (
        .in(s_a),
        .amount(s_b[3:0]),
        .out(shift_left_out)
    );
    
    barrel_shifter #(.DIRECTION(1)) u_shr (
        .in(s_a),
        .amount(s_b[3:0]),
        .out(shift_right_out)
    );
    wire [15:0] rca_b_in;
    assign rca_b_in = sub_mode ? ~s_b : s_b;
    always@(posedge clk) begin
    if(rst) s2_c<=16'b0;
    else begin
    if(s_valid)begin
    case(s_op) 
    4'b0000:s2_c<=rca_sum;
    4'b0001:s2_c<=rca_sum;
    4'b0010: s2_c<= s_a & s_b;
    4'b0011: s2_c <= s_a | s_b;
    4'b0100: s2_c <= s_a ^ s_b;
    4'b0101: s2_c <= ~s_a;
    4'b0110: s2_c <= shift_left_out;
    4'b0111: s2_c <= shift_right_out;
    4'b1000: s2_c <= (s_a == s_b) ? 16'h0001 : 16'h0000; 
    default: s2_c <= 16'b0;
    endcase
    s2_valid<=s_valid;
    end
    end
    end
endmodule

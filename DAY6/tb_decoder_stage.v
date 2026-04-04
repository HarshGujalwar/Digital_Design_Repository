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
wire [15:0]s2_c; wire s2_valid;wire s2_cout;
wire s2_a_sign, s2_b_sign;wire [3:0]s2_op;
wire [15:0] s3_result;
wire        s3_valid;
wire        s3_zero, s3_sign;
wire        s3_carry, s3_overflow;
wire [15:0] result;
wire        result_valid;
wire        flag_zero, flag_sign;
wire        flag_carry, flag_overflow;


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
.s2_valid(s2_valid),
.s2_op(s2_op),
.s2_a_sign(s2_a_sign), .s2_b_sign(s2_b_sign),
.s2_cout(s2_cout)

);
flag_gen_stage S3(
    .clk(clk), .rst(rst),
    .s2_c(s2_c), .s2_valid(s2_valid),
    .s2_cout(s2_cout), .s2_op(s2_op),
    .s2_a_sign(s2_a_sign), .s2_b_sign(s2_b_sign),
    .s3_c(s3_result), .s3_valid(s3_valid),
    .s3_zero(s3_zero), .s3_sign(s3_sign),
    .s3_carry(s3_carry), .s3_overflow(s3_overflow)
);

output_stage S4(
    .clk(clk), .rst(rst),
    .s3_c(s3_result), .s3_valid(s3_valid),
    .s3_zero(s3_zero), .s3_sign(s3_sign),
    .s3_carry(s3_carry), .s3_overflow(s3_overflow),
    .result(result), .result_valid(result_valid),
    .flag_zero(flag_zero), .flag_sign(flag_sign),
    .flag_carry(flag_carry), .flag_overflow(flag_overflow)
);
task apply_and_check;
input[15:0] in_a,in_b;
input [3:0] op;
input [15:0] exp_result;
input exp_zero,exp_sign,exp_carry,exp_overflow;
input [63:0] test_name;
begin
    @(posedge clk);#1;
    a=in_a;
    b=in_b;
    opcode=op;
    valid=1;
    repeat(4) @(posedge clk);
    #3;
    if(result!==exp_result) $error("FAIL [%s] result: got %h, expected %h",test_name, result, exp_result);
    if (flag_zero !== exp_zero) $error("FAIL [%s] flag_zero: got %b, expected %b", test_name, flag_zero, exp_zero);
    if (flag_sign !== exp_sign) $error("FAIL [%s] flag_neg: got %b, expected %b",test_name, flag_sign, exp_sign);
    if (flag_carry !== exp_carry) $error("FAIL [%s] flag_carry: got %b, expected %b", test_name, flag_carry, exp_carry);
    if (flag_overflow !== exp_overflow) $error("FAIL [%s] flag_overflow: got %b, expected %b", test_name, flag_overflow, exp_overflow);
    if (result_valid !== 1'b1) $error("FAIL [%s] result_valid not asserted", test_name);
    $display("PASS [%s] result=%h z=%b n=%b c=%b v=%b", test_name, result, flag_zero, flag_sign, flag_carry, flag_overflow);
end
endtask
initial begin
#7 rst=0;
apply_and_check(16'h0005,16'h0003,4'b0000,16'h0008,0,0,0,0,"ADD");
apply_and_check(16'hFFF5,16'h000B,4'b0000,16'h0000,1,0,1,0,"ADD_C");
apply_and_check(16'h0005,16'h0003,4'b0001,16'h0002,0,0,1,0,"SUB");
apply_and_check(16'h0005,16'h0005,4'b0001,16'h0000,1,0,1,0,"SUB_Z");
apply_and_check(16'h0FF0,16'hFF00,4'b0010,16'h0F00,0,0,0,0,"AND");
apply_and_check(16'h0FF0,16'hFF00,4'b0011,16'hFFF0,0,1,0,0,"OR");
apply_and_check(16'hFFFF,16'hFFFF,4'b0100,16'h0000,1,0,0,0,"XOR");
apply_and_check(16'hFF00,16'h0000,4'b0101,16'h00FF,0,0,0,0,"NOT");
apply_and_check(16'h0001,16'h0001,4'b0110,16'h0010,0,0,0,0,"SHL");
apply_and_check(16'h0080,16'h0001,4'b0111,16'h0040,0,0,0,0,"SHR");
apply_and_check(16'h0005,16'h0005,4'b1000,16'h0001,0,0,0,0,"CMP");
apply_and_check(16'h0005,16'h0006,4'b1000,16'h0000,1,0,0,0,"CMPN");
valid = 0;
    #20;
    $display("??? All tests done ???");
    $finish;
end

endmodule

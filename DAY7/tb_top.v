`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2026 18:38:07
// Design Name: 
// Module Name: tb_top
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


module tb_reg_file();
reg [3:0] waddr;reg we;reg [3:0]addr1;reg [3:0]addr2;reg clk=0;reg [7:0]wdata;
wire [7:0] rdata1,rdata2;
reg_file DUT(
.waddr(waddr),
.we(we),
.wdata(wdata),
.raddr1(addr1),
.raddr2(addr2),
.clk(clk),
.rdata1(rdata1),
.rdata2(rdata2)
);
initial begin
forever #5 clk=~clk;
end
initial begin 
#5 waddr=3'b011;addr1=3'b011;addr2=3'b111;we=1;wdata=8'h0F;
#30 we=1'b0;

end


endmodule

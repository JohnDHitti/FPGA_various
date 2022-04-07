`timescale 1ns / 1ps //pipo

module pipo(clk,pi,po);
input clk;
input [3:0] pi;
output reg [3:0] po; 
always @(posedge clk) 
begin
po=pi;
end
endmodule

module pipo_tb;
reg clk_tb;
reg [3:0] pi_tb=4'b1101;
wire [3:0] po_tb;
pipo U(.clk(clk_tb),.pi(pi_tb),.po(po_tb));
initial
begin
clk_tb=0;
#10;
end
always #5 clk_tb=~clk_tb;
endmodule


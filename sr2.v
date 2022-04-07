`timescale 1ns / 1ps
//sipo
module sipo(clk,si,po); 
input clk, si;
output [3:0] po;
reg [3:0] tmp;
always @(posedge clk)
begin
tmp={si, tmp[3:1]};
end
assign po=tmp;
endmodule

module sipo_tb;
reg clk_tb;
reg si_tb;
wire [3:0] po_tb;
sipo U(
.clk(clk_tb),
.si(si_tb), 
.po(po_tb)
);
initial
begin
clk_tb=0; si_tb=1; #10;
si_tb=1; #10;
si_tb=0; #10;
si_tb=1;
end
always #5 clk_tb=~clk_tb;
endmodule


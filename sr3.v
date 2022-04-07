`timescale 1ns/1ps
//piso
module piso(clk,pi,load,so);
input clk, load; 
input [3:0] pi;
output reg so; 
reg [3:0] tmp;
always @(posedge clk)
begin
if(load)
tmp<=pi;
else
begin
so<=tmp[0]; 
tmp<={1'b0,tmp[3:1]};
end
end
endmodule

module piso_tb;
reg clk_tb;
reg [3:0] pi_tb=4'b1101;
wire so_tb;
reg load_tb;
piso U(.clk(clk_tb),
.pi(pi_tb),
.so(so_tb),
.load(load_tb));
initial
begin
clk_tb=0; load_tb=1;
#10;
load_tb=0;
end
always	#5 clk_tb=~clk_tb;
endmodule


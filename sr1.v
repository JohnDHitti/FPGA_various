`timescale 1ns / 1ps //siso
module siso(clk,si,so); 
input clk;
input si;
output so;
reg [3:0] q=0;
always @(posedge clk) 
begin
q[3]<=si; q[2]<=q[3]; q[1]<=q[2]; q[0]<=q[1];
end
assign so=q[0];
endmodule
module siso_tb;
reg clk_tb;
reg si_tb;
wire so_tb;
siso U(
.clk(clk_tb),
.si(si_tb),
.so(so_tb)
);
initial
begin
clk_tb=0; si_tb=1; #10;
si_tb=0; #10;
si_tb=0; #10;
si_tb=1;
end
always	#5 clk_tb=~clk_tb;
endmodule


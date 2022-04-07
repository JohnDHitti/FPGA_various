module n_bit_comparator(comp,x,y);

parameter N=2;

input [N-1:0] x,y;
output reg [2:0] comp;

initial
	comp = 3'b0;

always @ (x or y)
	if (x>y) comp = 3'b100;
	else if (x == y) comp = 3'b010;
	else if (x<y) comp = 3'b001;
	else comp = 3'b111;
endmodule

`timescale 1ns/1ps
module twobitcomp_tb (sw, led);
input [3:0] sw;
output [2:0] led;
n_bit_comparator UUT(.comp(led),.x(sw[3:2]),.y(sw[1:0]));
endmodule

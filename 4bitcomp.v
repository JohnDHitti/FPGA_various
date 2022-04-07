module n_bit_comparator(comp,x,y);

parameter N=4;

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
module fourbitcomp_tb;
reg [3:0] x;
reg [3:0] y;
wire [2:0] comp;
initial begin
x=4'b0; y=4'b0;
#10;
x=4'b1111; y=4'b0;
#10;
x=4'b0; y=4'b1111;
#10;
x=4'b1111;
#10;
end
n_bit_comparator UUT(.comp(comp),.x(x),.y(y));
endmodule

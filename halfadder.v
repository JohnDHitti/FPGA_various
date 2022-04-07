module one_bit_half_adder(s,co,x,y);

input x,y;
output s,co;

and g1(co,x,y);
xor g2(s,x,y);

assign co = x&y;
assign s = x^y;

endmodule

`timescale 1ns/1ps
module oneBitHalfAdder_tb;
reg x,y;
wire s,co;
initial begin
	x=0;y=0;
	#100;
	x=0; y=1;
	#100;
	x=1; y=0;
	#100;
	x=1; y=1;
end
one_bit_half_adder UUT(.x(x),.y(y),.s(s),.co(co));
endmodule

module onebitcomparator(g,e,l,x,y);

input x,y;
output g,e,l;

wire o1,o2,o3;

not g1(o1,y);
and g2(g,o1,x);
xor g3(o2,x,y);
not g4(e,o2);
not g5(o3,x);
and g6(l,o3,y);

endmodule

`timescale 1ns/1ps
module onebitcomparator_tb;
reg x,y;
wire g,e,l;
initial begin
	x=0;y=0;
	#10;
	x=0;y=1;
	#10;
	x=1;y=0;
	#10;
	x=1;y=1;
	#10;
end
onebitcomparator UUT(.g(g),.e(e),.l(l),.x(x),.y(y));
endmodule

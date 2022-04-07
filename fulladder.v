module oneBitFullAdder(s,co,x,y,ci);
input x,y,ci;
output s,co;

assign co=(x&y) | (ci & (x^y));
assign s=x^y^ci;
endmodule
`timescale 1ns/1ps

module twoBitFullAdder(x1,x2,y1,y2,ci,co,s1,s2);
input x1,x2,y1,y2,ci;
output s1,s2,co;
wire cmid;
oneBitFullAdder uut(.s(s1),.co(cmid),.x(x1),.y(y1),.ci(ci));
oneBitFullAdder uus(.s(s2),.co(co),.x(x2),.y(y2),.ci(cmid));
endmodule

module oneBitFullAdder_tb;
reg x1,x2,y1,y2,ci;
wire s1,s2,co;
initial begin
	x1=0; x2=0; y1=0; y2=0; ci=0;
	#10;
	x1=1; x2=0; y1=0; y2=0; ci=0;
	#10;
	x1=0; x2=1; y1=1; y2=1; ci=1;
	#10;
	x1=0; x2=0; y1=1; y2=0; ci=1;
	#10;
	x1=0; x2=1; y1=0; y2=1; ci=0;
	#10;
	x1=0; x2=0; y1=0; y2=0; ci=1;
	#10;
	x1=1; x2=1; y1=0; y2=0; ci=0;
	#10;
	x1=1; x2=1; y1=1; y2=1; ci=1;
	#10;
end
twoBitFullAdder UUT(.x1(x1),.x2(x2),.y1(y1),.y2(y2),.ci(ci),.co(co),.s1(s1),.s2(s2));
endmodule
	

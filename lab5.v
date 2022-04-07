module oneBitFullAdder(s,co,x,y,ci);
input x,y,ci;
output s,co;
assign co=(x&y) | (ci & (x^y));
assign s=x^y^ci;
endmodule

module threebitaddersub(a,b,c,s,cin,overflow);
input [2:0] a;
input [2:0] b;
input cin;
output [2:0] s;
output [2:0] c;
wire [2:0] cwire;
wire [2:0] acin;

output overflow;
assign acin[0]=cin^a[0];
assign acin[1]=cin^a[1];
assign acin[2]=cin^a[2];
oneBitFullAdder uut(.s(s[0]),.co(cwire[0]),.x(b[0]),.y(acin[0]),.ci(cin));
oneBitFullAdder uus(.s(s[1]),.co(cwire[1]),.x(b[1]),.y(acin[1]),.ci(cwire[0]));
oneBitFullAdder uux(.s(s[2]),.co(cwire[2]),.x(b[2]),.y(acin[2]),.ci(cwire[1]));
assign overflow = cwire[2]^cwire[1];
assign c[0]=cwire[0];
assign c[1]=cwire[1];
assign c[2]=cwire[2];
endmodule

module traffic_tb(led, sw,clk, seg, an);
input [6:0] sw;
input clk;
output [3:0] led;
wire [2:0] c;
wire overflow;
output [6:0] seg;
output [3:0] an;
threebitaddersub UUT(.a(sw[2:0]),.b(sw[5:3]),.c(c),.s(led[2:0]),.cin(sw[6]),.overflow(overflow));
overflowselector UUD(.clk(clk),.c(c[2]),.s(led[2]),.overflow(overflow),.out(led[3]));
decoder_7seg ss(.in1(led),.out1(seg),.an(an),.clk(clk));
endmodule

module overflowselector(clk, c, s, overflow, out);
input c, s, overflow;
output reg out;
input clk;
always @(posedge clk)
begin
if (overflow==1) out=c;
else out=s;
end
endmodule
//module lab5tb;
//reg [2:0] a;
//reg [2:0] b;
//reg cin;
//wire [2:0] s;
//wire [2:0] c;
//wire overflow;
//reg [3:0] final;
//threebitaddersub UUT(.a(a),.b(b),.c(c),.s(s),.cin(cin),.overflow(overflow));
//initial begin
//	a=3'b001; b=3'b100; cin=0;
//final[0]=s[0];
//final[1]=s[1];
//final[2]=s[2];
//if (overflow == 1)
//final[3]=c[2];
//else
//final[3]=s[2];
//	#10;
//	a=3'b001; b=3'b100; cin=1;
//	final[0]=s[0];
//final[1]=s[1];
//final[2]=s[2];
//if (overflow == 1)
//final[3]=c[2];
//else
//final[3]=s[2];
//	#10;
//	a=3'b011; b=3'b011; cin=0;
//	final[0]=s[0];
//final[1]=s[1];
//final[2]=s[2];
//if (overflow == 1)
//final[3]=c[2];
//else
//final[3]=s[2];
//	#10;
//	a=3'b011; b=3'b100; cin=1;
//	final[0]=s[0];
//final[1]=s[1];
//final[2]=s[2];
//if (overflow == 1)
//final[3]=c[2];
//else
//final[3]=s[2];
//	#10;
//	a=3'b101; b=3'b001; cin=0;
//	#10;
//	a=3'b101; b=3'b001; cin=1;
//	#10;
//	a=3'b111; b=3'b100; cin=0;
//	#10;
//	a=3'b111; b=3'b100; cin=1;
//	#10;
//	a=3'b101; b=3'b111; cin=0;
//	#10;
//	a=3'b101; b=3'b111; cin=1;
//	#10;
//end
//endmodule





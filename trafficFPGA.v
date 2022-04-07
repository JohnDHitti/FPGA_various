module traffic(g1,y1,r1,g2,y2,r2,d,G1,Y1,R1,G2,Y2,R2);
input g1,y1,r1,g2,y2,r2,d;
output G1,Y1,R1,G2,Y2,R2;
assign G1=!g1&!y1&r1&!g2&!y2&r2&d;
assign Y1=g1&!y1&!r1&!g2&!y2&r2&d;
assign G2=!g1&!y1&r1&!g2&!y2&r2&!d;
assign Y2=!g1&!y1&r1&g2&!y2&!r2&!d;
assign R1=(!g1&!y1&r1&g2&!y2&!r2&!d)+
(!g1&!y1&r1&!g2&y2&!r2&d)+
(!g1&!y1&r1&!g2&!y2&r2&!d)+
(!g1&y1&!r1&!g2&!y2&r2&!d);
assign R2=(g1&!y1&!r1&g2&y2&!r2&d)+
(!g1&!y1&r1&!g2&y2&!r2&d)+
(!g1&!y1&r1&!g2&!y2&r2&d)+
(!g1&y1&!r1&!g2&!y2&r2&!d);
endmodule

`timescale 1ns/1ps
module traffic_tb(led, clk);
input clk;
output [5:0] led;
reg g1,y1,r1,g2,y2,r2,d;
wire G1,Y1,R1,G2,Y2,R2;
traffic uut(.g1(g1),.y1(y1),.r1(r1),.g2(g2),.y2(y2),.r2(r2),.d(d),.G1(led[5]),.Y1(led[4]),.R1(led[3]),.G2(led[2]),.Y2(led[1]),.R2(led[0]));
initial begin
	g1=0;y1=0;r1=1;g2=0;y2=0;r2=1;d=0;
	#10;
	g1=0;y1=0;r1=1;g2=1;y2=0;r2=0;d=0;
	#10;
	g1=0;y1=0;r1=1;g2=0;y2=1;r2=0;d=1;
	#10;
	g1=0;y1=0;r1=1;g2=0;y2=0;r2=1;d=1;
	#10;
	g1=1;y1=0;r1=0;g2=0;y2=0;r2=1;d=1;
	#10;
	g1=0;y1=1;r1=0;g2=0;y2=0;r2=1;d=0;
	#10;
	g1=0;y1=0;r1=1;g2=0;y2=0;r2=1;d=0;
	#10;
end 
//parameter cntmax=32'd100000000;
//reg [31:0] cnt;
//always @(posedge clk)
//    if (cnt==cntmax)
//	begin
//		cnt<=32'd0;

//	end
//	else
//	begin
//		cnt<=cnt+32'd1;	
//	end
endmodule

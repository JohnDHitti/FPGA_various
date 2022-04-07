module circut(y,q1,q2,x,clk,clr);
input x, clk, clr; 
output reg y; 
output reg q1=0; 
output reg q2=0;
always @(posedge clk)
if(clr==1) 
begin
q1<=1'b0;
q2<=1'b0; // didn't define y's value under reset so it shows x in simulation
 end
 else
 begin
q1<=(x&q1)+(x&q2);
q2<=(x&~q2&~q1);
y<=q1&x;
end 
endmodule
`timescale 1ns/1ps 
module sequence_detector_tb; 
wire y,q1,q2; 
reg x=0; 
reg clk=0; 
reg clr=1; // clr is 1 active. when clr is 1, 91 and q2 are both O per the module's description above 
integer i; 
circut UUT(.y(y),.q1(q1),.q2(q2),.x(x),.clk(clk),.clr(clr));
initial begin
for(i=0;i<20;i=i+1) begin
clk=~clk;
if(i>5&i<11) begin
clr=0; // release the DFFS
x=1; 
 end 
 else if(i==11) x=0;
 else if(i==12) x=1; 
 else x=0; 
 #10;
end
end
endmodule


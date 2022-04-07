module sequence_detector(y,x,clk,clr,state);
input x, clk, clr; 
output reg y; 
output reg [1:0] state=2'b0;
parameter A=2'b00,B=2'b01,C=2'b10,D=2'b11;

always @(posedge clk)
begin
	if(clr==1) state<=A;
	else
	begin
		if(x==0)
			case(state)
				A:state<=A;
                B:state<=A;
                C:state<=D;
                D:state<=A;
                endcase
                else
                case(state)
 				A:state<=B;
                B:state<=C;
                C:state<=C;
                D:state<=B;   
                endcase
                if((x==1)&&(state==D)) y<=1;
                else y<=0;
end 
end  
endmodule         
`timescale 1ns/1ps 
module sequence_detector_tb; 
wire y;
wire [1:0] state;
reg x=0; 
reg clk=0; 
reg clr=1; // clr is 1 active. when clr is 1, 91 and q2 are both O per the module's description above 
integer i; 
sequence_detector UUT(.y(y),.x(x),.clk(clk),.clr(clr),.state(state));
initial begin
for(i=0;i<20;i=i+1) begin
clk=~clk;
if(i>5&i<10) begin
clr=0; // release the DFFS
x=1; // it'll start changing states until state 10
 end 
 else if(i==11) x=0;//to change the state to 11 eventually 
 else if(i==12) x=1; 
 else x=0; 
 #10;
end
end
endmodule


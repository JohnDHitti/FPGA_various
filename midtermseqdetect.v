module sequence_detector(y,x,clk,clr, state);
input x,clk,clr;
output reg y;
output reg [1:0] state =2'b00;
parameter A=2'b00, B=2'b01, C=2'b10, D=2'b11;
always @(posedge clk)
begin
if (clr == 1) state <=A;
else
begin
	if (x==0)
		case (state)
			A:state<=A;
			B:state<=C;
			C:state<=A;
			D:state<=A;
		endcase
		else
		case (state)
			A:state<=B;
			B:state<=B;
			C:state<=D;
			D:state<=B;
		endcase
	if((x==0)&&(state==D)) y<=1;
	else y<=0;
end
end 
endmodule

module sequence_detector_tb; 
wire y; 
wire [1:0] state;
reg x=0; 
reg clk=0; 
reg clr=1; 
integer i; 
sequence_detector UUT(.y(y),.x(x),.clk(clk),.clr(clr),.state(state));
initial begin
for(i=0;i<40;i=i+1) begin
clk=~clk;
if(i>5&i<11) begin
clr=0;
x=1; 
 end 
 else if(i==11) x=0;
 else if(i==12) x=1; 
 else if(i==13) x=1; 
 else if(i==16) x=1; 
 else x=0; 
 #10;
end
end
endmodule



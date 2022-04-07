module twobsc(x,clk,q,y);

input x,clk;
output reg [1:0] q;
output reg y;

initial begin
	q=2'b00;
	y=1'b0;
end
always @ (negedge clk)
	if (x==1) {y,q} <= q + 1'b1;
endmodule

module twotb; 
wire y;
wire [1:0] q; 
reg x=0; 
reg clk=0; 
integer i; 
twobsc UUT(.y(y),.q(q),.x(x),.clk(clk));
initial begin
for(i=0;i<20;i=i+1) begin
clk=~clk;
x=~x;
 #10;
clk=~clk;
#10;
end
end
endmodule



module sr_ff(s,r,clk,q,qn);
input s,r,clk;
output reg q;
output reg qn;
always @ (s or r or clk)
	if (clk & s) {q,qn} <= 2'b10;
	else if (clk & r) {q,qn} <= 2'b01;
endmodule

`timescale 1ns/1ps
module tblatch;
reg s,r,clk;
wire q,qn;
sr_ff UUT(.s(s),.r(r),.clk(clk),.q(q),.qn(qn));
initial begin
	{s,r,clk}=3'b101; #10;
	{s,r,clk}=3'b001; #10;
	{r,s,clk}=3'b101; #10;
	{s,r,clk}=3'b001; #10;
end
endmodule

module JK_flip_flop(j,k,clr,clk,q,qn);
input j,k,clr,clk;
output reg q;
output reg qn;
always @ (posedge clk, negedge clr)
if (clr == 0)
begin
q <= 0;
qn<= 1;
end
else
case ({j,k})
2'b01 : begin q<=1'b0; qn<=1'b1;end
2'b10 : begin q<=1'b1; qn<=1'b0;end
2'b11 : begin q<=qn; qn<=q;end
endcase
endmodule

module jkfftb;
reg j=0; // NEITHER input reg d=0; NOR input reg d;
reg k=0;
reg clr=1; // NEITHER input reg clr=0; NOR input reg clr;
reg clk=0; // NEITHER input reg clk=0; NOR input reg clk;
wire q,qn; // NOT output q,qn;
integer i;
JK_flip_flop UUT(.j(j),.k(k), .clr(clr),.clk(clk), .q(q), .qn(qn));
initial begin
for (i=0;i<30;i=i+1) begin
clk=~clk;
if(i>3 & i<15) j=1;
else j=0;
if(i>10 & i<20) k=1;
else k=0;
if(i==30) clr=0;
#10;
end
end
endmodule
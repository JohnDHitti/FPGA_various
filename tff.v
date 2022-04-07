module T_flip_flop(t,clk,clr,q,qn);
input t,clk,clr;
output reg q;
output reg qn;
always @ (posedge clk)
if (clr == 0) begin
q <= 0;
qn <= 1;
end
else begin
q<=q^t;
qn<= ~(q ^ t);
end
endmodule

module jkfftb;
reg t=0; // NEITHER input reg d=0; NOR input reg d;
reg clr=0; // NEITHER input reg clr=0; NOR input reg clr;
reg clk=0; // NEITHER input reg clk=0; NOR input reg clk;
wire q,qn; // NOT output q,qn;
integer i;
T_flip_flop UUT(.t(t), .clr(clr),.clk(clk), .q(q), .qn(qn));
initial begin
for (i=0;i<30;i=i+1) begin
clk=~clk;
if(i>3 & i<15) t=1;
else t=0;
if(i==2) clr=1;
#10;
end
end
endmodule
module debounce (clk,btn,btn_clr)
input clk;
input btn;
output reg btn_clr;
parameter delay = 650000; //6.5 ms delay
integer count =0;
reg xnew=0;
always @(posedge clk)
begin 
if (btn != xnew) begin
	count <=0;
	xnew<=btn;
end 
else if (count == delay) btn_clr <=xnew;
else count <=count+1;
end endmodule

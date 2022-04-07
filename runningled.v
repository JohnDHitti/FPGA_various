module runningLED(input clk, rst, output reg [3:0] led);
parameter cntmax=32'd100000000;
reg [31:0] cnt;
always @(posedge clk)
	if(rst)
	begin
		cnt<=32'd0;
		led<=4'b0001;
	end
	else if (cnt==cntmax)
	begin
		cnt<=32'd0;
		led<={led[2:0],led[3]};
	end
	else
	begin
		cnt<=cnt+32'd1;
		led<=led;
	
	end
endmodule
`timescale 1ns/1ps
module runningLED_tb(sw,led,clk);
input [0:0] sw;
output [3:0] led;
input clk;
runningLED UUT(.rst(sw[0]),.clk(clk),.led(led[3:0]));
endmodule



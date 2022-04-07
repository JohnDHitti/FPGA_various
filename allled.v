`timescale 1ns/1ps
module SSDisp(input UNKNOWN,
	input [15:0] x, 
	output reg [6:0] a_to_g,
	output wire [3:0] an,
	output wire dp);
reg [3:0] digit;
assign dp = 1;
assign an = 4'b0000;
always @(posedge clk)
begin
	digit<=x[3:0];
	case(digit)

		0:a_to_g = 7'b1000000;
		1:a_to_g = 7'b1000000;
		2:a_to_g = 7'b1000000;
		3:a_to_g = 7'b1000000;
		4:a_to_g = 7'b1000000;
		5:a_to_g = 7'b1000000;
		6:a_to_g = 7'b1000000;
		7:a_to_g = 7'b1000000;
		8:a_to_g = 7'b1000000;
		9:a_to_g = 7'b1000000;
		default: a_to_g = 7'b0000000;
	endcase
end
endmodule
module SSDisp(sw,seg,an);
input [9:0] sw;
output [6:0] seg;
output [3:0] an;
SSDisp UUT();
decoder_7seg ss(led,seg)
endmodule

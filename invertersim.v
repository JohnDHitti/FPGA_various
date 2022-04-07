module eightand(out1, in1, in2, in3,in4,in5,in6,in7,in8);
input in1, in2, in3,in4,in5,in6,in7,in8;
output out1;
assign out1=in1& in2& in3&in4&in5&in6&in7&in8;

endmodule

`timescale 1ns/1ps
module eightand_tb;
reg [7:0] in;
wire out1;
eightand uut(.out1(out1),.in1(in[7]),.in2(in[6]),.in3(in[5]),.in4(in[4]),.in5(in[3]),.in6(in[2]),.in7(in[1]),.in8(in[0]));
initial begin
	in[7:0]=8'b0;
	#100;
	in[7:0]=8'b10010;
	#100;
	in[7:0]=8'b11111111;
	#100;
end
endmodule


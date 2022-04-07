module eightand(out1, in1, in2, in3,in4,in5,in6,in7,in8);
input in1, in2, in3,in4,in5,in6,in7,in8;
output out1;
assign out1=in1& in2& in3&in4&in5&in6&in7&in8;

endmodule

`timescale 1ns/1ps
module inverter_tb(sw,led);
input [7:0] sw;
output [0:0] led;
eightand uut(.out1(led),.in1(sw[7]),.in2(sw[6]),.in3(sw[5]),.in4(sw[4]),.in5(sw[3]),.in6(sw[2]),.in7(sw[1]),.in8(sw[0]));

endmodule

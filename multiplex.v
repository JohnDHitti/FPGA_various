module four_to_one_multiplexer(y,x,s);
input [1:0] s;
input [3:0] x;
output y;
assign y=(x[0]&~s[1]&~s[0])|(x[1]&~s[1]&s[0])|(x[2]&s[1]&~s[0])|(x[3]&s[1]&s[0]);
endmodule
`timescale 1ns/1ps
module multi_tb;
reg [3:0] x;
reg [1:0] s;
wire y;
initial begin
x=4'b0000; s=2'b00;
#100;
x=4'b1111; s=2'b00;
#100;
x=4'b0000; s=2'b01;
#100;
x=4'b1111; s=2'b01;
#100;
x=4'b0000; s=2'b10;
#100;
x=4'b1111; s=2'b10;
#100;
x=4'b0000; s=2'b11;
#100;
x=4'b1111; s=2'b11;
#100;
end
four_to_one_multiplexer UUT(.s(s),.x(x),.y(y));
endmodule
//module multi_tb(sw,led);
//input [5:0] sw;
//output [0:0] led;
//four_to_one_multiplexer UUT(.s(sw[5:4]),.x(sw[3:0]),.y(led));
//endmodule

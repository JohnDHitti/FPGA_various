module blocking_nonblocking(y,x);

input x;
output reg [5:0] y;

initial y=6'b000000;

begin
y[0] = x;
y[1] = y[0];
y[2] = y[1];

y[3] <= x;
y[4] <= y[3];
y[5] <= y[4];
end
endmodule

`timescale 1ns/1ps
module block_test;
reg in1t;

wire [5:0] yt;
blocking_nonblocking UUT(.y(yt), .x(in1t));
initial begin
in1t = 1;
#100;
repeat(4);
#100 
end
endmodule


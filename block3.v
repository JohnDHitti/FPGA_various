module blocking_nonblocking(y,x,clk);

input x,clk;
output reg [5:0] y;

initial y = 6'b000000;

always @ (posedge clk)
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
module blocking_nonblocking_tb;
reg in1t,clkt;
wire [5:0] yt;
blocking_nonblocking UUT(.y(yt), .x(in1t), .clk(clkt));
initial 
begin
in1t = 1;
clkt = 0;
#10;
clkt = 1;
end
endmodule


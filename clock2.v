module checker(x,y);
input [5:0] x;
output [1:0] y;
assign y[1]=~(x[0]^x[1]^x[2]^x[3]^x[4]^x[5]);
assign y[0]=(x[0]^x[1]^x[2]^x[3]^x[4]^x[5]);
endmodule
`timescale 1ns/1ps 
module checkertb; 
reg [5:0]x=6'b0;
wire [1:0]y;
checker UUT(.x(x),.y(y));
initial begin
x=6'b000001;
#1;
x=6'b000011;
#1;
x=6'b000111;
#1;
x=6'b001111;
#1;
x=6'b011111;
#1;
x=6'b111111;
#1;
end
endmodule

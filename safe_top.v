module safe_top(sw,led);
input[3:0] sw;
output [1:0] led;
safe UUT(.l(led),.s(sw));
endmodule

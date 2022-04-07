module car_top(sw,led);
input[2:0] sw;
output [1:0] led;
car UUT(.c(led),.s(sw));
endmodule

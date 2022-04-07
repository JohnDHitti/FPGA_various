module home_alarm_top(sw,led);
input[4:0] sw;
output [0:0] led;
home_alarm UUT(.a(led),.s(sw[3:0]),.m(sw[4]));
endmodule

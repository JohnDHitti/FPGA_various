module home_alarm(a,s,m);
input [3:0] s;
input m;
output a;

assign a=(s[0]|s[1]|s[2]|s[3])&m;

endmodule

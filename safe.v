module safe(l,s);
input [3:0] s;
output [1:0] l;
parameter p=4'b0101;
assign l[0] = ~(s[0]^p[0]) & ~(s[1]^p[1]) & ~(s[2]^p[2]) & ~(s[3]^p[3]);
assign l[1] = ~l[0];
endmodule

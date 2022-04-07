module car(c,s);
input [2:0] s;
output [1:0] c;
assign c[0]=(~s[0]&~s[1]&s[2])+(~s[0]&s[1]&~s[2])+(s[0]&~s[1]&~s[2])+(s[0]&s[1]&s[2]);
assign c[1]=(~s[0]&s[1]&s[2])+(s[0]&~s[1]&s[2])+(s[0]&s[1]&~s[2])+(s[0]&s[1]&s[2]);

endmodule

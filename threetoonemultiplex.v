module three_to_one_multiplexer(y,x,s);
input [1:0] s;
input [2:0] x;
output y;
assign y=s[1]?(s[0]?x[2]:x[1]):(x[0]));
endmodule

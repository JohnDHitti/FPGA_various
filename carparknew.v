module light(c,s,an);
input [4:0] s;
output reg [3:0] c;
output reg [3:0] an;
always @ (s)
begin
if (s[4]==1) an = 4'b1110;
else an = 4'b0000;
c <= s[3:0];
end
endmodule

module carTOP(sw,seg,an);
input [4:0] sw;
wire [3:0] c;
output [6:0] seg;
output [3:0] an;
light park1(.c(c),.s(sw[4:0]),.an(an));
decoder_7seg ss(c,seg);
endmodule

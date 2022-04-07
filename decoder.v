module two_to_four_decoder(y,x);

input [1:0] x;
output [3:0] y;

assign y[0] = ~x[0]&~x[1];
assign y[1] = x[0] & ~x[1];
assign y[2] = ~x[0] & x[1];
assign y[3] = x[0] & x[1];
endmodule

module decoder_tb;
reg [1:0] x;
wire [3:0] y;
initial begin
	x=2'b0;
	#10;
	x=2'b01;
	#10;
	x=2'b10;
	#10;
	x=2'b11;
	#10;
end
two_to_four_decoder UUT(.y(y),.x(x));
endmodule

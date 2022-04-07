module encoder(x,y);
input [7:0] x;
output reg [2:0] y;

initial 
	y=3'bzzz;
always @ (x)
	casex(x)
		8'b1xxxxxxx : y=3'b111;
		8'b01xxxxxx : y=3'b110;
		8'b001xxxxx : y=3'b101;
		8'b0001xxxx : y=3'b100;
		8'b00001xxx : y=3'b011;
		8'b000001xx : y=3'b010;
		8'b0000001x : y=3'b001;
		8'b00000001 : y=3'b000;
		default : y = 3'bzzz;
	endcase
endmodule

`timescale 1ns/1ps
module encoder_tb;
reg [7:0] x;
wire [2:0] y;

initial begin
	x=8'b10001010;
	#10;
	x=8'b01010000;
	#10;
	x=8'b00101000;
	#10;
	x=8'b00010010;
	#10;
	x=8'b00001010;
	#10;
	x=8'b00000111;
	#10;
	x=8'b00000011;
	#10;
	x=8'b00000001;
	#10;
end
encoder UUT(.x(x),.y(y));
endmodule





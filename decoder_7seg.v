module decoder_7seg(in1,out1);

input [3:0] in1;
output reg [6:0] out1;

always @ (in1)
	case (in1)
4'b0000 : out1=7'b1000000;
4'b0001 : out1=7'b1111001;
4'b0010 : out1=7'b0100100;
4'b0011 : out1=7'b0110000;
4'b0100 : out1=7'b0011001;
4'b0101 : out1=7'b0010010;
4'b0110 : out1=7'b0000010;
4'b0111 : out1=7'b1111000;
4'b1000 : out1=7'b0000000;
4'b1001 : out1=7'b0010000;
4'b1010 : out1=7'b0001000;
4'b1011 : out1=7'b0000011;
4'b1100 : out1=7'b1000110;
4'b1101 : out1=7'b0100001;
4'b1110 : out1=7'b0000110;
4'b1111 : out1=7'b0001110;
endcase
endmodule


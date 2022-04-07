module three_bit_even_parity_generator(p,A,B,C);
input A,B,C;
output p;
assign p=A^B^C;
endmodule
module three_bit_even_parity_check(p,A,B,C,chk);
input A,B,C,p;
output chk;
assign chk=(A^B)^(C^p);
endmodule
`timescale 1ns/1ps

module parity_tb;
reg A,B,C;
wire p, chk;
three_bit_even_parity_generator UUT(.p(p),.A(A),.B(B),.C(C));
three_bit_even_parity_check UUD(.p(p),.A(A),.B(B),.C(C),.chk(chk));
initial begin
	A=0;B=0;C=0;
	#10;
	A=1;B=0;C=0;
	#10;
	A=0;B=1;C=1;
	#10;
	A=1;B=1;C=1;
	#10;
	A=0;B=0;C=1;
	#10;
end 
endmodule

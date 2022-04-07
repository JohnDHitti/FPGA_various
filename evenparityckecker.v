module three_bit_even_parity_check(p,A,B,C,chk);
input A,B,C,p;
output chk;
assign chk=(A^B)^(C^p);
endmodule
`timescale 1ns/1ps
//module parity_tb;
//reg A,B,C,p;
//wire chk;
//three_bit_even_parity_generator UUT(.p(p),.A(A),.B(B),.C(C),.chk(chk));
//initial begin
//	A=0;B=0;C=0;p=1;
//	#10;
//	A=1;B=0;C=0;p=1;
//	#10;
//	A=0;B=1;C=1;p=0;
//	#10;
//	A=1;B=1;C=1;p=1;
//	#10;
//	A=0;B=0;C=1;p=0;
//	#10;
//end 
//endmodule

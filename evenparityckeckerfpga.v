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

module parity_tb(sw,led);
input [2:0] sw;
output [1:0] led;
wire p;
three_bit_even_parity_generator UUT(.p(led[0]),.A(sw[2]),.B(sw[1]),.C(sw[0]));
three_bit_even_parity_check UUD(.p(led[0]),.A(sw[2]),.B(sw[1]),.C(sw[0]),.chk(led[1]));
//three_bit_even_parity_generator UUT(.p(p),.A(sw[3]),.B(sw[2]),.C(sw[1]),.chk(led));
//three_bit_even_parity_check UUD(.p(p),.A(A),.B(B),.C(C),.chk(led));
endmodule

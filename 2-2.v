module first_system(out1,out2,in1,in2);

input in1,in2;
output out1,out2;

wire and_out,or_out;

assign and_out = in1 & in2;
assign or_out  = in1 | in2;
assign out1 = and_out ^ or_out;
assign out2 = ~in2;

endmodule

`timescale 1ns/1ps
module first_system_tb;
reg in1t, in2t;
wire out1t, out2t;
first_system uut(.out1(out1t), .out2(out2t), .in1(in1t), .in2(in2t));
initial begin
in1t = 0;
in2t = 0;
#100;
repeat(4)
#100 {in1t,in2t} = {in1t,in2t} + 1'b1;
end
endmodule


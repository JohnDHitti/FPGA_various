`timescale 1ns/1ps
//module myRom(addra,douta,clka);
//input [15:0]addra;
//input clka;
//output reg [7:0]douta;
//reg [15:0]mem[0:61440];
//always @ (posedge clka)
//begin
//douta<=mem[addra];
//end
//endmodule

module rom_tb;
reg [15:0] address;
reg clk;
wire [7:0] data;
integer i;
initial begin
address = 0;
clk = 0;
for (i=0; i<6000000; i = i+1)begin
#10
clk=~clk;
address = i;
#10
clk=~clk;
address = 0;
end
end
blk_mem_gen_1 U(
.addra(address), // Address input
.douta(data), // Data output
.clka(clk)
);
endmodule

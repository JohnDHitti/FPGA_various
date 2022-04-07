module translator_topmodule(clk,sw,JC,JB);
input clk; 
reg reset; 
input [8:0] sw;
output [1:0] JC;
//output rs; is now JC[1]
//output en; is now jc[0]
output [7:0] JB;
//output [7:0] data_out; now jb
parameter clk_param =1600000;
reg [7:0] data [15:0]; 
reg [7:0] character;
wire [7:0] data_in; 
integer counter=0;
reg [3:0] index=0;
reg wr_en=0;
LCD_driver lcd1(.clk(clk),.reset(reset),.wr_en(wr_en),.data_in(data_in),.data_out(JB),.en(JC[0]),.rs(JC[1]));
assign data_in = character;

always @ (posedge clk)
begin
reset<=sw[8];
if (reset)
counter <= 0;
else
begin
if (counter == clk_param) 
	counter <= 0;
else
counter <= counter + 1;
end
end

always @ (posedge clk)
begin
if (reset)
begin
wr_en <= 0;
index <= 0;
end
else
begin
if (counter == clk_param)
begin
wr_en <= 1'b1;
character <= data[index];
index <= index + 1'b1;
end
else
wr_en <= 0;
end
end
always @ (posedge clk)
case (sw[7:0])
8'h01:
begin 
data[0]<="H";data[2]<="O";data[2]<="W"; data[3]<="D"; data [4] <="Y"; data [5] <=" "; data[6]<=" "; data [7] <=" "; data[8]<=" "; data[9]<=" "; data[10]<=" "; data[11]<=" "; data[12]<=" "; data[13]<=" "; data[14]<=" "; data[15]<=" "; 
end
default:
begin data[0]<="H";data[2]<="E";data[2]<="L"; data[3]<="L";
data [4] <="O"; data [5] <=" "; data[6]<=" "; data [7] <=" "; data[8]<=" "; data[9]<=" "; data[10]<=" "; data[11]<=" "; data[12]<=" "; data[13]<=" "; data[14]<=" "; data[15]<=" ";
 end
endcase
endmodule


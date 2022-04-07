module VGA_top_module(clk,vgaRed,vgaGreen,vgaBlue,Hsync,Vsync);
input clk;
output [3:0] vgaRed;
output [3:0] vgaGreen;
output [3:0] vgaBlue;
output Hsync; 
output Vsync;
//image size
parameter sx=640;
parameter sy=480;
wire clk25;
wire [12:0] pixel_addr; 
wire [8:0] pixel_data=9'b111111111;
//integer rxmax=650;
//integer rxmin=600;

clk_wiz_0 clock (clk25, clk);
//movement(.clk25(clk25),.rxmax(rxmax),.rxmin(rxmin));
//rgb uut(.clk25(clk25),.pixel_data(pixel_data));
//dist_mem_gen_0 memory(.a(pixel_addr),.spo(pixel_data));

VGA_module VGA(
.clk25(clk25),
.pixel_data(pixel_data),
.sx(sx), 
.sy(sy),
.red(vgaRed),
.green(vgaGreen),
.blue(vgaBlue), 
.Hsync(Hsync),
.Vsync(Vsync),
.pixel_addr(pixel_addr));
endmodule

module movement(clk25,rxmax,rxmin);
input clk25;
output reg [12:0] rxmax=13'd1111101;
output reg [12:0] rxmin=13'd10000;
integer cnt=0;
always @(posedge clk25)
begin
cnt<=cnt+1;
if (cnt>25000000)
begin
rxmax<=rxmax+1;
rxmin<=rxmin+1;
cnt<=0;
end
end
endmodule

module rgb(clk25,pixel_data);
input clk25;
output reg [7:0] pixel_data;
parameter cntone=32'd001010101;
parameter cnttwo=32'd010101010;
parameter cntthree=32'd100000000;
reg [31:0] cnt;
always @(posedge clk25)
if (cnt>=cntthree)
	begin
		cnt<=32'd0;
		
	end
else if (cnt>=cnttwo)
	begin
		pixel_data<=8'b00111000;
cnt<=cnt+32'd1;
	end
else if (cnt>=cntone)
	begin
		pixel_data<=8'b11000000;
cnt<=cnt+32'd1;
	end
	else
	begin
		pixel_data<=8'b00000111;
cnt<=cnt+32'd1;
	end
	
	
endmodule

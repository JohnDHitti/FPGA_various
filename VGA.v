module VGA_top_module(clk,vgaRed,vgaGreen,vgaBlue,Hsync,Vsync);
input clk;
output [2:0] vgaRed;
output [2:0] vgaGreen;
output [1:0] vgaBlue;
output Hsync; 
output Vsync;
//image size
parameter sx=640;
parameter sy=480;
wire clk25;
wire [12:0] pixel_addr; 
wire [7:0] pixel_data;

clk_wiz_0 clock (clk25, clk);
rgb uut(.clk25(clk25),.pixel_data(pixel_data));
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

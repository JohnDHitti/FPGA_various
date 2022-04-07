module VGA_module (clk25,pixel_data,sx,sy,red,green,blue,Hsync,Vsync,pixel_addr);

input clk25;
input [7:0] pixel_data;
input [7:0] sx, sy;
output reg [2:0] red, green, blue; 
output reg Hsync, Vsync;
output reg [12:0] pixel_addr;
localparam HDISP=640;
localparam HFP=16;
localparam HPW=96; 
localparam HLIM=800;
localparam VDISP=480; 
localparam VFP=10; 
localparam VPW=2;
localparam VLIM=525;

reg [10:0] hcount=0; 
reg [10:0] vcount=0; 
reg enable=0;

always @(posedge clk25)
begin
if (hcount < HLIM-1)
hcount <= hcount+1;
else
begin
hcount<=0;
if (vcount < VLIM-1)
vcount <= vcount+1;
else
vcount <= 0; 
end
if (vcount > sy) begin
pixel_addr<=-1;
enable <= 0; end
else
begin
if (hcount < sx)
begin
enable <= 1;
pixel_addr <=pixel_addr+1;
end
else
enable <= 0; end
if (enable==1) 
begin
red <= pixel_data[2:0];
green <= pixel_data[5:3];
blue <= pixel_data[7:6];
end
else
begin
red	<= 3'b000;
green <= 2'b00;
blue <= 2'b00; end
if (hcount > (HDISP+HFP) && hcount <=(HDISP+HFP+HPW)) 
Hsync <= 0;
else
Hsync <= 1;
if (vcount >= (VDISP+VFP) && vcount<(VDISP+VFP+VPW)) 
Vsync <= 0;
else
Vsync <= 1;
end
endmodule


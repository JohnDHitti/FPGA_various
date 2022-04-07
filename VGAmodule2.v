module VGA_module (clk25,pixel_data,sx,sy,red,green,blue,Hsync,Vsync,pixel_addr);

input clk25;
input [8:0] pixel_data;
input [9:0] sx, sy;
output reg [3:0] red, green, blue; 
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

localparam gymin=32;
localparam gymax=35;
localparam rymax=250;
localparam rymin=200;
integer rxmax=5;
integer rxmin=0;

reg [12:0] hcount=0; 
reg [12:0] vcount=0; 
reg enable=0;
integer cnt=0;
reg updown=0;
always @(posedge clk25)
begin
//insert time code
begin
cnt<=cnt+1;
if (cnt>250000)
begin
//
if (rxmax>600)
updown<=1;
if (rxmax<20)
updown<=0;
if (updown==1)
begin
rxmax<=rxmax-1;
rxmin<=rxmin-1;
end
else if (updown==0)
begin
rxmax<=rxmax+1;
rxmin<=rxmin+1;
end

cnt<=0;
//
end
end
//time code end
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
//put code here
if (hcount>gymin&&hcount<gymax)
begin
red	<= 4'b0000;
green <= 4'b1111;
blue <= 4'b0000;
end
else if (hcount>rxmin&&hcount<rxmax&&vcount>rymin&&vcount<rymax)
begin
red	<= 4'b1111;
green <= 4'b0000;
blue <= 4'b0000;
end
else
begin
red	<= 4'b1111;
green <= 4'b1111;
blue <= 4'b1111; 
end
//red <= piel_data[2:0];
//green <= pixel_data[5:3];
//blue <= pixel_data[8:6];
// 
end
else
begin
red	<= 4'b0000;
green <= 4'b0000;
blue <= 4'b0000; end
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


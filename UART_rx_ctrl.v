module UART_rx_ctrl(clk,rx,data,parity,ready,error);
input clk,rx;
output reg [7:0] data; 
output reg parity;
output reg ready=0; 
output reg error=0;
parameter baud=9600;
localparam RDY=3'b000,START=3'b001,RECEIVE=3'b010,WAIT=3'b011,CHECK=3'b100; 
reg [2:0] state = RDY;
localparam [31:0] baud_timer = 100000000/baud;
reg [31:0] timer = 32'b0; 
reg [3:0] bitIndex = 3'b0; 
reg [8:0] rxdata;

always @ (posedge clk)
case (state)
RDY:
if (rx == 1'b0)
begin
state <= START;
bitIndex <= 3'b0;
end
START:
if (timer == baud_timer/2)
begin
state <= WAIT; 
timer <= 14'b0; 
error <= 1'b0;
ready <= 1'b0; 
end
else timer <= timer + 1'b1;
WAIT:
if (timer == baud_timer)
begin
timer <= 14'b0;
if (ready) state <= RDY;
else state <= RECEIVE;
end
else timer <= timer + 1'b1;
RECEIVE:
begin
rxdata[bitIndex] <= rx;
bitIndex <= bitIndex + 1'b1;
if (bitIndex == 4'd8) state <= CHECK; 
else state <= WAIT;
end
CHECK:
if (^rxdata[7:0] == rxdata[8])
begin
ready <= 1'b1;
state <= RDY;// this can be WAIT as well 
data <= rxdata[7:0];
parity <= rxdata[8];
end
else
begin
ready <= 1'b1; 
data[7:0] <= 8'bx;
error <= 1'b1;
state <= RDY;
 end
endcase
endmodule


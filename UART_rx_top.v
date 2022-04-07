module UART_rx_top(clk,RsRx,led,seg,an);
output [6:0] seg;
output reg [3:0] an;
reg [3:0]counter=4'b0000;
decoder_7seg ss(counter,seg);
input clk, RsRx;
output reg [15:0] led = 0;
localparam RX_RDY=2'b00, RX_WAIT=2'b01, RX_DATARDY=2'b10;
reg [1:0] state=RX_RDY; 
wire data_ready;
wire[7:0] out;
wire parity;
wire error;
UART_rx_ctrl #(19200) RX(.clk(clk), .rx(RsRx), .data(out),.parity (parity),.ready(data_ready),.error(error));

always @(posedge clk)
begin
an=4'b1110;
counter<=led[3:0];
case (state)
RX_RDY:
if (!data_ready) state <= RX_WAIT;
RX_WAIT:
if (data_ready) state <= RX_DATARDY; 
RX_DATARDY:
begin
led[9:0] <= {error,parity,out};
led[15:10] <= led[15:10] + 1'b1; 
state <= RX_RDY;
end
endcase
end
endmodule


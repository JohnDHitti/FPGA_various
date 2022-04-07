module UART_tx_top (clk, btnC, RsTx);
input clk,btnC;
output RsTx;
reg [7:0] initStr = 8'h41; // ASCII 'A' character
//
localparam btnWait=2'b00,btnSend=2'b01,btnSendWait=2'b10;
reg btnC_prev;
reg [7:0] uartData;
reg [1:0] state = btnWait;
wire btnC_clr;
wire uartSend;
wire uartRdy;

debounce debounce_UT(.clk(clk),.btn(btnC),.btn_clr(btnC_clr));

UART_tx_ctrl #(19200) uart(.clk(clk),.send(uartSend),.data(uartData),.uart_tx(RsTx),.ready(uartRdy));
// #(19200) overrides the 'baud' parameter. 'localparam' cannot be modified but 'parameter' can. If there are more than 1 parameters, i t should be declared as 1#(parametr baud = 19200)'
always	@(posedge clk)
begin
btnC_prev<=btnC_clr;
case (state)
btnWait:
if (btnC_clr==1'b1 && btnC_prev==0) state <= btnSend;
btnSend:
begin
uartData<=initStr;
initStr<=initStr + 1'b1;
state <= btnWait;
end
btnSendWait:
if (uartRdy) state <= btnWait;
default: state<=btnWait;
endcase
end
assign uartSend=(state==btnSend);
endmodule


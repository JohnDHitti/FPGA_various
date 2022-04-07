module homealarm(sw,led,seg,an);
input [4:0] sw;
output [0:0] led;
output [6:0] seg;
output [3:0] an;
wire [3:0] act;
assign an =4'b1110;
assign act ={sw[4],1'b0,sw[4],1'b0};
decoder_7seg ss(act,seg);
home_alarm HA(.a(led),.s(sw[3:0]),.m(sw[4]));
endmodule

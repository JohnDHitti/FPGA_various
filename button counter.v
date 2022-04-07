
//module SSDisp(input UNKNOWN,
//	input [15:0] x, 
//	output reg [6:0] a_to_g,
//	output wire [3:0] an,
//	output wire dp);
//reg [3:0] digit;
//assign dp = 1;
//assign an = 4'b0000;
//always @(posedge clk)
//begin
//	digit<=x[3:0];
//	case(digit)

//		0:a_to_g = 7'b1000000;
//		1:a_to_g = 7'b1000000;
//		2:a_to_g = 7'b1000000;
//		3:a_to_g = 7'b1000000;
//		4:a_to_g = 7'b1000000;
//		5:a_to_g = 7'b1000000;
//		6:a_to_g = 7'b1000000;
//		7:a_to_g = 7'b1000000;
//		8:a_to_g = 7'b1000000;
//		9:a_to_g = 7'b1000000;
//		default: a_to_g = 7'b0000000;
//	endcase
//end
//endmodule

module buttonCounter(btnC,clk,seg,an);
input clk;
input btnC;
output [6:0] seg;
output reg [3:0] an;
wire btn_clr;
reg prevbtn;
reg [3:0]counter=4'b0000;
decoder_7seg ss(counter,seg);
debounce uut(.clk(clk),.btn(btnC),.btn_clr(btn_clr));
always @(posedge clk)
begin
an=4'b1110;
if (btn_clr!=prevbtn && btn_clr==1)
    begin
    counter<=counter+4'b0001;
    if (counter==4'b1001)
        counter<=4'b0000;
    end
prevbtn<=btn_clr;
end
endmodule

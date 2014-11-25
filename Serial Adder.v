`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    09:53:58 11/25/2014 
// Design Name:    Serial Adder Model
// Module Name:    seadd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//Serial Adder Module
module seadd(a,b,clk,rst, res);
    input a,b,clk,rst;
    output [03:0] res;
	 reg [03:0] res;
	 reg sum,carry;
	 integer count;
	 initial count=4;
	 always@(negedge clk)
	 begin
		if(rst)
		begin
			carry=0;count=0;res=0;
		end
		else
		begin
			if(count<4)
			begin
				count=count+1;
				sum=a^b^carry;
				carry=(a&b)|(b&carry)|(carry&a);
			   res={sum,res[3:1]};
			end
		end
	 end
endmodule

//Test bench Module
module tb();
reg ta,tb,tclk,trst;
wire [3:0]tres;
seadd ad(.a(ta),.b(tb),.res(tres),.clk(tclk),.rst(trst));
initial
begin
	$monitor(ta,tb,trst,tclk,tres);
	tclk=1;
	ta=0;tb=1;
	#2 trst=1;
	#5 trst=0;
end
always #5 tclk=~tclk;
always #5 ta=~ta;
always #5 tb=~tb;
endmodule

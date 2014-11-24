`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    16:53:34 11/24/2014 
// Design Name:    D Flip Flop
// Module Name:    dff 
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

//D Flipflop Module
module dff(d,clk, q,qb);
    input d,clk;
    output q,qb;
	 reg q,qb;
	 initial q=0;
	 initial qb=~q;
	 always@(posedge  clk)
	 begin
		if(d==0)
			q=0;
		else
			q=1;
	 qb=~q;
	 end 
endmodule

//T Flipflop Module
module tb();
	reg td,tclk;
	wire tq,tqb;
	dff ff(.d(td),.clk(tclk),.q(tq),.qb(tqb));
	initial
	begin
		tclk=0; td=0; #10;
		tclk=1; td=0; #10;
		tclk=0; td=1; #10;
		tclk=1; td=1; #10;
	end
endmodule
		

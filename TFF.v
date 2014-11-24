`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    16:59:29 11/24/2014 
// Design Name:    T Flip FLop
// Module Name:    tff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 1
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

// T Flipflop Module
module tff(t,clk, q,qb);
    input t,clk;
    output q,qb;
	 reg q,qb;
	 initial q=0;
	 initial qb=~q;
	 always@(posedge clk)
	 begin
		if(t==1)
			q=~q;
		else 
			q=q;
		qb=~q;
		end
endmodule

//Testbench Module
module tb();
	reg tt,tclk;
	wire tq,tqb;
	tff uut(.t(tt),.clk(tclk),.q(tq),.qb(tqb));
	initial
	begin
		tclk=0; tt=0; #10;
		tclk=1; tt=0; #10;
		tclk=0; tt=1; #10;
		tclk=1; tt=1; #10;
		tclk=0; tt=1; #10;
		tclk=1; tt=1; #10;
		tclk=0; tt=0; #10;
		tclk=1; tt=0; #10;
		tclk=0; tt=1; #10;
		tclk=1; tt=1; #10;
	end
endmodule
 
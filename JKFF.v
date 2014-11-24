`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    10:14:25 11/24/2014 
// Design Name:    JK FlipFlop
// Module Name:    jkff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 2
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//JK Flipflop Module
module jkff(j,k,clk,q,qb);
	input j,k,clk;
	output q,qb;
	reg q,qb;
	initial q=0;
	initial qb=~q;
	always@(posedge clk)	
	begin	
		if(j==0 & k==0)		
			q=q;		
		else if(j==0 & k==1)
			q=0;		
		else if(j==1 & k==0)
			q=1;
		else 		
			q=~q;					
		qb=~q;
	end
endmodule

//Testbench Module
module tb();
	reg tj,tk,tclk;
	wire tq,tqb;
	jkff uut(.j(tj),.k(tk),.clk(tclk),.q(tq),.qb(tqb));
	initial
	begin
		tclk=0; tj=0; tk=0; #10;
		tclk=1; tj=0; tk=0; #10;
		tclk=0; tj=0; tk=1; #10;
		tclk=1; tj=0; tk=1; #10;
		tclk=0; tj=1; tk=0; #10;
		tclk=1; tj=1; tk=0; #10;
		tclk=0; tj=1; tk=1; #10;
		tclk=1; tj=1; tk=1; #10;
	end
endmodule

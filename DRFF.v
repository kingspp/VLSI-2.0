`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    19:55:26 11/24/2014 
// Design Name:    SR Flipflop
// Module Name:    srff 
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

//SR Flipflop Module
module srff(s,r,clk, q,qb);
    input s,r,clk;
    output q,qb;
	 reg q,qb;
	 initial q=0;
	 initial qb=~q;
	 always@(posedge clk)
	 begin
		if(s==0 & r==0)
		q=q;
		else if(s==0 & r==1)
		q=0;
		else if(s==1 & r==0)
		q=1;
		else if(s==1 & r==1)
		q=1'bZ;
	 qb=~q;
	 end
endmodule

//Test bench Module
module tb();
	reg ts,tr,tclk;
	wire tq,tqb;
	srff mg(.s(ts),.r(tr),.clk(tclk),.q(tq),.qb(tqb));
	initial
	begin
		tclk=0; ts=0; tr=0; #10;
		tclk=1; ts=0; tr=0; #10;
		tclk=0; ts=0; tr=1; #10;
		tclk=1; ts=0; tr=1; #10;
		tclk=0; ts=1; tr=0; #10;
		tclk=1; ts=1; tr=0; #10;
		tclk=0; ts=1; tr=1; #10;
		tclk=1; ts=1; tr=1; #10;
	end
endmodule
		

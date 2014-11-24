`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Code-Tronix
// Engineer: Prathyush S.P
// 
// Create Date:    09:09:31 11/24/2014 
// Design Name: 	 Master Slave JK Flip - Structural Design
// Module Name:    msjk 
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

//MSJK Main module
module msjk(mj,mk,clk,sj,sk, mq,mqb,sq,sqb);
    input mj,mk,clk,sj,sk;
    output mq,mqb,sq,sqb;
	 jkff master(mj,mk,clk,mq,mqb);
	 jkff slave(mq,mqb,~clk,sq,sqb);
endmodule

//JK Flipflop Module
module jkff(j,k,clk,q,qb);
	input j,k,clk;
	output q,qb;
	reg q,qb;	
	always@(posedge clk)
	begin
		q=1;
		qb=~q;
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
	reg tmj,tmk,tclk;
	wire tsq,tsqb;
	msjk mygate(.mj(tmj),.mk(tmk),.clk(tclk),.sq(tsq),.sqb(tsqb));
	initial
	begin
		tclk=0; tmj=0; tmk=0; #10;
		tclk=1; tmj=0; tmk=0; #10;
		tclk=0; tmj=0; tmk=1; #10;
		tclk=1; tmj=0; tmk=1; #10;
		tclk=0; tmj=1; tmk=0; #10;
		tclk=1; tmj=1; tmk=0; #10;
		tclk=0; tmj=1; tmk=1; #10;
		tclk=1; tmj=1; tmk=1; #10;
	end
endmodule
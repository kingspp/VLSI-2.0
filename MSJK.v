`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	   Code-Tronix
// Engineer: 	   Prathyush S.P
// 
// Create Date:    09:09:31 11/24/2014 
// Design Name:    MSJK Flipflop (Structural)
// Module Name:    msjk 
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
module msjk(mj,mk,clk,sj,sk, mq,mqb,sq,sqb);
    input mj,mk,clk,sj,sk;
    output mq,mqb,sq,sqb;
	 jkff master(mj,mk,clk,mq,mqb);
	 jkff slave(mq,mqb,~clk,sq,sqb);
endmodule


module jkff(j,k,clk,q,qb);
	input j,k,clk;
	output q,qb;
	reg q,qb;	
	always@(posedge clk)
	begin
		q=1;
		qb=~q;
		if(j==0 & k==0)
		begin
			q=q;
			qb=qb;
		end
		if(j==0 & k==1)
		begin
			q=0;
			qb=~q;
		end
		if(j==1 & k==0)
		begin
			q=1;
			qb=~q;
		end
		if(j==1 & k==1)
		begin
			q=~q;
			qb=~q;
		end
	end
endmodule


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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    23:24:04 11/24/2014 
// Design Name:    Universal Gates - NAND
// Module Name:    UG 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 4 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//NAND Gate Module
module nand_ug(a,b, nand_and,nand_or,nand_not,temp,temp2);
    input a,b;
    output nand_and,nand_or,nand_not,temp,temp2;	
	 assign temp=~(a&b);
	 assign nand_and=~temp;
	 assign temp2=(~a&~a)&(~b&~b);
	 assign nand_or=~temp2;
	 assign nand_not=~a&~a;
endmodule

//Testbench Module
module tb();
	reg ta,tb;
	wire tnand_and,tnand_or,tnand_not;
	nand_ug uut(.a(ta),.b(tb),.nand_and(tnand_and),.nand_or(tnand_or),.nand_not(tnand_not));
	initial
	begin
		ta=0; tb=0; #10;
		ta=0; tb=1; #10;
		ta=1; tb=0; #10;
		ta=1; tb=1; #10;
	end
endmodule
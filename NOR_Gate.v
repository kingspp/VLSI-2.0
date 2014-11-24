`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    23:40:53 11/24/2014 
// Design Name:    Universal Gate - NOR
// Module Name:    ug_nor 
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

//NOR Gate Module
module nor_ug(a,b, nor_and,nor_or,nor_not,temp,temp2);
    input a,b;
    output nor_and,nor_or,nor_not,temp,temp2;	
	 assign temp=~(a|b);
	 assign nor_or=~temp;
	 assign temp2=(~a|~a)|(~b|~b);
	 assign nor_and=~temp2;
	 assign nor_not=~a|~a;
endmodule

//Testbench Module
module tb();
	reg ta,tb;
	wire tnor_and,tnor_or,tnor_not;
	nor_ug uut(.a(ta),.b(tb),.nor_and(tnor_and),.nor_or(tnor_or),.nor_not(tnor_not));
	initial
	begin
		ta=0; tb=0; #10;
		ta=0; tb=1; #10;
		ta=1; tb=0; #10;
		ta=1; tb=1; #10;
	end
endmodule
	

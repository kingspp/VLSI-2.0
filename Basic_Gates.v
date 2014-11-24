`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    20:54:32 11/24/2014 
// Design Name:    Basic Gates Module
// Module Name:    bg 
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

//Basic gates Module
module bg(a,b,and_op,or_op,not_op);
	input a,b;
	output and_op,or_op,not_op;
	assign and_op=a&b;
	assign or_op=a|b;
	assign not_op=~a;	
endmodule

//Test bench Module
module tb();
	reg ta,tb;
	wire tand_op,tor_op,tnot_op;
	bg ut(.a(ta),.b(tb),.and_op(tand_op),.or_op(tor_op),.not_op(tnot_op));
	initial
	begin
		ta=0; tb=0; #10;
		ta=0; tb=1; #10;
		ta=1; tb=0; #10;
		ta=1; tb=1; #10;
	end
endmodule
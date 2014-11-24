`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    20:40:37 11/24/2014 
// Design Name:    All Gates Module
// Module Name:    allg 
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

//All gates Module
module allg(a,b,and_op,or_op,not_op,nand_op,nor_op,xor_op,xnor_op);
	input a,b;
	output and_op,or_op,not_op,nand_op,nor_op,xor_op,xnor_op;
	assign and_op=a&b;
	assign or_op=a|b;
	assign not_op=~a;
	assign nand_op=~and_op;
	assign nor_op=~or_op;
	assign xor_op=(~a&b)|(a&~b);
	assign xnor_op=~xor_op;
endmodule

//Test bench Module
module tb();
	reg ta,tb;
	wire tand_op,tor_op,tnot_op,tnand_op,tnor_op,txor_op,txnor_op;
	allg ut(.a(ta),.b(tb),.and_op(tand_op),.or_op(tor_op),.not_op(tnot_op),.nand_op(tnand_op),.nor_op(tnor_op),.xor_op(txor_op),.xnor_op(txnor_op));
	initial
	begin
		ta=0; tb=0; #10;
		ta=0; tb=1; #10;
		ta=1; tb=0; #10;
		ta=1; tb=1; #10;
	end
endmodule
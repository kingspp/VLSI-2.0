`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    20:59:52 11/24/2014 
// Design Name:    Special Gates Module
// Module Name:    sg 
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

//Special Gates Module
module sg(a,b, xor_op,xnor_op);
    input a,b;
    output xor_op,xnor_op;
	 assign xor_op=(~a&b)|(a&~b);
	 assign xnor_op=(~a&~b)|(a&b);
endmodule

//Test Bench Module
module tb();
	reg ta,tb;
	wire txor_op,txnor_op;
	sg mg(.a(ta),.b(tb),.xor_op(txor_op),.xnor_op(txnor_op));
	initial
	begin
		ta=0; tb=0; #10;
		ta=0; tb=1; #10;
		ta=1; tb=0; #10;
		ta=1; tb=1; #10;
	end
endmodule
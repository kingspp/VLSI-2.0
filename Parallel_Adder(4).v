`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    07:07:56 11/25/2014 
// Design Name:    Parallel Adder - Structural Model [4bit]
// Module Name:    pa 
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

//Parallel Adder Module
module pa(a,b,c,s);
    input [03:0] a,b;
    output [03:0] c,s;
	 halfadder h1(a[0],b[0],1'b0,c[0],s[0]);
	 halfadder h2(a[1],b[1],c[0],c[1],s[1]);
	 halfadder h3(a[2],b[2],c[1],c[2],s[2]);
	 halfadder h4(a[3],b[3],c[2],c[3],s[3]);
endmodule

//Half Adder Module
module halfadder(a,b,c,carry,sum);
	input a,b,c;
	output carry,sum;
	assign sum=a^b^c;
	assign carry=(a&b)|(b&c)|(c&a);
endmodule

//Testbench Module
module tb();
	reg [3:0] ta,tb;
	wire [3:0] tc,ts;
	pa ut(.a(ta),.b(tb),.c(tc),.s(ts));
	initial
	begin
		ta[3]=0; ta[2]=0; ta[1]=0; ta[0]=0;       // a=0000
		tb[3]=0; tb[2]=0; tb[1]=0; tb[0]=1; #10;  // b=0001 
		ta[3]=0; ta[2]=0; ta[1]=1; ta[0]=0;       // a=0010
		tb[3]=0; tb[2]=0; tb[1]=1; tb[0]=0; #10;  // b=0010
	end
endmodule
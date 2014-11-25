`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    08:02:07 11/25/2014 
// Design Name:    Asynchronous Up Counter Model
// Module Name:    asycup 
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

//Asynchronous Up Counter Module
module asycup(clk,rst, z);
    input clk,rst;
    output [03:0] z;
	 reg z0,z1,z2,z3;
	 always@(posedge clk or posedge rst)
	 begin
		if(rst)
			z0=1'b0;
		else
			z0=~z0;
	 end
	 always@(negedge z0 or posedge rst)
	 begin
		if(rst)
			z1=1'b0;
		else
			z1=~z1;
	 end
	 always@(negedge z1 or posedge rst)
	 begin
		if(rst)
			z2=1'b0;
		else
			z2=~z2;
	 end
	 always@(negedge z2 or posedge rst)
	 begin
		if(rst)
			z3=1'b0;
		else
			z3=~z3;
	 end
	 assign z={z3,z2,z1,z0};
endmodule

//Testbench Module
module tb();
	reg tclk,trst;
	wire [3:0]tz;
	asycup yt(.clk(tclk),.rst(trst),.z(tz));
   initial
	begin
		tclk=0; trst=1; #10;
		tclk=1; trst=0; #10;
	end
	always
	#10 tclk=~tclk;
endmodule
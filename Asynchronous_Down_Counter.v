`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    07:23:18 11/25/2014 
// Design Name:    Asynchronous Down Counter Model
// Module Name:    asycd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 7
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

//Asynchronous Down Counter Module
module asycd(clk, z,rst);
    input clk,rst;
    output [03:0] z;
	 reg z0,z1,z2,z3;
	 always@(posedge clk or posedge rst)
	 begin		
		if(rst)
			z0=1'b1;
		else
			z0=~z0;
	 end	 
	 always@(posedge z0 or posedge rst)
	 begin
		if(rst)
			z1=1'b1;
		else
			z1=~z1;
	 end
	 always@(posedge z1 or posedge rst)
	 begin
		if(rst)
			z2=1'b1;
		else
			z2=~z2;
	 end
	 always@(posedge z2 or posedge rst)
	 begin
		begin
		if(rst)
			z3=1'b1;
		else
			z3=~z3;
	 end
	 end
	assign z={z3,z2,z1,z0};
endmodule

//Sample Module
/*
module asdown_tb();
	 reg tclk,trst;
	 wire[3:0]tz;
	 initial
	 begin
	 $monitor(tclk,tz,trst);
	 trst=1;
	 tclk=0;
	 #25 trst=0;
	 end
	 always
	 begin
	 #25 tclk=~tclk;
	 end 
	 asycd ut(.clk(tclk),.z(tz),.rst(trst));
endmodule 
	 */
	 
//Testbench Module
module tb();
	reg tclk,trst;
	wire [3:0]tz;
	asycd ut(.clk(tclk),.z(tz),.rst(trst));
	initial
	begin
		tclk=0; trst=1; #10;
		tclk=1; trst=0; #10;	
	end
	always 
	#10 tclk=~tclk;
endmodule
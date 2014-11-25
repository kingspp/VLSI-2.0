`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:        Code-Tronix
// Engineer:       Prathyush SP
// 
// Create Date:    11:08:39 11/25/2014 
// Design Name:    Synchronous Up Down Counter Model
// Module Name:    sync 
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

//Synchronous Up_Down Counter Module
module sync(m,clk, z);
    input m,clk;
    output [03:0] z;
	 reg [3:0]z;
	 initial z=4'b0000;
	 always@(posedge clk)
	 begin
		if(m==1)
		z=z+1;
		else
		z=z-1;
	 end
endmodule

//Testbench Module
module tb();
	reg tm,tclk;
	wire [3:0]tz;
	sync cnt(.m(tm),.z(tz),.clk(tclk));
	initial
		begin
		tclk=0;tm=1;
		end
	always #10 tclk=~tclk;	
endmodule
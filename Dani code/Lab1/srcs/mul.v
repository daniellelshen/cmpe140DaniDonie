`timescale 1ns / 1ps
module mul # (parameter WIDTH = 32) (
	input [WIDTH-1:0] x,
	input [WIDTH-1:0] y,
	output reg [WIDTH-1:0] z);
	
	always@(*)
	begin
    	z = x*y;
	end
endmodule

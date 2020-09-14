`timescale 1ns / 1ps
module mux2 # (parameter WIDTH = 32)(
	input sel,
	input [WIDTH-1:0] in0, in1,
	output reg [WIDTH-1:0] out);
	
	always @ (*)
	begin
    	out = sel? in1 : in0;
	end
endmodule

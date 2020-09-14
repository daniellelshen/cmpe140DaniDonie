`timescale 1ns / 1ps
// decrement the n upon entry

module cnt(
	input [3:0] n,
	input load, en, clk,
	output reg [3:0] out);
	
	always@(posedge clk)
	begin
    	if (load && en)
        	out = n;
    	else if (en && !load)
        	out = out - 1;
    	else
        	out = out;
	end

endmodule

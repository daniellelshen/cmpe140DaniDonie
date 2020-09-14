`timescale 1ns / 1ps
module factorial(
    	input clk, go,
    	input [3:0] n,
    	output error, done,
    	output [2:0] CS,
    	output [31:0] result
	);
	
	wire load_cnt, en, load_reg, sel1, sel2, rst, GT;
	
	DP dp_factorial  (
    	.n (n),
    	.clk (clk),
    	.error (error),
    	.GT (GT),
    	.load_cnt (load_cnt), .en (en),
    	.load_reg (load_reg), .sel1 (sel1), .sel2 (sel2),
    	.rst (rst), .result (result)
	);
	
	CU cu_factorial  (
    	.clk (clk),
    	.go (go),
    	.error (error),
    	.GT (GT),
    	.load_cnt (load_cnt),
    	.en (en),
    	.cnt_out (cnt_out),
    	.load_reg (load_reg),
    	.sel1 (sel1),
    	.sel2 (sel2),
    	.done (done),
    	.rst (rst),
    	.CS (CS)
	);
	
endmodule

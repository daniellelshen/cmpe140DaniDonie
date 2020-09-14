

 module DP (
	input [3:0] n,
	input clk, load_cnt, en, load_reg, sel1, sel2, rst,
	output [31:0] result,
	output error, GT

 );
 
 wire [31:0] mux_out;
 wire [31:0] mul_out;
 wire [31:0] reg_out;
 wire [3:0] cnt_out;
 
 
 // counter
 cnt ud_counter  (
    	.clk(clk),
    	.en(en),
    	.load(load_cnt),
    	.n(n),
    	.out(cnt_out)
 );
 
 // comparator_error
 comparator cmp_error (
 	.a(n),
 	.b(4'b1100), // pretty sure this is a wrong way to input
 	.ltf(error)
 );
 
 // comparator_GT
 comparator cmp_GT (
 	.a(cnt_out),
 	.b(4'b0001),
 	.ltf(GT)
 );
 
 // MUX1
 mux2 MUX1 (
 	.in0({31'b0, 1'b1}),  
 	.in1(mul_out),
 	.sel(sel1),
 	.out(mux_out)
 );
 
 // regfile
 Dreg#(8) Dreg (
 	.clk(clk),
 	.rst(rst),
 	.D(mux_out),
 	.Q(reg_out)
 );
 
 // MUL (may have to develop a multiplier? check lab9 cmpe 125)
 
 // MUX2
 mux2 MUX2 (
 	.in0({31'b0, 1'b1}),
 	.in1(reg_out),
 	.sel(sel2),
 	.out(result)
 );
 
    mul MUL (
    	.x(reg_out),
    	.y({28'b0, cnt_out}),
    	.z(mul_out)
	);

 
 endmodule
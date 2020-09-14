`timescale 1ns / 1ps


module CU(
input clk, go, error, GT,
    	input [3:0] cnt_out,
    	output reg load_cnt, en, load_reg,
    	output reg sel1, sel2, done, rst,  	
    	output reg [2:0] CS);
	
	parameter S0 = 3'b000,
          	S1 = 3'b001,
          	S2 = 3'b010,
          	S3 = 3'b011,
          	S4 = 3'b100;
          	
	reg [2:0] NS;
	
	initial
	begin
    	CS = S0;
    	NS = S0;
	end
	
	always @ (posedge clk)
	begin
    	CS <= NS;
	end
	
	always @ (CS, error, go, GT)
	begin
    	case (CS)
        	S0: NS = (go == 1'b1 && error == 1'b0) ? S1 : S0;
        	S1: NS = S2;
        	S2:
        	begin
            	if (error == 1'b1)
                	NS = S0;
            	else if (GT == 1'b0)
                	NS = S4;
            	else
                	NS = S3;
        	end
        	S3: NS = S2;
        	S4: NS = S0;
    	endcase
	end
	
	always @ (CS)
	begin
    	case (CS)
        	S0:
        	begin  
            	    	load_cnt <= 0;
            	    	en <= 0;
            	    	load_reg <= 0;
            	    	sel1 <= 0;
            	    	sel2 <= 0;
            	    	done <= 0;
            	    	rst <= 1;
        	end
        	S1:
        	    	begin
            	    	load_cnt <= 1;
            	    	en <= 1;
            	    	load_reg <= 1;
            	    	sel1 <= 0;
            	    	sel2 <= 0;
            	    	done <= 0;
            	    	rst <= 0;
        	end
        	S2:
        	begin
            	    	load_cnt <= 0;
            	    	en <= 0;
            	    	load_reg <= 0;
            	    	sel1 <= 1;
            	    	sel2 <= 0;
            	    	done <= 0;
            	    	rst <= 0;
        	end
        	S3:
        	    	begin
            	    	load_cnt <= 0;
            	    	en <= 1;
            	    	load_reg <= 1;
            	    	sel1 <= 1;
            	    	sel2 <= 0;
            	    	done <= 0;
            	    	rst <= 0;
        	end
        	S4:
        	begin
            	    	load_cnt <= 0;
            	    	en <= 0;
            	    	load_reg <= 0;
            	    	sel1 <= 0;
            	    	sel2 <= 1;
            	    	done <= 1;
            	    	rst <= 0;
        	end
        	default:
        	begin
            	    	load_cnt = 0;
            	    	en = 0;
            	    	load_reg = 0;
            	    	sel1 = 0;
            	    	sel2 = 0;
            	    	done = 0;
            	    	rst = 1;
        	end
   	endcase
	end
endmodule

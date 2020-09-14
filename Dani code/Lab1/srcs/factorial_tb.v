`timescale 1ns / 1ps
module factorial_tb();
	reg clk_tb, go_tb;
	reg [3:0] n_tb;
	
	wire error_tb, done_tb;
	wire [2:0] CS_tb;
	wire [31:0] result_tb;
	
	reg expected_error, expected_done;
	reg [31:0] expected_result;
	
	integer i, j, product;
	integer error_count = 0;
	
	factorial DUT(
    	.clk (clk_tb),
    	.go (go_tb),
    	.n (n_tb),
    	.error (error_tb),
    	.done (done_tb),
    	.CS (CS_tb),
    	.result (result_tb)
	);
	
	task sec;
	begin
    	clk_tb = 1'b0;#10;
    	clk_tb = 1'b1;#10;
	end
	endtask
	
	initial begin
    	go_tb = 0;
    	for(i = 13; i >= 0; i=i-1)
    	begin
        	//State0 - Idle
        	n_tb = i;
        	sec;
                   	
        	//State0 - Go
        	go_tb = 1;
        	sec;
        	
        	//State1-3
        	while(CS_tb != 3'b000 && CS_tb != 3'b100)
        	begin	
            	go_tb = 0;
            	sec;
        	end
                        	
        	//State4 or State0
        	if (i == 13)
        	begin
            	expected_error = 1;
            	expected_result = 1;
            	expected_done = 0;
        	end
        	else if (i == 0)
        	begin
            	expected_error = 0;
            	expected_result = 1;
            	expected_done = 1;
        	end
        	else
        	begin
            	expected_error = 0;
            	product = 1;
            	for (j = i; j > 1; j=j-1)
                	product = product * j;
            	expected_result = product;
            	expected_done = 1;
        	end
    	
        	//Check error count       	
        	if (expected_error != error_tb)
        	begin
            	$display("error does not match expected\n");
            	error_count = error_count+1;
        	end
        	
        	if (expected_result != result_tb)
        	begin
            	$display("result does not match expected\n");
            	error_count = error_count+1;
        	end
        	
        	if (expected_done != done_tb)
        	begin
            	$display("GT does not match expected\n");
            	error_count = error_count+1;
        	end
        	
        	sec;           	
    	end
	end
	
endmodule

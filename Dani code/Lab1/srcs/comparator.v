`timescale 1ns / 1ps

module comparator (
	input [3:0] a,
	input [3:0] b,
	output reg ltf
);

always @ (*) begin
	ltf = (a > b) ? 1 : 0;
end

endmodule
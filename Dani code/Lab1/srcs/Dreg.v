`timescale 1ns / 1ps

module Dreg #(parameter WIDTH = 32) (
	input clk, rst,
	input [WIDTH-1:0] D,
	output reg [WIDTH-1:0] Q);

always @ (posedge clk, posedge rst) begin
	if (rst) Q <= 0;
	else Q <= D;
end

endmodule
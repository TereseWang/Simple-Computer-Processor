`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:58:31 PM
// Design Name: 
// Module Name: mux_dm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_dm(
	input[8:0] ReadData,
	input[8:0] in,
	input memReg,
	input ovf,
	output reg[8:0] out);

	always @(memReg, ReadData, in, ovf) begin
		case(memReg)
			1'b0: begin
				out = ReadData;
			end

			1'b1: begin
				out = in;
				out[8] = ovf;
			end
		endcase
	end
endmodule

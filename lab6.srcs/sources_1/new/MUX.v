`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:38:21 PM
// Design Name: 
// Module Name: MUX
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

module MUX(input [8:0] ReadData,
		   input [7:0] in,
		   input ALUSrc,
		   output reg [7:0] out);

	always @ (ALUSrc, ReadData, in) begin
		case (ALUSrc)
			1'b0: begin
				out = ReadData[7:0];
			end

			1'b1: begin
				out = in;
			end
		endcase
		end
endmodule


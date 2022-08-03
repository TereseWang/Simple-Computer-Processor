`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:33:28 PM
// Design Name: 
// Module Name: alu_regfile
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


module alu_regfile(input rst,
				   input clk,
				   input [1:0] ReadAddr1,
				   input [1:0] ReadAddr2,
				   input [1:0] WriteAddr,
				   input [8:0] WriteData,
				   input RegWrite,
				   input [7:0] Instr_i,
				   input ALUSrc1,
				   input ALUSrc2,
				   input [2:0] ALUOp,
				   output [7:0] input1,
				   output [7:0] input2,
				   output [7:0] result,
				   output ovf,
				   output take_branch);

	wire [8:0] ReadData1;
	wire [8:0] ReadData2;

	reg_file regFile(.rst(rst),
					 .clk(clk),
					 .wr_en(RegWrite),
					 .wr_addr(WriteAddr),
					 .wr_data(WriteData),
					 .rd0_addr(ReadAddr1),
					 .rd1_addr(ReadAddr2),
					 .rd0_data(ReadData1),
					 .rd1_data(ReadData2));

	MUX mux1(ReadData1, 8'h00, ALUSrc1, input1);
	MUX mux2(ReadData2, Instr_i, ALUSrc2, input2);

	eightbit_alu alu(.s(ALUOp),
					 .a(input1),
					 .b(input2),
					 .f(result),
					 .ovf(ovf),
					 .take_branch(take_branch));
endmodule
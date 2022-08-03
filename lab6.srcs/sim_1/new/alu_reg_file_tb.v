`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:41:04 PM
// Design Name: 
// Module Name: alu_reg_file_tb
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


module alu_regfile_tb();
	reg rst;
	reg clk;
	reg wr_en;
	reg [1:0] wr_addr;
	reg [8:0] wr_data;
	reg [1:0] rd0_addr;
	reg [1:0] rd1_addr;
	reg [7:0] Instr_i;
	reg ALUSrc1;
	reg ALUSrc2;
	reg [2:0] ALUOp;
	wire [7:0] input1;
	wire [7:0] input2;
	wire [7:0] result;
	wire ovf;
	wire take_branch;

	alu_regfile UUT(.rst(rst),
					.clk(clk),
					.RegWrite(wr_en),
					.WriteAddr(wr_addr),
					.WriteData(wr_data),
					.ReadAddr1(rd0_addr),
					.ReadAddr2(rd1_addr),
					.Instr_i(Instr_i),
					.ALUSrc1(ALUSrc1),
					.ALUSrc2(ALUSrc2),
					.ALUOp(ALUOp),
					.input1(input1),
					.input2(input2),
					.result(result),
					.ovf(ovf),
					.take_branch(take_branch));

	initial begin
		rst = 0;
		clk = 0;
		wr_en = 1;
		wr_addr = 2'b00;
		wr_data = 8'hAB;
		rd0_addr = 2'b00;
		rd1_addr = 2'b00;
		#8;
		Instr_i = 8'h01;
		ALUSrc1 = 0;
		ALUSrc2 = 1;
		ALUOp = 3'b000; // AND
		wr_addr = 2'b01;
		wr_data = 8'h98;
		#12;
		Instr_i = 8'hA0;
		ALUOp = 3'b010; //
		#10;
		ALUSrc1 = 1;
		ALUOp = 3'b010; //
		#10;
		ALUSrc1 = 0;
		ALUSrc2 = 0;
		ALUOp = 3'b000; //
		wr_addr = 2'b010;
		wr_data = 8'h67;
		#10;
		rd0_addr = 2'b01;
		ALUOp = 3'b100;
		#10;
		rd0_addr = 2'b10;
		ALUOp = 3'b101;

		#10;
		wr_en = 0;
		rst = 1;
		#10;
		rst = 0;
		Instr_i = 8'h00;
		ALUOp = 3'b110;
		#10;
		ALUOp = 3'b111;
	end

	always begin
		#5 clk = ~clk;
	end
endmodule
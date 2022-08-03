`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 03:00:43 PM
// Design Name: 
// Module Name: inst_decoder_tb
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


module inst_decoder_tb();
	reg [15:0] instruction;
	wire RegWrite;
	wire RegDst;
	wire [7:0] instr_i;
	wire ALUSrc1;
	wire ALUSrc2;
	wire [2:0] ALUOp;
	wire MemWrite;
	wire [3:0] opcode;
	wire MemToReg;
	wire [1:0] rs_addr;
	wire [1:0] rt_addr;
	wire [1:0] rd_addr;

	inst_decoder uut(
		instruction, 
		RegWrite, 
		RegDst,
		instr_i,
		ALUSrc1,
		ALUSrc2,
		ALUOp,
		MemWrite,
		opcode,
		MemToReg,
		rs_addr,
		rt_addr,
		rd_addr
	);

	initial begin
		// load reg[2] <= mem[1+0x10]
		#10 instruction = 16'b0000_01_10_00_010000;

		// store mem[1+0x11] <= reg[2] 
		#10 instruction = 16'b0001_01_10_00_010001;

		// add reg[2] <= reg[0] + reg[1]
		#10 instruction = 16'b0010_00_01_10_000000;

		// addi reg[3] <= reg[0] + 0x40
		#10 instruction = 16'b0011_00_11_01_000000;

		// inv reg[2]  <= ~reg[1]
		#10 instruction = 16'b0100_00_01_10_000000;

		// and reg[2] <= reg[0] & reg[1]
		#10 instruction = 16'b0101_00_01_10_000000;
		
		// andi reg[3] <= reg[1] & 0xF0
		#10 instruction = 16'b0110_01_11_00_001111;

		// or reg[2] <= reg[0] | reg[1]
 	 	#10 instruction = 16'b0111_00_01_10_000000;

 	 	// ori reg[3] <= reg[1] | 0xF0
		#10 instruction = 16'b1000_01_11_11_110000;

		// sra reg[3] <= reg[1]
		#10 instruction = 16'b1001_01_11_11_110000;

		// sll reg[3] <= reg[1]
		#10 instruction = 16'b1010_01_11_00_000001;

		// beq pc+0x40 <= reg[0]
		#10 instruction = 16'b1011_00_10_01_000000;

		// bne pc-0xc0 <= reg[0]
		#10 instruction = 16'b1100_00_10_01_000000;

		// clr reg[3] <= 0
		#10 instruction = 16'b1101_00_11_00_000000;
	end	
endmodule

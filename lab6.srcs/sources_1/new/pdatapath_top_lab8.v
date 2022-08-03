`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Majid Sabbagh (sabbagh.m@husky.neu.edu)
// 
// Create Date: 08/17/2014 02:18:36 PM
// Design Name: 
// Module Name: eightbit_alu_top
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
module pdatapath_top(
		input wire clk,				// General clock input
		input wire top_pb_clk,		// PBN1 clock input
        input wire rst_general,		// PBN0 clock reset for memory blocks
		output [7:0] led,			// add-on board led[5:0], + LD0, LD1
		output wire ovf_ctrl,    	// LD3 for overflow
		output [3:0] disp_en,		// 7-Segment display enable
		output [6:0] seg7_output	// 7-segment display output
    );
	
	// ALU inteface
    wire [7:0] alu_input1, alu_input2;
    wire [7:0] alu_output;
    wire [2:0] ALUOp;
    wire       alu_ovf;
    wire       take_branch;
    
    wire [15:0] instruction;
    //insturction fields
    wire [3:0] opcode;
    wire [1:0] rs_addr;
    wire [1:0] rt_addr;
    wire [1:0] rd_addr;
    wire [7:0] immediate;
    //control signals
    wire RegDst;
    wire RegWrite;
    wire ALUSrc1;
    wire ALUSrc2;
    wire MemWrite;
    wire MemToReg;

    wire [1:0] regfile_WriteAddress;//destination register address
    wire [8:0] regfile_WriteData;//result data
    wire [8:0] regfile_ReadData1;//source register1 data
    wire [8:0] regfile_ReadData2;//source register2 data

    wire [8:0] alu_result;
    wire [8:0] Data_Mem_Out;
	wire [7:0] zero_register;
	
	// PC and debouce clock
	wire [7:0] pc;
	wire pb_clk_debounced;

	assign zero_register = 8'b0;	//ZERO constant
	assign alu_result = {alu_ovf, alu_output};
	
	// Assign LEDs
    assign led = alu_output;
	assign ovf_ctrl = alu_ovf;

	// Debounce circuit
    debounce debounce_clk(
        .clk_in(clk),
        .rst_in(rst_general),
        .sig_in(top_pb_clk),
        .sig_debounced_out(pb_clk_debounced)
    );
	
	// 7-Segment display module
	Adaptor_display display(
		.clk(clk), 					// system clock
		.input_value(alu_output),	// 8-bit input [7:0] value to display
		.disp_en(disp_en),			// output [3:0] 7 segment display enable
		.seg7_output(seg7_output)	// output [6:0] 7 segment signals
	);
	
    pc_logic pc_logic (
        pb_clk_debounced,
        rst_general,
        immediate,
        take_branch,
        pc
    );
	//Instantiate Your instruction Memory here
    	instr_mem instr_mem (
		.a(pc),
		.spo(instruction)
		);
    
	//Instantiate Your instruction decoder here
 	inst_decoder id(
		.instruction(instruction),
		.RegWrite(RegWrite),
		.RegDst(RegDst),
		.instr_i(immediate),
		.ALUSrc1(ALUSrc1),
		.ALUSrc2(ALUSrc2),
		.ALUOp(ALUOp),
		.MemWrite(MemWrite),
		.opcode(opcode),
		.MemToReg(MemToReg),
		.rs_addr(rs_addr),
		.rt_addr(rt_addr),
		.rd_addr(rd_addr));
		
	//Instantiate Your alu-regfile here
    	reg_file regFile(
        .clk(pb_clk_debounced),
        .rst(rst_general),
        .wr_en(RegWrite),
        .rd0_addr(rs_addr),
        .rd1_addr(rt_addr),
        .wr_addr(regfile_WriteAddress),
        .wr_data(regfile_WriteData),
        .rd0_data(regfile_ReadData1),
        .rd1_data(regfile_ReadData2));
        
 	//Instantiate Your data memory here
	    MUX mux1(
        .ReadData(regfile_ReadData1),
        .in(zero_register),
        .ALUSrc(ALUSrc1),
        .out(alu_input1)
        );

    MUX mux2(
        .ReadData(regfile_ReadData2),
        .in(immediate),
        .ALUSrc(ALUSrc2),
        .out(alu_input2)
        );
    
    eightbit_alu alu(
        .s(ALUOp),
        .a(alu_input1),
        .b(alu_input2),
        .f(alu_output),
        .ovf(alu_ovf),
        .take_branch(take_branch)
        );
        
	//Mux for regfile_writedata
	    data_memory data_memory(
           .a(alu_output),     // input wire [7 : 0] a     
           .d(regfile_ReadData2),     // input wire [8 : 0] d
           .clk(pb_clk_debounced),          // input wire clk
           .we(MemWrite),      // input wire we
           .spo(Data_Mem_Out)  // output wire [8 : 0] spo
    );
	
	//Mux for regfile_writedata
	mux_dm mux3(
        .ReadData(alu_result),
        .ovf(alu_ovf),
        .in(Data_Mem_Out),
        .memReg(MemtoReg),
        .out(regfile_WriteData)
        );
	
	//Mux for RegDST
    mux_rdst mux4(
        .rt(rt_addr),
        .rd(rd_addr),
        .RegDST(RegDst),
        .out(regfile_write_address)
        );
    
	//Instantiate Your VIO core here
		vio_0 vio(
		.clk(clk),
		.probe_in0(alu_output),
		.probe_in1(alu_ovf),
		.probe_in2(take_branch),
		.probe_in3(regfile_ReadData1),
		.probe_in4(regfile_ReadData2),
		.probe_in5(alu_input1),
		.probe_in6(alu_input2),
		.probe_in7(regfile_WriteData),
		.probe_in8(Data_Mem_Out),
		.probe_in9(opcode),
		.probe_in10(rs_addr),
		.probe_in11(rt_addr),
		.probe_in12(rd_addr),
		.probe_in13(immediate),
		.probe_in14(RegDst),
		.probe_in15(RegWrite),
		.probe_in16(ALUSrc1),
		.probe_in17(ALUSrc2),
		.probe_in18(ALUOp),
		.probe_in19(MemWrite),
		.probe_in20(MemToReg),
		.probe_in21(pc),
		.probe_in22(instruction)
		);
	
	
endmodule
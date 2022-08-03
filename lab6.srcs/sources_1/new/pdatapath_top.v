`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:56:16 PM
// Design Name: 
// Module Name: pdatapath_top
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
		input wire clk,
        input wire rst_general,
		output [7:0] led,		// add-on board led[5:0], + LD0, LD1
		output wire ovf_ctrl    // LD3		
    );

    wire [7:0] alu_input1, alu_input2, alu_input2_instr_src;
    wire [7:0] alu_output;
    wire [2:0] ALUOp;
    wire       alu_ovf;
    wire       take_branch;

    wire RegWrite;//Write enable
    //wire RegRead;//Read enable
    wire [1:0] regfile_ReadAddress1;	//source register1 address
    wire [1:0] regfile_ReadAddress2;	//source register2 address
    wire [1:0] regfile_WriteAddress;	//destination register address
    wire [8:0] regfile_WriteData;		//result data
    wire [8:0] regfile_ReadData1;		//source register1 data
    wire [8:0] regfile_ReadData2;		//source register2 data
    
    wire ALUSrc1, ALUSrc2;
	wire [8:0] alu_result;
    reg [7:0] zero_register = 0;		//ZERO constant
    
    wire MemtoReg;
    wire MemWrite;
    
    wire [8:0] Data_Mem_Out;
	assign alu_result = {alu_ovf, alu_output};
	
		// Assign LEDs
    assign led = alu_output;
	assign ovf_ctrl = alu_ovf;
	
    // Instantiate the reg-file, MUXes, ALU that you have created here
	reg_file reg_file(
	       .rst(rst_general),
	       .clk(clk),
	       .wr_en(RegWrite),
	       .rd0_addr(regfile_ReadAddress1),
           .rd1_addr(regfile_ReadAddress2),
           .wr_addr(regfile_WriteAddress),
           .wr_data(regfile_WriteData),
           .rd0_data(regfile_ReadData1),
           .rd1_data(regfile_ReadData2)
	);
	
//	two_to_one_mux mux1(.x(regfile_ReadData1[7:0]), .y(zero_register), .s(ALUSrc1), .out(alu_input1));
//	two_to_one_mux mux2(.x(regfile_ReadData2[7:0]), .y(alu_input2_instr_src), .s(ALUSrc2), .out(alu_input2));
	
	eightbit_alu alu_top(
        .a(alu_input1),
        .b(alu_input2),
        .s(ALUOp),
        .ovf(alu_ovf),
        .take_branch(take_branch),
        .f(alu_output)
        );
        
	assign alu_input1 = ALUSrc1 ? zero_register : regfile_ReadData1[7:0];
	assign alu_input2 = ALUSrc2 ? alu_input2_instr_src : regfile_ReadData2[7:0];
	assign regfile_WriteData = MemtoReg ? data_mem_out : {alu_ovf, alu_output};
	
    // Instantiate the data memory that you have created here
    data_memory data_memory(
           .a(alu_output),     // input wire [7 : 0] a     
           .d(regfile_ReadData2),     // input wire [8 : 0] d
           .clk(clk),          // input wire clk
           .we(MemWrite),      // input wire we
           .spo(data_mem_out)  // output wire [8 : 0] spo
    );
	/* Instantiate the VIO that you have created here, 
	make sure the number of probes and their width are correctly configured */
    vio_0 vio(
        .clk(clk),

        .probe_in0(regfile_WriteData),
        .probe_in1(regfile_ReadData1),
        .probe_in2(regfile_ReadData2),
        .probe_in3(alu_input1),
        .probe_in4(alu_input2),
        .probe_in5(take_branch),
        .probe_in6(alu_ovf),
        .probe_in7(alu_output),
        .probe_in8(Data_Mem_Out),

        .probe_out0(RegWrite),
        .probe_out1(alu_input2_instr_src),
        .probe_out2(ALUSrc1),
        .probe_out3(ALUSrc2),
        .probe_out4(ALUOp),
        .probe_out5(MemWrite),
        .probe_out6(MemtoReg),
        .probe_out7(regfile_ReadAddress1),
        .probe_out8(regfile_ReadAddress2),
        .probe_out9(regfile_WriteAddress)
        );
endmodule

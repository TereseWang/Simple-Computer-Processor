`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/07/2022 02:32:15 PM
// Design Name: 
// Module Name: pc
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

module pc_logic(input pb_clk_debounced, 
                input rst_general, 
                input [7:0] immediate,
                input take_branch,
                output reg [7:0] pc);
	always @(posedge pb_clk_debounced, posedge rst_general) begin
    		if (rst_general)
    			pc = 0;
    		else if (take_branch) 
    		    pc = pc + immediate;
    		else
    			pc = pc + 8'b00000001;
	end
endmodule
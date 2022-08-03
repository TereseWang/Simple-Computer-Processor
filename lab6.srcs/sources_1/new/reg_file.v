`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:35:46 PM
// Design Name: 
// Module Name: reg_file
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

module reg_file(
    input rst, input clk, 
    input wr_en, 
    input [1:0] rd0_addr, 
    input [1:0] rd1_addr, 
    input [1:0] wr_addr, 
    input [8:0] wr_data,
    output reg [8:0] rd0_data, 
    output reg [8:0] rd1_data);
    
    reg [8:0] registers [0:3];
    
    
    always @(posedge clk) begin
        if (rst) begin 
            registers[0] <= 0;
            registers[1] <= 0;
            registers[2] <= 0;
            registers[3] <= 0;
        end 
        if (wr_en) begin 
            registers[wr_addr] <= wr_data;
        end 
        
        rd0_data <= registers[rd0_addr];
        rd1_data <= registers[rd1_addr];
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 02:49:33 PM
// Design Name: 
// Module Name: mux_rdst
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


module mux_rdst(input[1:0] rt, input [1:0] rd, input RegDST, output reg [1:0] out);
    always @(rt, rd, RegDST) begin 
        case (RegDST)
            1'b0: begin
                out = rt;
            end 
            1'b1: begin 
                out = rd;
            end 
        endcase
     end 
endmodule

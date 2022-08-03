`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2022 01:30:55 PM
// Design Name: 
// Module Name: eightbit_alu
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


module eightbit_alu(
    input signed [7:0] a,
    input signed [7:0] b,
    input [2:0] s,
    output reg signed [7:0] f,
    output reg ovf,
    output reg take_branch
    );
    
    always @(a, b, s) begin
        case(s)
            3'b000: begin 
                f = a + b;
                ovf = (a[7] & b[7] & ~f[7]) | (~a[7] & ~b[7] & f[7]);
            end 
            3'b001: begin
                f = ~b;
                ovf = 1'b0;
            end
            3'b010: begin 
                f = a & b;
                ovf = 1'b0;
            end 
            3'b011: begin 
                f = a | b;
                ovf = 1'b0;
            end 
            3'b100: begin 
                f = a >>> 1;
                ovf = 1'b0;
            end 
            3'b101: begin 
                f = a << b;
                ovf = 1'b0;
            end
            3'b110: begin 
                if(a == b)
                    take_branch = 1'b1;
                else
                    take_branch = 1'b0;
                f = 8'b0;
                ovf = 1'b0;
            end 
            3'b111: begin 
                if(a == b)
                    take_branch = 1'b0;
                else
                    take_branch = 1'b1;
                f = 8'b0;
                ovf = 1'b0;
            end 
        endcase
        end
endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:27:46 PM
// Design Name: 
// Module Name: immediate
// Project Name: RISC V Simple Data-path Implementation
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


module immediate(
        input sysclk,
        input [31:0] instruction,
        output reg [31:0] immediate
    );
    
    wire [6:0] opcode = instruction[6:0];
    always @(*) begin    
        case (opcode)
            7'h03: immediate <= {{20{instruction[31]}}, instruction[31:20]}; // I-Type (LW)
            7'h13: immediate <= {{20{instruction[31]}}, instruction[31:20]}; // I-Type
            7'h23: immediate <= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; // S-Type
            7'h63: immediate <= {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0}; // SB-Type
            default: immediate <= 31'b0; // Non-Type
        endcase
    end    
endmodule
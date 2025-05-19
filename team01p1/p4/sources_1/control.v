`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:26:20 PM
// Design Name: 
// Module Name: control
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


module control(
        input [6:0] opcode,
        output reg branch,
        output reg mem_read,
        output reg mem_to_reg,
        output reg [1:0] alu_op,
        output reg mem_write,
        output reg alu_src,
        output reg reg_write
    );
    
    always @(*) begin
        case (opcode) 
            7'b0110011: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b00100010; // R-Format
            7'b0000011: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b11110000; // LW
            7'b0100011: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b10001000; // SW
            7'b1100011: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b00000101; // BEQ
            7'b0010011: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b10100010; // I-Format
            default: {alu_src, mem_to_reg, reg_write, mem_read, mem_write, branch, alu_op} = 8'b0;
        endcase
    end
endmodule
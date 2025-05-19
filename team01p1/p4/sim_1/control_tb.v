`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/16/2025 04:46:23 PM
// Design Name: 
// Module Name: control_tb
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


module control_tb;
    
    reg [6:0] opcode;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire [1:0] alu_op;
    wire mem_write;
    wire alu_src;
    wire reg_write;
    
    localparam ts = 5;
    control control_tb(opcode, branch, mem_read, mem_to_reg, alu_op, mem_write, alu_src, reg_write);
    
    initial begin
        
        opcode = 7'b0110011; // R-Type
        #ts;
        
        opcode = 7'b0000011; // lw
        #ts;
        
        opcode = 7'b0100011; // S-Type
        #ts;
        
        opcode = 7'b1100011; // SB-Type
        #ts;
        
        opcode = 7'b0010011; // I-Type
        #ts;
        
        opcode = 7'b1111111; // default
        #ts;
    
        $finish();
    end

endmodule
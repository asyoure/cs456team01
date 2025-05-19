`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:28:25 PM
// Design Name: 
// Module Name: riscV_top
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


module riscV_top(
        input sysclk,
        input [0:0] BUTTONS,
        input [1:0] SWITCHES,
        output [5:0] LEDS
    );
    
    // IDK WHAT TO DO WITH SWITCHES[1]
    
    // PC Output
    wire [31:0] pc;
    
    wire reset = BUTTONS[0];
    
    
    // Control Output
    wire ctrl_branch;
    wire ctrl_mem_read;
    wire ctrl_mem_to_reg;
    wire [1:0] ctrl_alu_op;
    wire ctrl_mem_write;
    wire ctrl_alu_src;
    wire ctrl_reg_write;
    
    // Reg File Output
    wire [4:0] rs1 = instruction[19:15];
    wire [4:0] rs2 = instruction[24:20];
    wire [4:0] rd = instruction[11:7];
    
    wire [31:0] reg_read_one;
    wire [31:0] reg_read_two;
    
    // ALU Ctrl Output
    wire [3:0] alu_ctrl_out;
    
    // ALU Output
    wire alu_zero;
    wire [31:0] alu_result;
    
    // I-Mem Output
    wire [31:0] instruction;
    
    // D-Mem Output
    wire [31:0] write_data;
    
    // Imm Gen Output
    wire [31:0] imm;
        
    // PC
    pc_compute program_counter_update(sysclk, imm, reset, SWITCHES[0], ctrl_branch, alu_zero, pc);
    
    // I-Mem
    instr_mem instruction_memory(sysclk, pc[7:0], instruction);
    
    // Control
    control control_block(instruction[6:0], ctrl_branch, ctrl_mem_read, ctrl_mem_to_reg, ctrl_alu_op, ctrl_mem_write, ctrl_alu_src, ctrl_reg_write);
    
    // Reg File
    reg_file register_file(sysclk, rs1, rs2, rd, write_data, ctrl_reg_write, reg_read_one, reg_read_two);
    
    // Immediate
    immediate imm_gen(sysclk, instruction, imm);
    
    // ALU Control
    aluVcntrl alu_control(.ALUOp(ctrl_alu_op), .func({instruction[30], instruction[14:12]}), .ALUCtrl(alu_ctrl_out));
    
    // ALU
    aluV_32 ALU(reg_read_one, reg_read_two, imm, ctrl_alu_src, alu_ctrl_out, alu_zero, alu_result);
    
    // D-Mem
    data_mem data_memory(sysclk, alu_result, SWITCHES[1], reg_read_two, ctrl_mem_write, ctrl_mem_read, ctrl_mem_to_reg, write_data);
    
    assign LEDS[5:0] = write_data[5:0];
    
    
endmodule
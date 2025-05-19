`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:26:53 PM
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
        input sysclk,
        input [7:0] curr_pc,
        output reg [31:0] instruction
    );
    
    always @(*) begin 
        case (curr_pc)

            // Program 1
            8'h00: instruction <= 32'h02a00293; // addi t0, zero, 42
            8'h04: instruction <= 32'h02100313; // addi t1, zero, 33
            8'h08: instruction <= 32'h006283b3; // add t2, t0, t1
            8'h0c: instruction <= 32'h00000063; // beq zero zero end

            // Program 2
            8'h40: instruction <= 32'h00000533; // add a0, zero, zero
            8'h44: instruction <= 32'h00052283; // lw t0, 0(a0)
            8'h48: instruction <= 32'h00452303; // lw t1, 4(a0)
            8'h4c: instruction <= 32'h005303b3; // add t2, t1, t0
            8'h50: instruction <= 32'h0f03fe13; // andi t3, t2, 0xF0
            8'h54: instruction <= 32'h0f036e93; // ori t4, t1, 0x0F0
            8'h58: instruction <= 32'h01c38463; // beq t2, t3, end
            8'h5c: instruction <= 32'h005e8eb3; // add t4, t4, t0
            8'h60: instruction <= 32'h01d52423; // end: sw t4, 8(a0)
            8'h64: instruction <= 32'h00852e83; // show: lw t4, 8(a0)
            8'h68: instruction <= 32'hfe000ee3; // beq zero zero show (-4)
            
            default: instruction <= 32'h00000000;
        
        endcase
    end
endmodule
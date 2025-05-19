`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/15/2025 01:47:57 PM
// Design Name: 
// Module Name: instr_mem_tb
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


module instr_mem_tb;

    reg sysclk;
    reg [7:0] curr_pc;
    wire [31:0] instruction;
    
    localparam ts = 5;
    instr_mem instr_mem_tb(sysclk, curr_pc, instruction);
    
    initial begin
        
        curr_pc = 0;
        sysclk = 1;
        #ts;
        
        curr_pc = 8'h4;
        #ts;
    
        curr_pc = 8'h40;
        #ts;
    
        $finish();
    end

endmodule
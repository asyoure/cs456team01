`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/15/2025 01:36:10 PM
// Design Name: 
// Module Name: pc_compute_tb
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


module pc_compute_tb;

    reg sysclk;
    reg [31:0] immediate;
    reg reset;
    reg s0;
    reg branch;
    reg alu_zero;
    wire [31:0] pc;
    
    localparam ts = 5;
    pc_compute pc_compute_tb(sysclk, immediate, reset, s0, branch, alu_zero, pc);
    
    initial begin

        sysclk = 0;
        immediate = 32'h10;
        branch = 0;
        alu_zero = 0;
        reset = 1;
        s0 = 0;
        #ts;   
        sysclk = 1;
        #ts;
        
        sysclk = 0;
        reset = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        sysclk = 0;
        branch = 1;
        alu_zero = 1;
        #ts;
        sysclk = 1;
        #ts;
        
        sysclk = 0;
        immediate = 32'h20;
        #ts;
        sysclk = 1;
        #ts;
        
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        $finish();
    
    end

endmodule
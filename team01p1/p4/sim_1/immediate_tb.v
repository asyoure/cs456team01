`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/16/2025 05:24:40 PM
// Design Name: 
// Module Name: immediate_tb
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


module immediate_tb;

    reg sysclk;
    reg [31:0] instruction;
    wire [31:0] immediate;
    
    localparam ts = 5;
    immediate immediate_tb(sysclk, instruction, immediate);
    
    initial begin
    
        sysclk = 1;
        instruction = 32'h02a00293; // 42
        #ts;
        
        sysclk = 0; #ts; sysclk = 1;
        
        instruction = 32'h00052283; // 0
        #ts;
        
        sysclk = 0; #ts; sysclk = 1;
        
        instruction = 32'h01c38463; // 8
        #ts;
        
        sysclk = 0; #ts; sysclk = 1;
        
        instruction = 32'h006283b3; // 0
        #ts;
    
        $finish();
    end

endmodule
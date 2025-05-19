`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2025 12:34:38 PM
// Design Name: 
// Module Name: data_mem_tb
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


module data_mem_tb;

    reg sysclk;
    reg [31:0] alu_result;
    reg s1;
    reg [31:0] write_data;
    reg mem_write;
    reg mem_read;
    reg mem_to_reg;
    wire [31:0] data_out;
    
    localparam ts = 5;
    data_mem data_mem_tb(sysclk, alu_result, s1, write_data, mem_write, mem_read, mem_to_reg, data_out);
    
    initial begin
    
        sysclk = 1;
        alu_result = 32'h0;
        s1 = 1'b0;
        write_data = 32'h5;
        mem_write = 0;
        mem_read = 1;
        mem_to_reg = 1;
        #ts;
        
        sysclk = 0;
        mem_write = 1;
        #ts;
        
        sysclk = 1; #ts; sysclk = 0;
        write_data = 32'h6;
        mem_read = 0;
        alu_result = 32'h1;
        #ts;
        
        sysclk = 1;
        mem_read = 1;
        mem_write = 0;
        #ts;
        
        
        $finish();
    end

endmodule
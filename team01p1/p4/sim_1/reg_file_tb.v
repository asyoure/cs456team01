`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/16/2025 05:08:39 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb;

    reg sysclk;
    reg [4:0] reg_one;
    reg [4:0] reg_two;
    reg [4:0] write_reg;
    reg [31:0] write_data;
    reg reg_write;
    wire [31:0] read_data_one;
    wire [31:0] read_data_two;
    
    localparam ts = 5;
    reg_file reg_file_tb(sysclk, reg_one, reg_two, write_reg, write_data, reg_write, read_data_one, read_data_two);
    
    initial begin
    
        sysclk = 1'h1;
        reg_one = 5'h1;
        reg_two = 5'h2;
        write_reg = 5'h3;
        write_data = 32'h00000001;
        
        reg_write = 1;
        #ts;
        
        sysclk = 0; #ts; sysclk = 1; // Posedge
        
        write_data = 32'h01234567;
        write_reg = 5'h1;
        #ts;
        
        sysclk = 0; #ts; sysclk = 1; // Posedge
        
        write_data = 32'hffffffff;
        write_reg = 5'h2;
        #ts;
        
        sysclk = 0; #ts; sysclk = 1; // Posedge
        
        reg_one = 5'h3;
        reg_write = 0;
        #ts;
        
        $finish();
    end

endmodule
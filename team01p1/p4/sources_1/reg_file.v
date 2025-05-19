`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:27:58 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
        input sysclk,
        input [4:0] reg_one,
        input [4:0] reg_two, 
        input [4:0] write_reg,
        input [31:0] write_data,
        input reg_write,
        output reg [31:0] read_data_one,
        output reg [31:0] read_data_two
    );
    
    reg [31:0] regs [31:0];
    integer i;
    initial begin
        for (i = 0; i < 32; i = i + 1) begin
            regs[i] = 32'h0;
        end
    end
    
    always @(posedge sysclk) begin
    
        // Write Back
        if (reg_write) begin
            regs[write_reg] <= write_data;
        end
        
    end
    
    always @(*) begin
        // Execute
        read_data_one <= regs[reg_one];
        read_data_two <= regs[reg_two];
    end
endmodule
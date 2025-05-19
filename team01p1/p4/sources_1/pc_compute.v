`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:27:30 PM
// Design Name: 
// Module Name: pc_compute
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


module pc_compute(
        input sysclk,
        input [31:0] immediate,
        input reset,
        input s0,
        input ctrl_branch,
        input alu_zero,
        output reg [31:0] pc
    );
    
    reg [7:0] pc = 32'h0;
    
    reg [7:0] standard_new_pc;
    reg [7:0] branch_new_pc;
    
    always @(posedge sysclk) begin
        standard_new_pc = pc + 4;
        branch_new_pc = pc + immediate;
    
        if (reset) begin
            pc <= s0 ? 32'h40 : 32'h00;
        end else begin            
            pc <= (ctrl_branch && alu_zero) ? branch_new_pc : standard_new_pc;
        end
    end
    
endmodule
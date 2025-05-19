`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel & James Agresto
// 
// Create Date: 03/26/2025 02:57:50 PM
// Design Name: 
// Module Name: aluV_32
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


module aluV_32(
        input [31:0] reg_one,
        input [31:0] reg_two,
        input [31:0] imm,
        input alu_src,
        input [3:0] ALUCtl,
        output reg zero,
        output reg [31:0] result
    );
    
    wire [31:0] A = reg_one;
    wire [31:0] B = alu_src ? imm : reg_two;
    
    // Needed for correct overflow output
    wire [32:0] add = A + B;
    wire [32:0] sub = {1'b0, A} + {1'b0, ~B} + 1'b1;

    always @(*) begin
        zero = 0;
        
        case (ALUCtl) 
            // Bitwise Logic
            4'b0000: result <= A & B; // AND
            4'b0001: result <= A | B; // OR
        
            // Arithmetic
            4'b0010: begin // ADD
                result <= add;
                
           end
            
            4'b0110: begin // SUBTRACTION
                result <= sub[31:0];
            end
            
            default: result <= 32'b0;
            
        endcase
        
        zero = (result == 0);
    
   end 

endmodule
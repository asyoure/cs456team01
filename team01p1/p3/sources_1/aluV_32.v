`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel & James Agresto
// 
// Create Date: 03/26/2025 02:57:50 PM
// Design Name: 
// Module Name: aluV_32
// Project Name: RISC V ALU
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
        input signed [31:0] A,
        input signed [31:0] B,
        input [3:0] ALUCtl,
        output reg zero,
        output reg signed [31:0] result,
        output reg overflow,
        output reg cout
    );
    
    // Needed for correct overflow output
    wire signed [32:0] add = A + B;
    wire signed [32:0] sub = {1'b0, A} + {1'b0, ~B} + 1'b1;

    always @(*) begin
        overflow = 0;
        cout = 0;
        zero = 0;
        
        case (ALUCtl) 
            // Bitwise Logic
            4'b0000: result = A & B; // AND
            4'b0001: result = A | B; // OR
        
            // Arithmetic
            4'b0010: begin // ADD
                {cout, result} = add;
                overflow = (~A[31] & ~B[31] & result[31]) | (A[31] & B[31] & ~result[31]);
            end
            
            4'b0110: begin // SUBTRACTION
                result = sub[31:0];
                cout = sub[32];
                overflow = ((A[31] & ~B[31] & ~result[31]) | (~A[31] & B[31] & result[31]));
            end
            default: 
                result = 32'b0;
                cout = 0;
                overflow = 0
        endcase
        
        zero = (result == 0);
    
   end 

endmodule
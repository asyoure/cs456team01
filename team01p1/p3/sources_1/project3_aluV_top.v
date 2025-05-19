`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel & James Agresto
// 
// Create Date: 03/26/2025 02:59:38 PM
// Design Name: 
// Module Name: project3_aluV_top
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


module project3_aluV_top(
        input [1:0] ALUOp,
        input [9:0] FuncCode, // {func3, func7}
        input [31:0] A, 
        input [31:0] B, 
        output zero,
        output [31:0] result,
        output overflow,
        output cout
    );
    
    wire [3:0] ALUCtl;
    
    aluVcntrl ALU_Control(ALUOp, FuncCode, ALUCtl);
    
    aluV_32 ALU(A, B, ALUCtl, zero, result, overflow, cout);
    
endmodule
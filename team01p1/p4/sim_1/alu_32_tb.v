`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/16/2025 06:05:47 PM
// Design Name: 
// Module Name: alu_32_tb
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


module alu_32_tb;

    reg [31:0] A;
    reg [31:0] B;
    reg [31:0] imm;
    reg alu_src;
    reg [3:0] ALUCtl;
    wire zero;
    wire [31:0] result;
    
    localparam ts = 5;
    aluV_32 alu_32_tb(A, B, imm, alu_src, ALUCtl, zero, result);
    
    initial begin
        
        A = 32'h6;
        B = 32'h5;
        imm = 32'h7;
        alu_src = 1'b0;
        ALUCtl = 4'b0000;
        #ts;
        
        ALUCtl = 4'b0001;
        #ts;
        
        ALUCtl = 4'b0010;
        #ts;
        
        ALUCtl = 4'b0110;
        #ts;
        
        ALUCtl = 4'b1111;
        #ts;
        
        // Test Immadiate
        alu_src = 1'b1;
        ALUCtl = 4'b0000;
        #ts;
        
        ALUCtl = 4'b0001;
        #ts;
        
        ALUCtl = 4'b0010;
        #ts;
        
        ALUCtl = 4'b0110;
        #ts;
        
        ALUCtl = 4'b1111;
        #ts;
        
        $finish();
    end

endmodule
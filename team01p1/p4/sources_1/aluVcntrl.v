`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel & James Agresto
// 
// Create Date: 03/26/2025 02:57:50 PM
// Design Name: 
// Module Name: aluVcntrl
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


module aluVcntrl(
    input [1:0] ALUOp,
    input [3:0] func, // {random_freakin_bit, func3}
    output reg [3:0] ALUCtrl
    );

    // localparams for legibility
    localparam AND = 4'b0000;
    localparam OR  = 4'b0001;
    localparam ADD = 4'b0010;
    localparam SUB = 4'b0110;
    localparam NIL = 4'b1111; // Default Case: Code Not Found

    always @(*) begin
        
        // spec says it should be based on ALUOp and func
        case ({ALUOp, func})
        
            // ALUOp = 10; func3 = 000; func7 = 0000000     
            12'b100000: ALUCtrl <= ADD;
            // ALUOp = 10; func3 = 000; func7 = 0100000    
            12'b101000: ALUCtrl = SUB;
            // ALUOp = 10; func3 = 110; func7 = 0000000    
            12'b100110: ALUCtrl = OR;
            // ALUOp = 10; func3 = 111; func7 = 0000000    
            12'b100111: ALUCtrl = AND;
            // ALUOp = 00; func3 = 010; func7 = 0000000
            12'b000010: ALUCtrl = ADD; // LW | SW
            // ALUOp = 01; func3 = 000; func7 = 0000001
            12'b010000: ALUCtrl = SUB; // BEQ
            default: ALUCtrl = NIL;
            
        endcase
        
    end
endmodule
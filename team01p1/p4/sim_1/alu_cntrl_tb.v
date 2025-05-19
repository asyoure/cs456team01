`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/16/2025 05:49:30 PM
// Design Name: 
// Module Name: alu_cntrl_tb
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


module alu_cntrl_tb;

    reg [1:0] ALUOp;
    reg [3:0] func; // {rando_bit, func3}
    wire [3:0] ALUCtrl;
    
    localparam ts = 5;
    aluVcntrl alu_cntrl_tb(ALUOp, func, ALUCtrl);
    
    initial begin
    
        ALUOp = 2'b10;
        func = 4'b0000;
        #ts; // ADD
        
        func = 4'b1000;
        #ts; // SUB
        
        func = 4'b0110;
        #ts; // OR
        
        func = 4'b0111;
        #ts; // AND
        
        ALUOp = 2'b00;
        func = 4'b0010;
        #ts; // LW | SW
        
        ALUOp = 2'b01;
        func = 4'b0000;
        #ts; // BEQ
        
        ALUOp = 2'b11;
        func = 4'b0101;
        #ts; // NIL
        
        $finish();
    end

endmodule
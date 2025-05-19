`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:04:47 PM
// Design Name: 
// Module Name: aluV_32_testbench
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


module aluV_32_testbench;
    
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUCtl;
    
    wire zero;
    wire [31:0] result;
    wire overflow;
    wire cout;
    
    localparam time_step = 5;
    integer i;
    
    aluV_32 aluV_32_tb(A, B, ALUCtl, zero, result, overflow, cout);
    
    initial begin
        
        A = 8'd100;
        B = 8'd40;
        
        for (i = 0; i < 5'd16; i = i + 1) begin
            ALUCtl = i;
            #time_step;
        end
        
        A = 32'hfffffffe;
        B = 32'hffffffff;
        
        for (i = 0; i < 5'd16; i = i + 1) begin
            ALUCtl = i;
            #time_step;
        end
    
        $finish();
    end

endmodule
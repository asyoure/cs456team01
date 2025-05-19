`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 03/03/2025 11:55:47 AM
// Design Name: 
// Module Name: reg_tb
// Project Name: Small Program Counter
// Target Devices: PYNQ-Z1
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


module reg_tb;

    reg ld_tb;
    reg clk_tb;
    reg [5:0] L_Value_tb;
    wire [5:0] out_tb;
    
    localparam time_step = 5;
    integer i;
    
    reg_6bit reg_tb(clk_tb, ld_tb, L_Value_tb, out_tb);
    
    initial begin
        
        L_Value_tb = 4;
    
        for (i = 0; i < 4; i = i + 1) begin
            {ld_tb, clk_tb} = i;
            #time_step;
        end
        
        $finish(); 
    end

endmodule
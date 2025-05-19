`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 03/03/2025 11:54:17 AM
// Design Name: 
// Module Name: reg_6bit
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


module reg_6bit(
    input clk,
    input ld,
    input [5:0] Lvalue,
    output reg [5:0] out
);
    always @(posedge clk) begin
        if (ld) begin
            out <= Lvalue;
        end
    end
endmodule
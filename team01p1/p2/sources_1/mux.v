`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel, James Agresto
// 
// Create Date: 03/01/2025 01:27:25 PM
// Design Name: 
// Module Name: mux
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
// This should implement a si-bit full adder with two input busses, d0[5:0], d1[5:0], and another input s along with an output bus, out[5:0].
// When s is 0, out[5:0] should equal d0[5:0], when s is 1, out[5:0] should equal d1[5:0].
//////////////////////////////////////////////////////////////////////////////////


module mux(
    input [5:0] d0,     // 6-bit input bus
    input [5:0] d1,     // 6-bit input bus
    input s,            // selector bit
    output [5:0] out    // 6-bit output
);   
    assign out = s ? d1 : d0;   // ternary operator to simplify the logic
endmodule
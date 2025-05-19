`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:24:19 AM
// Design Name: 
// Module Name: mux4_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// This work complies with the JMU Honor Code.
//////////////////////////////////////////////////////////////////////////////////


module mux4_1(
        input d0,   // d0 input
        input d1,   // d1 input
        input d2,   // d2 input
        input d3,   // d3 input
        input s0,   // s0 selector bit
        input s1,   // s1 selector bit
        output out  // output
    );
    
    wire out0;
    wire out1;
    
    // 4-1 multiplexor requires 3 2-1 multiplexors
    mux2_1 m2_1_0(d0, d1, s0, out0);    // 2-1 multiplexor
    mux2_1 m2_1_1(d2, d3, s0, out1);    // 2-1 multiplexor
    
    mux2_1 m2_1_2(out0, out1, s1, out); // 2-1 multiplexor
    
endmodule

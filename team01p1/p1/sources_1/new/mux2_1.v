`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:24:19 AM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1(
        input d0,   // d0 input
        input d1,   // d1 input
        input s,    // selector bit
        output out  // output
    );
    
    wire i0;    // zybooks namesake
    wire i1;    // zybooks namesake
    wire not_s; // negation of selector bit
    
    not(not_s, s);  // negate the selector bit
    and(i0, d0, not_s); // d0 & !s
    and(i1, d1, s); // d1 & s
    
    or(out, i0, i1); // i0 | i1
    
endmodule

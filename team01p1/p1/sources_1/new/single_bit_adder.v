`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:24:19 AM
// Design Name: 
// Module Name: 1bit_adder
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

module single_bit_adder(
    input c_in, // carry-in
    input a,    // input a
    input b,    // input b
    output sum, // sum
    output c_out    // carry-out
);

    wire ab_xor; 
    wire ab_and_c_in;
    wire a_and_b;
    
    xor(ab_xor, a, b); // a ^ b
    xor(sum, ab_xor, c_in); // ab_xor ^ c_in
    
    and(ab_and_c_in, ab_xor, c_in); // ab_xor & c_in
    and(a_and_b, a, b); // a & b
    
    or(c_out, a_and_b, ab_and_c_in);    // a_and_b | ab_and_c_in
endmodule
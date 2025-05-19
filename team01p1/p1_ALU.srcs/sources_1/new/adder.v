`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:24:19 AM
// Design Name: 
// Module Name: adder
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

// 2-bit adder using two 1-bit adders
module adder(
    input c_in, // carry-in
    input a0,   // a0 bit pair
    input a1,   // a1 bit pair
    input b0,   // b0 bit pair
    input b1,   // b1 bit pair
    output s0,  // s0 selector bit
    output s1,  // s1 selector bit
    output c_out // carry-out
);
    // initial carry-in
    wire cout_in;
    
    single_bit_adder sbadd0(c_in, a0, b0, s0, cout_in);     // 1-bit adder
    single_bit_adder sbadd1(cout_in, a1, b1, s1, c_out);    // 1-bit adder
   
endmodule

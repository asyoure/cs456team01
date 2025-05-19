`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel, James Agresto
// 
// Create Date: 03/01/2025 01:27:25 PM
// Design Name: 
// Module Name: adder
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
// this should implement a six-bit full adder with two input busses a[5:0], b[5:0], and a single output, sum. Note
// that the carry in for bit zero will be hardwired to ground and the final carry out will not be used so is not shown. Internal carries must
// be used to perform correct addition, but the overflow or underflow will go undetected
//////////////////////////////////////////////////////////////////////////////////


module adder(
    input [5:0] a,
    input [5:0] b,      // instantiate the 6 bit inputs and outputs
    output [5:0] sum
);
    assign sum = a + b; // sum = a + b
endmodule
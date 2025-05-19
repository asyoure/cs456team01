`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel, James Agresto
// 
// Create Date: 03/01/2025 03:02:16 PM
// Design Name: 
// Module Name: adder_tb
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


module adder_tb;
    reg [5:0] a, b; // inputs
    wire [5:0] sum; // sum

    localparam time_step = 5;   // time can be subject to change; gonna have to cyle through 64 values
    integer i;                  // loop int
    adder adder_tb(a, b, sum);
    
    // Loop
    initial begin
        for ( i = 0; i < 64; i = i + 1) begin
                a = i;
                b = i;
                #time_step;
        end
        $finish(); 
    end
endmodule
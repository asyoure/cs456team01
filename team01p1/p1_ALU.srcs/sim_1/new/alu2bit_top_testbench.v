`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 01:41:29 PM
// Design Name: 
// Module Name: alu2bit_top_testbench
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
// James looked up how to write the loops for the test bench files
//////////////////////////////////////////////////////////////////////////////////


module alu2bit_top_testbench;

    // creating registers and wires for the testbench
    reg a0;
    reg a1;
    reg b0;
    reg b1;
    reg x;
    reg w;
    wire s0;
    wire s1;
    
    // time step for the loop
    localparam time_step = 5;
    integer i = 0;
    
    // alu for testbench
    alu2bit_top alu2bit_top_tb(a0, a1, b0, b1, x, w, s0, s1);
    
    // loop for testing
    initial begin
    
        for (i = 0; i < 64; i=i+1) begin
            
            {x, w, a0, a1, b0, b1} = i;
            #time_step;
            
        end
        
        $finish();
    
    end

endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel, James Agresto
// 
// Create Date: 02/13/2025 12:35:32 PM
// Design Name: 
// Module Name: adder_testbench
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


module adder_testbench;

    // set up instantiating registers and wires
    reg a0;
    reg a1;
    reg b0;
    reg b1;
    reg c_in;
    wire s0;
    wire s1;
    wire c_out;
    
    // time step for the loop and setting bits to all 0's
    localparam time_step = 5;
    integer i = 0;
    
    // adder call
    adder adder_tb(c_in, a0, a1, b0, b1, s0, s1, c_out);
    
    // Loop that sets all the inputs from 0 to 1
    initial begin
    
        for (i = 0; i < 32; i = i + 1) begin
        
            {c_in, a1, a0, b1, b0} = i;
            #time_step;
        
        end
        
        $finish();
        
    end

endmodule

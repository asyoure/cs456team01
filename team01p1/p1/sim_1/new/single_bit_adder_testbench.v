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


module single_bit_adder_testbench;

    // setting up the registers and wires for the testbench
    reg a;
    reg b;
    reg c_in;
    wire sum;
    wire c_out;
    
    // time step for the loop
    localparam time_step = 5;
    integer i = 0;
    
    // single bit adder to test
    single_bit_adder single_bit_adder_tb(c_in, a, b, sum, c_out);
    

    // loop that sets all the values different variations of 0 and 1
    initial begin
       
        for (i = 0; i < 8; i = i + 1) begin
        
            {c_in, a, b} = i;
            #time_step;
        
        end
        
        $finish();
        
    end

endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:39:08 AM
// Design Name: 
// Module Name: mux2_1_testbench
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


module mux2_1_testbench;

    // creating registers and wires for the testbench
    reg d0;
    reg d1;
    reg s;
    wire out;
    
    // time step param
    localparam time_step = 5;
    
    mux2_1 mux2_1_testbench(d0, d1, s, out);
    
    // setting all the bits from 0-1
    initial
        begin
            d0 = 0;
            d1 = 0;
            s = 0;
            #time_step
            
            d0 = 0;
            d1 = 0;
            s = 1;
            #time_step
            
            d0 = 0;
            d1 = 1;
            s = 0;
            #time_step
            
            d0 = 0;
            d1 = 1;
            s = 1;
            #time_step
            
            d0 = 1;
            d1 = 0;
            s = 0;
            #time_step
            
            d0 = 1;
            d1 = 0;
            s = 1;
            #time_step
            
            d0 = 1;
            d1 = 1;
            s = 0;
            #time_step
            
            d0 = 1;
            d1 = 1;
            s = 1;
            #time_step
            
            $finish();
            
        end

endmodule

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 11:08:39 AM
// Design Name: 
// Module Name: mux4_1_testbench
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


module mux4_1_testbench;

    // creating registers and wires for the testbench
    reg[3:0] d;
    reg[1:0] s;
    wire out;

    // time step   
    integer i;
    localparam time_step = 5;
    
    // mux instantiation
    mux4_1 mux4_1_tb(d[0], d[1], d[2], d[3], s[0], s[1], out);
    
    // loop that changes all the values from 0 to 1
    initial begin
        for (i = 0; i < 64; i=i+1) begin
           
           {d, s} = i;
           #time_step;
            
        end        
        
        $finish();
        
    end

endmodule

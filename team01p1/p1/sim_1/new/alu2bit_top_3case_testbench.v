`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 02/18/2025 04:24:40 PM
// Design Name: 
// Module Name: alu2bit_top_3case_testbench
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
// 
//////////////////////////////////////////////////////////////////////////////////


module alu2bit_top_3case_testbench;

    reg [3:0] BUTTONS;
    reg [1:0] SWITCHES;
    wire [1:0] LEDS;
    
    localparam time_step = 5;
    integer i = 0;
    
    alu2bit_top alu2bit_top_tb(
                        BUTTONS,
                        SWITCHES,
                        LEDS
                        );
    
    initial begin
    
        {BUTTONS} = 13; // 1101
        {SWITCHES} = 2; // 10
        #time_step;
        
        {BUTTONS} = 3; // 0011
        {SWITCHES} = 0; // 00
        #time_step;
        
        {BUTTONS} = 7; // 0111
        {SWITCHES} = 3; // 11
        #time_step;
        
        $finish();
    
    end

endmodule

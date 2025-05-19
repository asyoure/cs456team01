`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/17/2025 09:05:49 PM
// Design Name: 
// Module Name: riscV_top_tb
// Project Name: RISC V Simple Data-path Implementation
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


module riscV_top_tb;

    reg         sysclk;
    reg  [0:0]  BUTTONS;
    reg  [1:0]  SWITCHES;
    wire [5:0]  LEDS;

    riscV_top riscV_top_tb (
        .sysclk   (sysclk),
        .BUTTONS  (BUTTONS),
        .SWITCHES (SWITCHES),
        .LEDS     (LEDS)
    );

    localparam ts = 5;

    initial begin

        // Inst 1.1
        sysclk = 0;
        BUTTONS = 1'b1;
        SWITCHES = 2'b00;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 1.2
        BUTTONS = 1'b0;
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
         
        // Inst 1.3
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 1.4
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        
        // Inst 2.1
        sysclk = 0;
        BUTTONS = 1'b1;
        SWITCHES = 2'b01;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.2
        BUTTONS = 1'b0;
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
         
        // Inst 2.3
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.4
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.5
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.6
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.7
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.8
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.9
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.10
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts;
        
        // Inst 2.11
        sysclk = 0;
        #ts;
        sysclk = 1;
        #ts

        $finish();
    end

endmodule
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 03/03/2025 12:07:42 PM
// Design Name: 
// Module Name: pc_top
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


module pc_top(
        input sysclk,
        input [3:0] BUTTONS,
        input [1:0] SWITCHES,
        output reg [5:0] LEDS
    );
    
    assign in_bit = BUTTONS[3];
    assign ld = SWITCHES[0];
    assign cnt = BUTTONS[2];
    assign add_mux_s = SWITCHES[1];
    
    wire [5:0] in_mux_out;
    wire [5:0] reg_out;
    wire [5:0] add_4_out;
    wire [5:0] add_n_out;
    wire [5:0] add_mux_out;
    wire load_or_count;
    
    // Input Mux
    mux in_mux(add_mux_out, {in_bit, 5'b00000}, ld, in_mux_out);
    
    // Load or Count
    or(load_or_count, ld, cnt);
    
    // Program Counter
    reg_6bit program_counter(sysclk, load_or_count, in_mux_out, reg_out);
        
    // 4 Adder
    adder adder_4(reg_out, 6'b000100, add_4_out);
    
    // N Adder
    adder adder_n(reg_out, {3'b000, BUTTONS[1], BUTTONS[0], 1'b0}, add_n_out);
    
    // Adder Mux
    mux add_mux(add_4_out, add_n_out, add_mux_s, add_mux_out);
    
    always @(reg_out) begin
        LEDS <= reg_out;
    end
    
endmodule
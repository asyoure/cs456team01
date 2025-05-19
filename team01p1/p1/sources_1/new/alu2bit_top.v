`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto, Azure Dovel
// 
// Create Date: 02/13/2025 10:24:19 AM
// Design Name: 
// Module Name: alu2bit_top
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

// inputs and outputs for the 2-bit ALU
//module alu2bit_top(
//        input a0,   // a0 bit pair
//        input a1,   // a1 bit pair
//        input b0,   // b0 bit pair
//        input b1,   // b1 bit pair
//        input x,    // x - namesake from zybooks
//        input w,    // w - namesake from zybooks
//        output s0,  // s0 bit
//        output s1   // s1 bit
//    );
    
//    wire not_b0;
//    wire not_b1;
    
//    // negate b0 and b1; store them in wires
//    not(not_b0, b0);
//    not(not_b1, b1);
    
//    wire both0;
//    wire both1;
    
//    // a0 & b0 and a1 & b1; store them in wires
//    and(both0, a0, b0);
//    and(both1, a1, b1);
    
//    wire either0;
//    wire either1;
    
//    // a0 || b0 and a1 || b1; store them in wires
//    or(either0, a0, b0);
//    or(either1, a1, b1);
    
//    wire a1_out;
//    wire a0_out;
//    wire b1_out;
//    wire b0_out;
//    wire cin;
//              //  &     |        +   -
//    mux4_1 a1mux(both1, either1, a1, a1, x, w, a1_out); // 4-1 multiplexor
//    mux4_1 a0mux(both0, either0, a0, a0, x, w, a0_out); // 4-1 multiplexor
//    mux4_1 b1mux(0,     0,       b1, not_b1, x, w, b1_out); // 4-1 multiplexor
//    mux4_1 b0mux(0,     0,       b0, not_b0, x, w, b0_out); // 4-1 multiplexor
//    mux4_1 cimux(0,     0,       0,  1, x, w, cin); // // 4-1 multiplexor
    
//    adder adder_final(cin, a0_out, a1_out, b0_out, b1_out, s0, s1, ); // adder for the final result
    
//endmodule

module alu2bit_top(
        input [0:3] BUTTONS,     // Operand inputs (BUTTONS[1:0] = a[1:0], BUTTONS[3:2] = b[1:0])
        input [1:0] SWITCHES,    // Select lines for ALU operation
        output [1:0] LEDS        // Result output (LEDS[1:0] = result, LEDS[2] = carry-out if applicable)
    );
    
    wire a0 = BUTTONS[0];
    wire a1 = BUTTONS[1];
    wire b0 = BUTTONS[2];
    wire b1 = BUTTONS[3];
    
    wire not_b0;
    wire not_b1;
    
    // negate b0 and b1; store them in wires
    not(not_b0, b0);
    not(not_b1, b1);
    
    wire both0;
    wire both1;
    
    // a0 & b0 and a1 & b1; store them in wires
    and(both0, a0, b0);
    and(both1, a1, b1);
    
    wire either0;
    wire either1;
    
    // a0 || b0 and a1 || b1; store them in wires
    or(either0, a0, b0);
    or(either1, a1, b1);
    
    wire a1_out;
    wire a0_out;
    wire b1_out;
    wire b0_out;
    wire cin;
    
    mux4_1 a1mux(both1, either1, a1, a1, SWITCHES[0], SWITCHES[1], a1_out);
    mux4_1 a0mux(both0, either0, a0, a0, SWITCHES[0], SWITCHES[1], a0_out);
    mux4_1 b1mux(0, 0, b1, not_b1, SWITCHES[0], SWITCHES[1], b1_out);
    mux4_1 b0mux(0, 0, b0, not_b0, SWITCHES[0], SWITCHES[1], b0_out);
    mux4_1 cimux(0, 0, 0, 1, SWITCHES[0], SWITCHES[1], cin);
    
    adder adder_final(cin, a0_out, a1_out, b0_out, b1_out, LEDS[0], LEDS[1],);
    
endmodule
`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Azure Dovel, James Agresto
// 
// Create Date: 03/01/2025 03:02:16 PM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb;
    reg [5:0] d0, d1;
    reg s;
    wire [5:0] out;
    
    localparam time_step = 5;
    integer i;
    mux mux_tb(d0, d1, s, out);
    
    initial begin
        d1 = 0;
        for (i = 0; i < 128; i = i + 1) begin
            {d0, s} = i;
            #time_step;
        end
        $finish();
    end
endmodule
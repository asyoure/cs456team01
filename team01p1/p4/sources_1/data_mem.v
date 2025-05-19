`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: James Agresto & Azure Dovel
// 
// Create Date: 04/11/2025 12:28:08 PM
// Design Name: 
// Module Name: data_mem
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


module data_mem(
        input sysclk, // FALLING EDGE
        input [31:0] alu_result, 
        input s1,
        input [31:0] write_data,
        input mem_write, 
        input mem_read,
        input mem_to_reg,
        output [31:0] data_out
    );
    
    wire [7:0] address = {alu_result[7], s1, alu_result[5:0]};
    reg [31:0] read_data;
    reg [7:0] data [31:0];
    
    integer i;
    
    initial begin
        data[8'h0] = 32'h00C0FFEE;
        data[8'h4] = 32'hA5A5A5A5;
        data[8'h8] = 32'h00000000;
        for (i = 8'hC; i < 8'h3F; i=i+4) begin
            data[i] = 32'h00000000;
        end
        data[8'h40] = 32'hFFFFFFFF;
        data[8'h44] = 32'h00000001;
        data[8'h48] = 32'h00000000;
    end
    
    // Asynchronous read
    always @(*) begin
        if (mem_read)
        begin
            read_data = data[address];
        end else begin
            read_data = 32'h0;
        end        
    end

    // Negative Edge Write
    always @(negedge sysclk) begin
        if (mem_write) begin
            data[address] <= write_data;
        end
    end
    
    assign data_out = mem_to_reg ? read_data : alu_result;
    
endmodule
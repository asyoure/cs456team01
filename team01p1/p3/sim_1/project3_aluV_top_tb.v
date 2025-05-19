`timescale 1ns/1ns
module project3_aluV_top_testbench;
    wire [31:0] result;
    wire zero;
    wire overflow;
    wire carryout;
    reg [1:0] aluop;
    reg [9:0] funccode;
    reg [31:0] a;
    reg [31:0] b;
    
    project3_aluV_top p3top_tb(aluop, funccode, a, b, zero, result,
                               overflow, carryout
                               );

    localparam time_step = 10;

    initial begin

        // Dump waves - if you want to use a wave viewer at home
        $dumpfile("dump.vcd");
        $dumpvars(0, p3top_tb);

        $display("Test and");
        aluop = 2'd2;
        funccode = 10'd7;
        a = 32'h00000007;
        b = 32'h00000005;
        #time_step;
        $display("Result should be 32'h00000005 decimal: 5");
        display;

        $display("Test or");
        aluop = 2'd2;
        funccode = 10'd6;
        #time_step;
        $display("Result should be 32'h00000007 decimal: 7");
        display;

        $display("Test lw");
        aluop = 2'd0;
        funccode = 10'd2;     // funccode doesn't matter, but func3 would be 2
        #time_step;
        $display("Result should be decimal: 12 hex: c");
        display;

        $display("Test sw");
        aluop = 2'd0;
        funccode = 10'd2;     // funccode doesn't matter, but func3 would be 2
        #time_step;
        $display("Result should be decimal: 12 hex: c");
        display;

        $display("Test beq");
        aluop = 2'd1;
        funccode = 10'd8;     // funccode doesn't matter, but func3 would be 0
        #time_step;
        $display("Result should be 32'h00000002 in decimal 2, zero: 0, over: 0, carry: 0");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test beq");
        aluop = 2'd1;
        funccode = 10'd8;     // funccode doesn't matter, but func3 would be 0
        a = 32'h00000001;
        b = 32'h00000001;
        #time_step;
        $display("Result should be 32'h00000000 in decimal 0, zero: 1, over: 0, carry: 1");
        // Why is the carryout 1? Because the beq does a subtract, by negating b
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test add");
        aluop = 2'd2;
        funccode = 10'd0;
        a = 32'h00000017;
        b = 32'h0000000d;
        #time_step;
        $display("Result should be decimal: 36 hex: 24");
        display;

        $display("Test sub");
        aluop = 2'd2;
        funccode = 10'd256;
        #time_step;
        $display("Result should be decimal: 10 hex: a");
        display;

        $display("Test add overflow positive");
        aluop = 2'd2;
        funccode = 10'd0;
        a = 32'h7fffffff;
        b = 32'h00000001;
        #time_step;
        $display("Result should be decimal: -2147483648 hex: 80000000, zero: 0, over: 1, carry: 0");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test add overflow negative");
        aluop = 2'd2;
        funccode = 10'd0;
        a = 32'hffffffff;
        b = 32'h80000000;
        #time_step;
        $display("Result should be decimal: -2147483647 hex: 7fffffff, zero: 0, over: 1, carry: 1");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test add opposite signs");
        aluop = 2'd2;
        funccode = 10'd0;
        a = 32'h80000002;
        b = 32'h00000001;
        #time_step;
        $display("Result should be decimal: -2147483646 hex: 80000003, zero: 0, over: 0, carry: 0");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test sub opposite signs");
        aluop = 2'd2;
        funccode = 10'd256;
        a = 32'h80000002;
        b = 32'h00000001;
        #time_step;
        $display("Result should be decimal: -2147483647 hex: 80000001, zero: 0, over: 0, carry: 0");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $display("Test add to zero");
        aluop = 2'd2;
        funccode = 10'd0;
        a = 32'hffffffff;
        b = 32'h00000001;
        #time_step;
        $display("Result should be decimal: 0 hex: 0, zero: 1, over: 0, carry: 1");
        display;
        $display("zero:%0h, overflow:%0h, carryout:%0h", zero, overflow, carryout);

        $finish();
     end

    task display;
    #1 $display("a:%0h, b:%0h, result:%0h", a, b, result);
    endtask

endmodule
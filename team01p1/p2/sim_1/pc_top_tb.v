 `timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Dee Weikjle
// 
// Create Date: 02/28/2025 10:37:39 AM
// Design Name: 
// Module Name: upcounter_4bit_ldrst_top_tb
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


 module pc_top_tb;
     reg clock, count, load, s1, in;
     reg [1:0] add_amt;
     wire [5:0] leds;
       
     localparam time_step = 10;
     //                      BUTTONS [3:0]         SWITCHES [1:0] 
     pc_top pc_top_tb(clock, {in, count, add_amt}, {s1, load}, leds); 
    
     initial
         begin   
             // test loading with zero and incrementing as if sequential code        
             clock = 0;
             count = 0;
             load = 1;
             s1 = 0;
             in = 0;
             add_amt = 0;
             #time_step;
            
             clock = 1;
             #time_step;
                      
             clock = 0;
             count = 1;  // start counting (remember it should be plus 4)
             load = 0;
             #time_step;
                                              
             clock = 1;
             #time_step;
                        
             clock = 0;
             #time_step;
                 
             clock = 1;
             #time_step;
                       
             clock = 0;
             #time_step;
                 
             clock = 1;
             #time_step;

            // test loading with 100000 and counting sequentially
             clock = 0;
             count = 0;
             load = 1;
             s1 = 0;
             in = 1;  // start at program at address 100000 (BUTTONS[3] is 1)
             #time_step;

             clock = 1;
             #time_step;
                      
             clock = 0;
             count = 1;  // start counting (remember it should be plus 4)
             load = 0;
             #time_step;

             clock = 1;
             #time_step;

             clock = 0;
             #time_step;
                 
             clock = 1;
             #time_step;
                       
             clock = 0;
             #time_step;
                 
             clock = 1;
             #time_step;

             // test a branch now
             clock = 0;
             add_amt = 2'b11;
             s1 = 1;
             #time_step;
     
             clock = 1;
             #time_step;

             // count from new location
             clock = 0;
             count = 1;
             load = 0;
             s1 = 0;
             #time_step;

              clock = 1;
             #time_step;     
            
             $finish();         
         end
    
 endmodule
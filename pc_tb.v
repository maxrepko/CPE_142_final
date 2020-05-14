 `timescale 1ns / 1ps

 module pc_tb;  
      // Inputs  
      reg clk;  
      reg rst;  
      reg [15:0] pc_input;  
      // Outputs  
      wire [15:0] pc_output;  
 
      pc uut (  
           .clk(clk),   
           .rst(rst),   
           .pc_input(pc_input),   
           .pc_output(pc_output)  

      );
      
      initial begin  
           clk = 0;  
           forever #10 clk = ~clk;  
      end
      
      initial begin  

           pc_input = 16'd0;
           rst = 1;  
 
           #100;  
           rst = 0;  
           
           #100;
           pc_input = 16'd2;
           
           #100;
           pc_input = 16'd4;
           
           #100;
           pc_input = 8'd6;
           
           #100;
           pc_input = 8'd8;

      end  
 endmodule 
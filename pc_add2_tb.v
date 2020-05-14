 `timescale 1ns / 1ps

 module pc_add2_tb;    
        
      reg [7:0] pc;   

      wire [7:0] pc_2; 
 
      pc_add2 uut (  
           .pc(pc),   
           .pc_2(pc_2)
      );
      
      initial begin  
           
           pc = 8'd0;
           
           #100;
           pc = 8'd0;

      end  
 endmodule 
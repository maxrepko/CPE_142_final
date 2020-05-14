 `timescale 1ns / 1ps

 module inst_mem_tb;  
      // Inputs  
      reg [15:0] pc;  
      // Outputs  
      wire [15:0] Instruction;  
 
      inst_mem uut (  
           .pc(pc),   
           .Instruction(Instruction)
      );
      
      initial begin  

           pc = 16'h0a;
           
           #100;
           pc = 16'h00;
           
           #100;
           pc = 16'h02;
           
           #100;
           pc = 16'h04;
           
           #100;
           pc = 16'h06;
           
           #100;
           pc = 16'h08;
           
           #100;
           pc = 16'h0a;
           
           #100;
           pc = 16'h0c;


      end  
 endmodule 
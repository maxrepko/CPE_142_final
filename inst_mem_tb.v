 `timescale 1ns / 1ps

 module inst_mem_tb;  
      // Inputs  
      reg [7:0] Address;  
      // Outputs  
      wire [15:0] Instruction;  
 
      inst_mem uut (  
           .Address(Address),   
           .Instruction(Instruction)
      );
      
      initial begin  

           Address = 8'h0a;
           
           #100;
           Address = 8'h00;
           
           #100;
           Address = 8'h02;
           
           #100;
           Address = 8'h04;
           
           #100;
           Address = 8'h06;
           
           #100;
           Address = 8'h08;
           
           #100;
           Address = 8'h0a;
           
           #100;
           Address = 8'h0c;


      end  
 endmodule 
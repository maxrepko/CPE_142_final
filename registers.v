module registers(clk, rst, wr_en, wr_dest, wr_data, rd_addr_1, rd_data_1, rd_addr_2, rd_data_2);
      
      input clk, rst, wr_en;
      input [3:0] wr_dest, rd_addr_1,rd_addr_2;
      output [15:0] wr_data, rd_data_1, rd_data_2;
   
      reg [15:0] reg_loc [7:0];  

      always @ (posedge clk or posedge rst) begin  
           if(rst) begin  
                reg_loc[0] <= 16'h0000;  
                reg_loc[1] <= 16'h0f00;  
                reg_loc[2] <= 16'h0050;  
                reg_loc[3] <= 16'hff0f;  
                reg_loc[4] <= 16'hf0ff;  
                reg_loc[5] <= 16'h0040;  
                reg_loc[6] <= 16'h0024;  
                reg_loc[7] <= 16'h00ff;
                reg_loc[8] <= 16'haaaa;
                reg_loc[9] <= 16'h0000;
                reg_loc[10] <= 16'h0000;
                reg_loc[11] <= 16'h0000;
                reg_loc[12] <= 16'hffff;
                reg_loc[13] <= 16'h0002;
                reg_loc[14] <= 16'h0000;
                reg_loc[15] <= 16'h0000;       
           end  
           else begin  
                if(wr_en) begin  
                     reg_loc[wr_dest] <= wr_data;  
                end  
           end  
      end
      
      assign rd_data_1 = ( rd_addr_1 == 0)? 16'b0 : reg_loc[rd_addr_1];  
      assign rd_data_2 = ( rd_addr_2 == 0)? 16'b0 : reg_loc[rd_addr_2];  
      
 endmodule 

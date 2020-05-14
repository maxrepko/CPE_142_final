`timescale 1ns / 1ps

module pc(pc_input, rst, clk, pc_output);

    input       [15:0]  pc_input;
	input               rst, clk;

	output reg  [15:0]  pc_output;



	initial
	begin
	
		pc_output <= 16'd0;
		
	end

    always @(posedge clk or posedge rst)  
    begin   
        if(rst)   
            pc_output <= 16'd0;  
        else  
            pc_output <= pc_input;  
    end  

endmodule
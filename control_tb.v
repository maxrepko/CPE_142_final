module control_tb;
    reg clk;
    reg [7:0] instruction;
    // output signals = [regdst, branch, memread, memwrite, alusrc, regwrite, opcode, funct_code};
    wire [13:0] signals;
    
    control c1 (clk, instruction, signals);
    
    initial begin
        clk = 0;
        instruction = 8'h0D;
        #20 instruction = 8'h01;
        #20 instruction = 8'h08;
        #20 instruction = 8'h80;
        #20 instruction = 8'hB0;
        #20 instruction = 8'h60;
        #20 instruction = 8'hF0;
        #20 instruction = 8'h12;
        #30 $finish;
    end
    
    always #10 clk = !clk;
    
endmodule
module control(clk, instruction, signals);
    input clk;
    input [7:0] instruction;
    // output signals = [regdst, branch, memread, memwrite, alusrc, regwrite, opcode, funct_code};
    output reg [13:0] signals;
    
    always @(posedge clk) begin
        // Addition, subtraction, and
        if (instruction == 8'h0C | instruction == 8'h0D | instruction == 8'h0E ) begin
            signals = {6'b000001,instruction};
        end 
        // Or,  multiplication, division
        if (instruction == 8'h0F | instruction == 8'h01 | instruction == 8'h02 ) begin
            signals = {6'b000001,instruction};
        end
        // Logical shift left/right, rotate left/right
        if (instruction == 8'h08 | instruction == 8'h09 | instruction == 8'h0A | instruction == 8'h0B ) begin
            signals = {6'b000011,instruction};
        end
        // Memory Read
        else if (instruction == 8'h80) begin
            signals = {6'b001000,instruction};
        end
        // Memory Write
        else if (instruction == 8'hB0) begin
            signals = {6'b000100,instruction};
        end
        // branch LEG / Jump
        else if (instruction == 8'h60 | instruction == 8'h70 | instruction == 8'h80 | instruction == 8'hC0) begin
            signals = {6'b010000,instruction};
        end
        // HALT
        else if (instruction == 8'hF0) begin
            signals = {6'b000000,instruction};
        end
        
        else signals = 14'h3FFF;
    end
endmodule
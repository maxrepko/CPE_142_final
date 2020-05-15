//THIS CODE BELONGS TO: MICHEAL GOMEZ

`timescale 1ns / 1ns
module memory_tb;
reg write_enable, read_enable, clk, reset;
reg[15:0] addr, data_in;
wire[15:0] read_data_out;

data_memory u1(write_enable, read_enable, clk, reset, addr, data_in, read_data_out);  

always
#10 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;
    addr = 0;
    write_enable = 0;
    read_enable = 1;
    data_in = 16'h0666;

    #10 reset = 0;
    #10 $display("Display value at address 0x0: %h", read_data_out);
    #10 write_enable = 1; read_enable = 0;
    #40 write_enable = 0; read_enable = 1;
    #40 $display("Display written value at address 0x0: %h", read_data_out); 
    #40 $stop;

end


initial begin
        $dumpfile("memory.vcd");
        $dumpvars(0, memory_tb);
    end
endmodule

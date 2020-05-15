 `timescale 1ns / 1ns
 module memory(write_enable, read_enable, clk, reset, addr, data_in, data_out);  
    
    input write_enable, read_enable, clk, reset;
    input     [15:0] addr;
    input     [15:0] data_in;
    output reg[15:0] data_out;  
    reg [15:0]   temp_data_out;
    wire [7:0] lower_word = data_in[7:0];
    wire [7:0] upper_word = data_in[15:8];
    reg [7:0] mem[65535:0];  
    
    always @(posedge clk or reset)
        begin
            if(reset)
                begin
                mem[0] = 8'hCD;
                mem[1] = 8'h2B;
                end
            else 
                begin
                    if(read_enable && (write_enable == 0))
                        temp_data_out <= {mem[addr+1],mem[addr]};

                    else if((read_enable == 0) && write_enable)
                        begin
                            mem[addr] <= lower_word;
                            mem[addr + 1] <= upper_word;
                        end
                end
                assign data_out = temp_data_out;
        end
           
endmodule  
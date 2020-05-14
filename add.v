`timescale 1ns / 1ps

module adder(pc_2, shL2, add_out);
input [15:0] pc_2;
input [15:0] shL2;
output [15:0] add_out;

assign add_out = pc_2 + shL2;

endmodule

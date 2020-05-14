`timescale 1ns / 1ps

module pc_add2(pc, pc_2);
input [15:0] pc;
output [15:0] pc_2;

assign pc_2 = pc + 16'd2;

endmodule
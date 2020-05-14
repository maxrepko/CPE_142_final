`timescale 1ns / 1ps

module pc_add2(pc, pc_2);
input [7:0] pc;
output [7:0] pc_2;

assign pc_2 = pc + 8'd2;

endmodule
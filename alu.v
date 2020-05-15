module alu (op1, op2, funct_code, opcode, clk, result, zero);
	input [7:0] op1, op2;
	input [3:0] funct_code;
	input [3:0] opcode;
	input clk;
	output reg [7:0] result;
	output reg zero;
	integer times = 0;

	always @(posedge clk) begin
		result = 8'h0000;
		zero = 0;
		// Type A
		if (opcode == 4'h0000) begin
		zero = 0;
			case (funct_code)
				4'b1111	: 	result[3:0] = op1[3:0] + op2[3:0];
				4'b1110	: 	result[3:0] = op1[3:0] - op2[3:0];
				4'b1101	: 	result[3:0] = op1[3:0] & op2[3:0];
				4'b1100	: 	result[3:0] = op1[3:0] | op2[3:0];
				4'b0001	: 	result[7:0] = op1[3:0] * op2[3:0];
				4'b0010	: 	begin
								result[3:0] = op1[3:0] / op2[3:0];
								result[7:4] = op1 % op2;
							end
				4'b1010	: 	result[3:0] = op1[3:0] << op2[3:0];
				4'b1011	: 	result[3:0] = op1[3:0] >> op2[3:0];
				4'b1000	: 	begin
								for (times = op2; times >= 0; times = times - 1) begin
									result[3:0]  = {op1[2:0] + op1[3]};
								end
							end
				4'b1001	: 	begin
								for (times = op2; times >= 0; times = times - 1) begin
									result[3:0] = {op1[0] + op1[3:1]};
								end
							end				
				default	:   result = 8'hEF;
			endcase
		end
		
		// Type B
		else if (opcode[3:2] == 2) begin
		zero = 0;
			case (opcode)
				4'b1000	:	result = op1 + op2[3:0];
				4'b1000	:	result = op1 + op2[3:0];
				default	:   result = 16'hBDEF;
			endcase
		end
		
		// Type C
		else if (opcode[3:2] == 1) begin
		result = 0;
			case (opcode)
				4'b0100 :   if (op1 < op2) zero = 1;
				4'b0101 :	if (op1 > op2) zero = 1;
				4'b0110 :	if (op1 == op2)	zero = 1;
				default	:   result = 16'hCDEF;
			endcase
		end
		
		// Type D
		else if (opcode[3:2] == 3) begin
			case (opcode)
				4'b1100	:	zero = 1;
				4'b1111	:	zero = 0;
				default	:   result = 16'hDDEF;
			endcase
		end
		
	end
endmodule
module alu_tb;
    reg [7:0] op1, op2;
	reg [3:0] funct_code;
	reg [1:0] control;
	reg clk;
	wire [7:0] result;
	wire zero;
    
    alu t1(op1, op2, funct_code, control, clk, result, zero);
    
    initial begin
        clk = 0;
        funct_code = 4'b0000;
        control = 0;
        op1 = 4'b0000;			// op1
		op2 = 4'b0000;			// op2
		
		// Begin testing Type: A, Function: 1111 (Addition)
		#30
        funct_code = 4'b1111;
        op1 = 4'b1000;			// op1
		op2 = 4'b0001;			// op2
		
		// Begin testing Type: A, Function: 1110 (Subtraction)
		#30
		funct_code = 4'b1110;			// function code
		
		// Begin testing Type: A, Function: 1101 (And)
		#30
		funct_code = 4'b1101;			// function code
		
		// Begin testing Type: A, Function: 1100 (Or)
		#30
		funct_code = 4'b1100;			// function code
		
		// Begin testing Type: A, Function: 0001 (Multiplication)
		#30
		funct_code = 4'b0001;			// function code
		
		// Begin testing Type: A, Function: 0010 (Division)
		#30
		funct_code = 4'b0010;			// function code
		
		// Begin testing Type: A, Function: 0010 (Logical Shift Left)
		#30
		funct_code = 4'b1010;			// function code
		
		// Begin testing Type: A, Function: 0010 (Logical Shift Right)
		#30
		funct_code = 4'b1011;			// function code
		
		// Begin testing Type: A, Function: 0010 (Rotate Left)
		#30
		funct_code = 4'b1000;			// function code
		
		// Begin testing Type: A, Function: 0010 (Rotate Right)
		#30
		funct_code = 4'b1001;			// function code	
		
		#100 $finish;
    end

    always #10 clk = !clk;
	
endmodule
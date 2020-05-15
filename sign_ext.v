module sign_ext(sOut16,sIn4);

output [15:0] sOut16;
input [3:0] sIn4;

assign sOut16 = {12'h000, sIn4};

endmodule
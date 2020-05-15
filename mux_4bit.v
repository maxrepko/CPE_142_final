
module mux_4bit( d0, d1, s, y );
input [3:0] d0, d1;
input s;
output [3:0] y;
reg [3:0] y;

always@(d0 or d1 or s)
begin
    if ( s == 1 )
        y = d1;
    else
        y = d0;
end
endmodule
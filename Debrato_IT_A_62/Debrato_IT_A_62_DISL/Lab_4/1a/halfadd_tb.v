`timescale 1ns/1ns
`include "halfadd.v"

module halfadd_tb();
reg x,y;
wire Cout,s;
halfadd ex(x, y, s, Cout);
initial
begin
$dumpfile("halfadd_tb.vcd");
$dumpvars(0, halfadd_tb);
x=1'b0;y=1'b0;
#20;
x=1'b0;y=1'b1;
#20;
x=1'b1;y=1'b0;
#20;
x=1'b1;y=1'b1;
#20;
$display("Test complete");
end
endmodule

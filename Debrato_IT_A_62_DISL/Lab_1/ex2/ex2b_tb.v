`timescale 1ns/1ns
`include "ex2b.v"    //Name of the Verilog file

module ex2b_tb();
reg a,b,c,d;		//Input
wire f,g;			//Output
ex2b ex(a, b, c, d, f,g);	//Instantiation of the module
initial
begin

	$dumpfile("ex2b_tb.vcd");
	$dumpvars(0, ex2b_tb);
	
	a=1'b0; b=1'b0; c=1'b0;d=1'b0;
	#20;
	a=1'b0; b=1'b0; c=1'b0;d=1'b1;
	#20;
	a=1'b0; b=1'b0; c=1'b1;d=1'b0;
	#20;
	a=1'b0; b=1'b0; c=1'b1;d=1'b1;
	#20;
	a=1'b0; b=1'b1; c=1'b0;d=1'b0;
	#20;
	a=1'b0; b=1'b1; c=1'b0;d=1'b1;
	#20;
	a=1'b0; b=1'b1; c=1'b1;d=1'b0;
	#20;
	a=1'b0; b=1'b1; c=1'b1;d=1'b1;
	#20;
	a=1'b1; b=1'b0; c=1'b0;d=1'b0;
	#20;
	a=1'b1; b=1'b0; c=1'b0;d=1'b1;
	#20;
	a=1'b1; b=1'b0; c=1'b1;d=1'b0;
	#20;
	a=1'b1; b=1'b0; c=1'b1;d=1'b1;
	#20;
	a=1'b1; b=1'b1; c=1'b0;d=1'b0;
	#20;
	a=1'b1; b=1'b1; c=1'b0;d=1'b1;
	#20;
	a=1'b1; b=1'b1; c=1'b1;d=1'b0;
	#20;
	a=1'b1; b=1'b1; c=1'b1;d=1'b1;
	#20;
	

	
	$display("Test complete");
end

endmodule

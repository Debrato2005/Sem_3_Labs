`timescale 1ns/1ns
`include "ex1a.v"    //Name of the Verilog file

module ex1a_tb();
reg a,b,c,d;		//Input
wire f;			//Output
ex1a ex(a, b, c, d, f);	//Instantiation of the module
initial
begin

	$dumpfile("ex1a_tb.vcd");
	$dumpvars(0, ex1a_tb);
	
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

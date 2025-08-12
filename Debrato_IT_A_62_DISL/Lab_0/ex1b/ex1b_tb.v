`timescale 1ns/1ns
`include "ex1b.v"    //Name of the Verilog file

module ex1b_tb();
reg x1, x2, x3;		//Input
wire f;			//Output
ex1b ex(x1, x2, x3, f);	//Instantiation of the module
initial
begin

	$dumpfile("ex1b_tb.vcd");
	$dumpvars(0, ex1b_tb);
	
	x1=1'b0; x2=1'b0; x3=1'b0;
	#20;
	
	x1=1'b0; x2=1'b0; x3=1'b1;
	#20;
	
	x1=1'b0; x2=1'b1; x3=1'b0;
	#20;
	
	x1=1'b0; x2=1'b1; x3=1'b1;
	#20;
	
	x1=1'b1; x2=1'b0; x3=1'b0;
	#20;
	
	x1=1'b1; x2=1'b0; x3=1'b1;
	#20;
	
	x1=1'b1; x2=1'b1; x3=1'b0;
	#20;
	
	x1=1'b1; x2=1'b1; x3=1'b1;
	#20;
	
	$display("Test complete");
end

endmodule

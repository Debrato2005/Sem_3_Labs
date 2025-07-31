`timescale 1ns/1ns
`include "ex2.v"    //Name of the Verilog file

module ex2_tb();
reg x1, x2, x3, x4;		//Input
wire f, g, h;			//Output
ex2 ex(x1, x2, x3, x4, f, g, h);	//Instantiation of the module
initial
begin

	$dumpfile("ex2_tb.vcd");
	$dumpvars(0, ex2_tb);
	
	x1=1'b0; x2=1'b0; x3=1'b0;x4=1'b0;
	#20;
	x1=1'b0; x2=1'b0; x3=1'b0;x4=1'b1;
	#20;
	x1=1'b0; x2=1'b0; x3=1'b1;x4=1'b0;
	#20;
	x1=1'b0; x2=1'b0; x3=1'b1;x4=1'b1;
	#20;
	x1=1'b0; x2=1'b1; x3=1'b0;x4=1'b0;
	#20;
	x1=1'b0; x2=1'b1; x3=1'b0;x4=1'b1;
	#20;
	x1=1'b0; x2=1'b1; x3=1'b1;x4=1'b0;
	#20;
	x1=1'b0; x2=1'b1; x3=1'b1;x4=1'b1;
	#20;
	x1=1'b1; x2=1'b0; x3=1'b0;x4=1'b0;
	#20;
	x1=1'b1; x2=1'b0; x3=1'b0;x4=1'b1;
	#20;
	x1=1'b1; x2=1'b0; x3=1'b1;x4=1'b0;
	#20;
	x1=1'b1; x2=1'b0; x3=1'b1;x4=1'b1;
	#20;
	x1=1'b1; x2=1'b1; x3=1'b0;x4=1'b0;
	#20;
	x1=1'b1; x2=1'b1; x3=1'b0;x4=1'b1;
	#20;
	x1=1'b1; x2=1'b1; x3=1'b1;x4=1'b0;
	#20;
	x1=1'b1; x2=1'b0; x3=1'b0;x4=1'b0;
	#20;

	
	$display("Test complete");
end

endmodule

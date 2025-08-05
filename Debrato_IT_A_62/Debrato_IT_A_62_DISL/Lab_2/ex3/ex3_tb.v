`timescale 1ns/1ns
`include "ex3.v"    //Name of the Verilog file

module ex3_tb();
reg x1, x2, x3, x4;		//Input
wire f;			//Output
ex3 ex(x1, x2, x3, x4, f);	//Instantiation of the module
initial
begin

	$dumpfile("ex3_tb.vcd");
	$dumpvars(0, ex3_tb);
	
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
	x1=1'b1; x2=1'b1; x3=1'b1;x4=1'b1;
	#20;

	
	$display("Test complete");
end

endmodule

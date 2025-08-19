`timescale 1ns/1ns
`include "fulladd.v"

module fulladd_tb();
  reg Cin, x, y;
  wire s, Cout;

  fulladd a1(Cin, x, y, s, Cout);

  initial begin
    $dumpfile("fulladd_tb.vcd");
    $dumpvars(0, fulladd_tb);

    Cin = 0;
    x = 0; y = 0;
    x = 0; y = 1;
    x = 1; y = 0;
    x = 1; y = 1; 
    #20;

    Cin = 1; 
    x = 0; y = 0; 
    x = 0; y = 1;
    x = 1; y = 0;
    x = 1; y = 1; 
    #20;

    $display("Test complete");
  end
endmodule


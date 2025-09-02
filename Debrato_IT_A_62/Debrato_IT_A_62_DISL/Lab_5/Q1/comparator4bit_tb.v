`timescale 1ns/1ns
`include "comparator4bit.v"

module comparator4bit_tb();
  reg [3:0] a, b;
  wire equal, greater, less;

  comparator4bit uut(a, b, equal, greater, less);

  initial begin
    $dumpfile("comparator4bit_tb.vcd");
    $dumpvars(0, comparator4bit_tb);

    a = 4'b0000; b = 4'b0000; #20;
    a = 4'b0010; b = 4'b0001; #20;
    a = 4'b0101; b = 4'b1010; #20;
    a = 4'b1111; b = 4'b1111; #20;
    a = 4'b1000; b = 4'b0111; #20;
    a = 4'b0110; b = 4'b0111; #20;

    $display("Test Complete");
    $finish;
  end
endmodule


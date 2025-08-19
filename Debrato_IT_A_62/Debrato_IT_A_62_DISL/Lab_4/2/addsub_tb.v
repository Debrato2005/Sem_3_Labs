`timescale 1ns/1ns
`include "addsub.v"

module addsub_tb;
  reg mode;
  reg x3, x2, x1, x0;
  reg y3, y2, y1, y0;
  wire s3, s2, s1, s0;
  wire carryout;

  // Instantiate the addsub module
  addsub uut (
    mode,
    x3, x2, x1, x0,
    y3, y2, y1, y0,
    s3, s2, s1, s0,
    carryout
  );

  initial begin
  $dumpfile("addsub_tb.vcd");
  $dumpvars(0, addsub_tb);

    // Test 1: Addition 4 + 3 = 7
    mode = 1'b0;  // 0 means addition
    x3 = 1'b0; x2 = 1'b1; x1 = 1'b0; x0 = 1'b0;  // 4 = 0100
    y3 = 1'b0; y2 = 1'b0; y1 = 1'b1; y0 = 1'b1;  // 3 = 0011
    #20;

    // Test 2: Subtraction 4 - 3 = 1
    mode = 1'b1;  // 1 means subtraction
    x3 = 1'b0; x2 = 1'b1; x1 = 1'b0; x0 = 1'b0;  // 4 = 0100
    y3 = 1'b0; y2 = 1'b0; y1 = 1'b1; y0 = 1'b1;  // 3 = 0011
    #20;

    // Test 3: Addition 7 + 8 = 15
    mode = 1'b0;
    x3 = 1'b0; x2 = 1'b1; x1 = 1'b1; x0 = 1'b1;  // 7 = 0111
    y3 = 1'b1; y2 = 1'b0; y1 = 1'b0; y0 = 1'b0;  // 8 = 1000
    #20;

    // Test 4: Subtraction 5 - 7 = -2 (in 2's complement)
    mode = 1'b1;
    x3 = 1'b0; x2 = 1'b1; x1 = 1'b0; x0 = 1'b1;  // 5 = 0101
    y3 = 1'b0; y2 = 1'b1; y1 = 1'b1; y0 = 1'b1;  // 7 = 0111
    #20;

    $display("Test complete");
    $finish;
end
endmodule


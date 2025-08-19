`timescale 1ns/1ns
`include "multip.v"
module multip_tb;
  reg a1, a0, b1, b0;
  wire p3, p2, p1, p0;

  // Instantiate the multiplier
  multip uut (a1, a0, b1, b0, p3, p2, p1, p0);

  initial begin
    // Set up VCD dump for waveform viewing
    $dumpfile("multip_tb.vcd");
    $dumpvars(0, multip_tb);

    // Test 1: 2 * 3 = 6 (10 * 11 = 0110)
    a1 = 1'b1; a0 = 1'b0;  // 2
    b1 = 1'b1; b0 = 1'b1;  // 3
    #20;

    // Test 2: 1 * 1 = 1 (01 * 01 = 0001)
    a1 = 1'b0; a0 = 1'b1;  // 1
    b1 = 1'b0; b0 = 1'b1;  // 1
    #20;

    // Test 3: 3 * 3 = 9 (11 * 11 = 1001)
    a1 = 1'b1; a0 = 1'b1;  // 3
    b1 = 1'b1; b0 = 1'b1;  // 3
    #20;

    // Test 4: 0 * 2 = 0 (00 * 10 = 0000)
    a1 = 1'b0; a0 = 1'b0;  // 0
    b1 = 1'b1; b0 = 1'b0;  // 2
    #20;

    $display("Testbench complete");
    $finish;
  end

endmodule


`timescale 1ns/1ns
`include "bcdadd.v"

module bcdadd_tb;

  reg a3, a2, a1, a0;
  reg b3, b2, b1, b0;
  reg cin;
  wire s3, s2, s1, s0;
  wire cout;

  bcdadd ex(
    a3, a2, a1, a0,
    b3, b2, b1, b0,
    cin,
    s3, s2, s1, s0,
    cout
  );

  initial begin
    $dumpfile("bcdadd_tb.vcd");
    $dumpvars(0, bcdadd_tb);

    // Test 1: 4 + 5 = 9
    a3=1'b0; a2=1'b1; a1=1'b0; a0=1'b0;  // 4
    b3=1'b0; b2=1'b0; b1=1'b0; b0=1'b1;  // 5
    cin=1'b0;
    #20;

    // Test 2: 7 + 8 = 15 (BCD sum = 5, carryout=1)
    a3=1'b0; a2=1'b1; a1=1'b1; a0=1'b1;  // 7
    b3=1'b1; b2=1'b0; b1=1'b0; b0=1'b0;  // 8
    cin=1'b0;
    #20;

    // Test 3: 9 + 9 = 18 (BCD sum = 8, carryout=1)
    a3=1'b1; a2=1'b0; a1=1'b0; a0=1'b1;  // 9
    b3=1'b1; b2=1'b0; b1=1'b0; b0=1'b1;  // 9
    cin=1'b0;
    #20;

    // Test 4: 0 + 0 = 0
    a3=1'b0; a2=1'b0; a1=1'b0; a0=1'b0;
    b3=1'b0; b2=1'b0; b1=1'b0; b0=1'b0;
    cin=1'b0;
    #20;

    $display("Test complete");
    $finish;
  end

endmodule


`timescale 1ns / 1ns
`include "d_ff.v"
module d_ff_tb;

  reg d;
  reg clk;
  reg rst;
  wire q;

  d_ff DUT (
    .d   (d),
    .clk (clk),
    .rst (rst),
    .q   (q)
  );

  localparam PERIOD = 20;

  initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
  end

  initial $monitor("MONITOR: %4t | clk=%b | rst=%b | d=%b | q=%b", $time, clk, rst, d, q);

  initial begin
  $dumpfile("d_ff_tb.vcd");
    $dumpvars(0, d_ff_tb);
    d = 1'b0;
    rst = 1'b1;
    $display("Time | clk | rst | d | q");
    $display("--------------------------");

    // 1. Initial reset
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b", $time, clk, rst, d, q);

    // 2. Deassert reset, set D=1
    #5;
    rst = 1'b0;
    d = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b", $time, clk, rst, d, q);

    // 3. Store '1', set D=0 for next cycle
    #5;
    d = 1'b0;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b", $time, clk, rst, d, q);

    // 4. Store '0', set D=1 for next cycle
    #5;
    d = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b", $time, clk, rst, d, q);

    // 5. Asynchronous reset
    #5;
    d = 1'b0;
    rst = 1'b1;
    #1;
    $display("%4t | %3b | %3b | %1b | %1b (Asyn. Reset)", $time, clk, rst, d, q);

    // 6. Finish simulation
    # (PERIOD * 2);
    $finish;
  end

endmodule

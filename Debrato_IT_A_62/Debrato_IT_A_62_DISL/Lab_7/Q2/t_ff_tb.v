`timescale 1ns / 1ns
`include "t_ff.v"
module t_ff_tb;

  reg t;
  reg clk;
  reg rst_n;
  wire q;

  t_ff DUT (
    .t       (t),
    .clk     (clk),
    .rst_n   (rst_n),
    .q       (q)
  );

  localparam PERIOD = 20;

  initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
  end

  initial begin
    $dumpfile("t_ff_tb.vcd");
    $dumpvars(0, t_ff_tb);

    $monitor("MONITOR: %4t | clk=%b | rst_n=%b | t=%b | q=%b", $time, clk, rst_n, t, q);

    t = 1'b0;
    rst_n = 1'b0;
    $display("Time | clk | rst_n | t | q");
    $display("----------------------------");

    // 1. Initial reset
    #1;
    $display("%4t | %3b | %5b | %1b | %1b (Asyn. Reset)", $time, clk, rst_n, t, q);

    // 2. Deassert reset (rst_n=1), T=0 (Hold state)
    #5;
    rst_n = 1'b1;
    t = 1'b0;
    @(negedge clk);
    $display("%4t | %3b | %5b | %1b | %1b (T=0, Hold)", $time, clk, rst_n, t, q);

    // 3. Set T=1 (Toggle 0->1)
    #5;
    t = 1'b1;
    @(negedge clk);
    $display("%4t | %3b | %5b | %1b | %1b (T=1, Toggle 0->1)", $time, clk, rst_n, t, q);

    // 4. Set T=1 again (Toggle 1->0)
    #5;
    t = 1'b1;
    @(negedge clk);
    $display("%4t | %3b | %5b | %1b | %1b (T=1, Toggle 1->0)", $time, clk, rst_n, t, q);

    // 5. Set T=0 (Hold state)
    #5;
    t = 1'b0;
    @(negedge clk);
    $display("%4t | %3b | %5b | %1b | %1b (T=0, Hold)", $time, clk, rst_n, t, q);

    // 6. Test another toggle
    #5;
    t = 1'b1;
    @(negedge clk);
    $display("%4t | %3b | %5b | %1b | %1b (T=1, Toggle 0->1)", $time, clk, rst_n, t, q);

    // 7. Finish simulation
    # (PERIOD * 2);
    $finish;
  end

endmodule


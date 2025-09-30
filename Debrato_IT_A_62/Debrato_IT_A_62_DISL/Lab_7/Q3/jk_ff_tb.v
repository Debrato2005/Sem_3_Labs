`timescale 1ns / 1ns
`include "jk_ff.v"
module jk_ff_tb;

  reg j;
  reg k;
  reg clk;
  reg rst;
  wire q;

  jk_ff DUT (
    .j   (j),
    .k   (k),
    .clk (clk),
    .rst (rst),
    .q   (q)
  );

  localparam PERIOD = 20;

  initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
  end

  initial begin
    $dumpfile("jk_ff_tb.vcd");
    $dumpvars(0, jk_ff_tb);

    $monitor("MONITOR: %4t | clk=%b | rst=%b | j=%b | k=%b | q=%b", $time, clk, rst, j, k, q);

    j = 1'b0;
    k = 1'b0;
    rst = 1'b0;
    $display("Time | clk | rst | j | k | q");
    $display("--------------------------------");

    // 1. Initial Hold (J=0, K=0)
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Initial Hold)", $time, clk, rst, j, k, q);

    // 2. Synchronous Reset (rst=1)
    #5;
    rst = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Sync Reset)", $time, clk, rst, j, k, q);

    // 3. Deassert Reset (rst=0)
    #5;
    rst = 1'b0;

    // 4. Test Set (J=1, K=0). q should become 1.
    #5;
    j = 1'b1;
    k = 1'b0;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Set)", $time, clk, rst, j, k, q);

    // 5. Test Hold (J=0, K=0). q should remain 1.
    #5;
    j = 1'b0;
    k = 1'b0;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Hold)", $time, clk, rst, j, k, q);

    // 6. Test Reset (J=0, K=1). q should become 0.
    #5;
    j = 1'b0;
    k = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Reset)", $time, clk, rst, j, k, q);

    // 7. Test Toggle (J=1, K=1). q should toggle 0 -> 1.
    #5;
    j = 1'b1;
    k = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Toggle 0->1)", $time, clk, rst, j, k, q);

    // 8. Test Toggle again (J=1, K=1). q should toggle 1 -> 0.
    #5;
    j = 1'b1;
    k = 1'b1;
    @(posedge clk);
    $display("%4t | %3b | %3b | %1b | %1b | %1b (Toggle 1->0)", $time, clk, rst, j, k, q);

    // 9. Finish simulation
    # (PERIOD * 2);
    $finish;
  end

endmodule


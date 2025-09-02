`timescale 1ns / 1ns
`include "Q3.v"
module Q3_tb;

  reg [15:0] w;
  reg [3:0] s;
  wire f;

  // Instantiate the 16-to-1 mux
  mux16to1 uut (
    .w(w),
    .s(s),
    .f(f)
  );

  integer i;

  initial begin
    $dumpfile("Q3_tb.vcd");
    $dumpvars(0, Q3_tb);

    // Initialize inputs
    w = 16'b0;
    s = 4'b0;
    #10;

    // Test all select lines, setting only one input high at a time to check output
    for (i = 0; i < 16; i = i + 1) begin
      w = 16'b0;
      w[i] = 1'b1;   // Only one input active at a time
      s = i[3:0];    // Select the input
      #20;
      $display("Select = %b, Inputs = %b, Output = %b", s, w, f);
      if (f !== 1'b1) begin
        $display("ERROR: Output mismatch for select %b", s);
      end
    end

    $display("Test complete.");
    $finish;
  end

endmodule


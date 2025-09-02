`timescale 1ns/1ns
`include "Q2.v"  
module mux4to1_tb;
  reg w0, w1, w2, w3;
  reg [1:0] s;
  wire f;

  // Instantiate the 4-to-1 mux
  mux4to1 uut (
    .w0(w0),
    .w1(w1),
    .w2(w2),
    .w3(w3),
    .s(s),
    .f(f)
  );

  initial begin
    $dumpfile("mux4to1_tb.vcd");
    $dumpvars(0, mux4to1_tb);

    // Test all select lines and input combinations
    w0 = 0; w1 = 0; w2 = 0; w3 = 0; s = 2'b00; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    w0 = 0; w1 = 0; w2 = 0; w3 = 1; s = 2'b11; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    w0 = 0; w1 = 0; w2 = 1; w3 = 0; s = 2'b10; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    w0 = 0; w1 = 1; w2 = 0; w3 = 0; s = 2'b01; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    w0 = 1; w1 = 0; w2 = 0; w3 = 0; s = 2'b00; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    w0 = 1; w1 = 1; w2 = 1; w3 = 1; s = 2'b11; #20;
    $display("s=%b, inputs=%b%b%b%b, output=%b", s, w3, w2, w1, w0, f);

    $display("Test complete.");
    $finish;
  end
endmodule


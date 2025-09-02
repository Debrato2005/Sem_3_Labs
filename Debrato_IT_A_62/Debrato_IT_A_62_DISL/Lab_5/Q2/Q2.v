// 2-to-1 Multiplexer using if-else
module mux2to1_if (w0, w1, s, f);
  input w0, w1, s;
  output reg f;

  always @(w0 or w1 or s) begin
    if (s)
      f = w1;
    else
      f = w0;
  end
endmodule

// 4-to-1 Multiplexer using hierarchical 2-to-1 mux modules
module mux4to1 (w0, w1, w2, w3, s, f);
  input w0, w1, w2, w3;
  input [1:0] s;
  output f;

  wire f0, f1;

  // First level: two 2-to-1 muxes
  mux2to1_if mux_low (.w0(w0), .w1(w1), .s(s[0]), .f(f0));
  mux2to1_if mux_high(.w0(w2), .w1(w3), .s(s[0]), .f(f1));

  // Second level: one 2-to-1 mux
  mux2to1_if mux_final(.w0(f0), .w1(f1), .s(s[1]), .f(f));
endmodule


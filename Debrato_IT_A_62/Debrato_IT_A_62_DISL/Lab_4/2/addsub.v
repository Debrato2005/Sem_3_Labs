module addsub (
  mode,       
  x3, x2, x1, x0,
  y3, y2, y1, y0,
  s3, s2, s1, s0,
  carryout
);
  input mode;
  input x3, x2, x1, x0;
  input y3, y2, y1, y0;
  output s3, s2, s1, s0;
  output carryout;

  wire c1, c2, c3;
  wire y0_mod, y1_mod, y2_mod, y3_mod;
  wire carryin;

  assign carryin = mode; 
  

  assign y0_mod = y0 ^ mode;
  assign y1_mod = y1 ^ mode;
  assign y2_mod = y2 ^ mode;
  assign y3_mod = y3 ^ mode;

  fulladd stage0 (carryin, x0, y0_mod, s0, c1);
  fulladd stage1 (c1, x1, y1_mod, s1, c2);
  fulladd stage2 (c2, x2, y2_mod, s2, c3);
  fulladd stage3 (c3, x3, y3_mod, s3, carryout);
endmodule

module fulladd (Cin, x, y, s, Cout);
  input Cin, x, y;
  output s, Cout;

  assign s = x ^ y ^ Cin;
  assign Cout = (x & y) | (x & Cin) | (y & Cin);
endmodule


module fulladd(a, b, cin, sum, cout);
  input a, b, cin;
  output sum, cout;

  assign sum = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (a & cin);
endmodule

module adder4(a3, a2, a1, a0, b3, b2, b1, b0, cin, s3, s2, s1, s0, cout);
  input a3, a2, a1, a0;
  input b3, b2, b1, b0;
  input cin;
  output s3, s2, s1, s0, cout;

  wire c1, c2, c3;

  fulladd fa0(a0, b0, cin, s0, c1);
  fulladd fa1(a1, b1, c1, s1, c2);
  fulladd fa2(a2, b2, c2, s2, c3);
  fulladd fa3(a3, b3, c3, s3, cout);
endmodule

module bcdadd(
  a3, a2, a1, a0,
  b3, b2, b1, b0,
  cin,
  s3, s2, s1, s0,
  cout
);
  input a3, a2, a1, a0;
  input b3, b2, b1, b0;
  input cin;
  output s3, s2, s1, s0, cout;

  wire t_s3, t_s2, t_s1, t_s0, t_cout;
  wire corr_needed;
  wire c_s3, c_s2, c_s1, c_s0, c_cout;

  // First addition
  adder4 add1(a3, a2, a1, a0, b3, b2, b1, b0, cin, t_s3, t_s2, t_s1, t_s0, t_cout);

  // Correction condition (sum > 9 or carry out)
  assign corr_needed = t_cout | (t_s3 & (t_s2 | t_s1));

  // Add 6 if correction needed
  adder4 add2(
    t_s3, t_s2, t_s1, t_s0,
    corr_needed, 1'b1, 1'b1, 1'b0,
    1'b0,
    c_s3, c_s2, c_s1, c_s0, c_cout
  );

  // Final output
  assign s3 = c_s3;
  assign s2 = c_s2;
  assign s1 = c_s1;
  assign s0 = c_s0;
  assign cout = c_cout;
endmodule


module multip (a1, a0, b1, b0, p3, p2, p1, p0);
  input a1, a0, b1, b0;
  output p3, p2, p1, p0;
  wire s1, c1, s2, c2;
  wire a1b0, a0b1, a1b1;

  assign p0 = a0 & b0;

  assign a1b0 = a1 & b0;
  assign a0b1 = a0 & b1;
  halfadder ha1 (a1b0, a0b1, s1, c1);

  assign p1 = s1;

  assign a1b1 = a1 & b1;
  halfadder ha2 (c1, a1b1, s2, c2);

  assign p2 = s2;
  assign p3 = c2;
endmodule

module halfadder (a, b, sum, carry);
  input a, b;
  output sum, carry;

  assign sum = a ^ b;
  assign carry = a & b;
endmodule


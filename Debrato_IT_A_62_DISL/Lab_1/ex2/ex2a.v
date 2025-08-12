module ex2a(a, b, c, d, f,g);
input a,b,c,d;
output f,g;
nand(m,a,b);
xor (f,m,d,c);
nor (g,c,d,b);
endmodule

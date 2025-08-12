module ex1(a, b, c, d, f);
input a,b,c,d;
output f;
nand(g,a,a);
nand(h,b,b);
nand(i,c,c);
nand(j,g,i);
nand(k,g,d);
nand(l,b,d);
nand(m,b,i);
nand(f,j,k,l,m);
endmodule

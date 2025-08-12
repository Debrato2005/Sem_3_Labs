module ex1(x1, x2, x3, x4, f);
input x1, x2, x3, x4;
output f;
and (a,x1,x2);
or (b,a,x3);
not (c,b);
and(d,b,x4);
or (e,b,x4)
and (f,d,e);
endmodule

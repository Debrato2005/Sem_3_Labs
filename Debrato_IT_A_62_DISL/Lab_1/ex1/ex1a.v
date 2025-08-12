module ex1a(a, b, c, d, f);
input a,b,c,d;
output f;
and (v,a,b);
or (w,v,c);
not (x,w);
and(y,x,d);
or (z,w,d);
and (f,y,z);
endmodule

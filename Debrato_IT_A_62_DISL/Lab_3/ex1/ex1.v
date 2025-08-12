module ex1(a, b, c, d, f);
input a,b,c,d;
output f;
assign f=(~a&~c)|(~a&d)|(b&~c)|(b&d);
endmodule

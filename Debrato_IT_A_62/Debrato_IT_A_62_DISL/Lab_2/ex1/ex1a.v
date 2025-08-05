module ex1a(a, b, c, d, f);
input a,b,c,d;
output f;
assign f=(~a&b)|(b&~c&~d)|(c&d)|(~b&c);
endmodule

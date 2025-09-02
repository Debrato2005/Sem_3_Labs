module comparator4bit(a, b, equal, greater, less);
  input [3:0] a, b;
  output equal, greater, less;
  reg equal, greater, less;

  always @(a or b) begin
    if (a == b) begin
      equal = 1; greater = 0; less = 0;
    end else if (a > b) begin
      equal = 0; greater = 1; less = 0;
    end else begin
      equal = 0; greater = 0; less = 1;
    end
  end
endmodule


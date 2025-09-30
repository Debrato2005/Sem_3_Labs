module t_ff (
  input wire t,
  input wire clk,
  input wire rst_n,
  output reg q
);

  always @(negedge clk or negedge rst_n) begin
    if (!rst_n) begin
      q <= 1'b0;
    end else if (t) begin
      q <= ~q;
    end
  end

endmodule


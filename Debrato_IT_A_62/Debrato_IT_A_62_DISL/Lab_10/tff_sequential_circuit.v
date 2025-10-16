module tff_sequential_circuit(
    output q1_out,
    output q0_out,
    input x,
    input clk,
    input rst
);

    reg q1, q0;
    wire T1, T0;

    assign T1 = q0 & (x ^ q1);
    assign T0 = (~x & ~q0) | (~q1 & q0);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            q1 <= 1'b0;
            q0 <= 1'b0;
        end else begin
            q1 <= q1 ^ T1;
            q0 <= q0 ^ T0;
        end
    end

    assign q1_out = q1;
    assign q0_out = q0;

endmodule

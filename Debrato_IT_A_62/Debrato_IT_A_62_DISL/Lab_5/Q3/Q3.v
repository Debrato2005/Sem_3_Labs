`timescale 1ns / 1ns

// 4-to-1 multiplexer using conditional operator
module mux4to1_cond (
    input wire [3:0] w,   // 4 inputs: w[0], w[1], w[2], w[3]
    input wire [1:0] s,   // 2-bit select
    output wire f
);
    assign f = (s == 2'b00) ? w[0] :
               (s == 2'b01) ? w[1] :
               (s == 2'b10) ? w[2] :
                              w[3];
endmodule


// 16-to-1 multiplexer using hierarchical 4-to-1 mux modules
module mux16to1 (
    input wire [15:0] w,    // 16 inputs: w[0] to w[15]
    input wire [3:0] s,     // 4-bit select
    output wire f
);

    wire [3:0] mux_out;

    // Four 4-to-1 muxes select within groups of 4 inputs using s[1:0]
    mux4to1_cond mux0 (.w(w[3:0]),   .s(s[1:0]), .f(mux_out[0]));
    mux4to1_cond mux1 (.w(w[7:4]),   .s(s[1:0]), .f(mux_out[1]));
    mux4to1_cond mux2 (.w(w[11:8]),  .s(s[1:0]), .f(mux_out[2]));
    mux4to1_cond mux3 (.w(w[15:12]), .s(s[1:0]), .f(mux_out[3]));

    // Final 4-to-1 mux selects among the intermediate outputs using s[3:2]
    mux4to1_cond mux_final (.w(mux_out), .s(s[3:2]), .f(f));

endmodule


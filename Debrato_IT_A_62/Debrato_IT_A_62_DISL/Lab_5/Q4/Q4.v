`timescale 1ns / 1ns

// 2-to-1 multiplexer using conditional operator (used for hierarchy)
module mux2to1 (
    input wire w0, w1,
    input wire s,
    output reg f
);
    always @(*) begin
        if (s)
            f = w1;
        else
            f = w0;
    end
endmodule


// 8-to-1 multiplexer using case statement
module mux8to1_case (
    input wire [7:0] w,
    input wire [2:0] s,
    output reg f
);
    always @(*) begin
        case (s)
            3'b000: f = w[0];
            3'b001: f = w[1];
            3'b010: f = w[2];
            3'b011: f = w[3];
            3'b100: f = w[4];
            3'b101: f = w[5];
            3'b110: f = w[6];
            3'b111: f = w[7];
            default: f = 1'b0;
        endcase
    end
endmodule


// 16-to-1 multiplexer using hierarchical mux8to1 and mux2to1
module mux16to1 (
    input wire [15:0] w,
    input wire [3:0] s,
    output wire f
);

    wire f0, f1;

    // Two 8-to-1 muxes for lower-level selection
    mux8to1_case mux_low (.w(w[7:0]),    .s(s[2:0]), .f(f0));
    mux8to1_case mux_high(.w(w[15:8]),   .s(s[2:0]), .f(f1));

    // Final 2-to-1 mux to select between the two outputs using s[3]
    mux2to1 mux_final (.w0(f0), .w1(f1), .s(s[3]), .f(f));

endmodule


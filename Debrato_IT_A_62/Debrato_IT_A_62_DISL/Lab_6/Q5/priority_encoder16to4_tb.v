`timescale 1ns/1ps
`include "priority_encoder16to4.v"
module priority_encoder16to4_tb;

reg [15:0] in;
wire [3:0] out;
wire valid;

priority_encoder16to4 DUT(
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $dumpfile("priority_encoder16to4_tb.vcd");
    $dumpvars(0, priority_encoder16to4_tb);

    in = 16'b0000000000000000; #10;
    in = 16'b0000000000000001; #10;
    in = 16'b0000000000000010; #10;
    in = 16'b0000000000010000; #10;
    in = 16'b1000000000000000; #10;
    in = 16'b1010000000000000; #10;
    in = 16'b1111111111111111; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t in=%b out=%b valid=%b", $time, in, out, valid);
end

endmodule


`timescale 1ns/1ps
`include "priority_encoder4to2.v"
module priority_encoder4to2_tb;

reg [3:0] in;
wire [1:0] out;
wire valid;

priority_encoder4to2 DUT (
    .in(in),
    .out(out),
    .valid(valid)
);

initial begin
    $dumpfile("priority_encoder4to2_tb.vcd");
    $dumpvars(0, priority_encoder4to2_tb);

    in = 4'b0000; #10;
    in = 4'b0001; #10;
    in = 4'b0010; #10;
    in = 4'b0011; #10;
    in = 4'b0100; #10;
    in = 4'b0101; #10;
    in = 4'b0111; #10;
    in = 4'b1000; #10;
    in = 4'b1010; #10;
    in = 4'b1111; #10;

    $finish;
end

initial begin
    $monitor("Time=%0t in=%b out=%b valid=%b", $time, in, out, valid);
end

endmodule


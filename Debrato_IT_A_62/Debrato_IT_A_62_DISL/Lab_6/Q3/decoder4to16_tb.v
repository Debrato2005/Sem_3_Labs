`timescale 1ns/1ns
`include "decoder4to16.v"
module decoder4to16_tb;

reg en;
reg [3:0] in;
wire [15:0] y;
 
decoder4to16 DUT (
    .en(en),
    .in(in),
    .y(y)
);

initial begin
    $dumpfile("decoder4to16_tb.vcd");
    $dumpvars(0, decoder4to16_tb);

    en = 0;
    in = 4'b0000;
    #10;
 
    en = 1;
    for (integer i = 0; i < 16; i = i + 1) begin
        in = i;
        #10;
    end
 
    en = 0;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t | en=%b | in=%b | y=%b", $time, en, in, y);
end

endmodule


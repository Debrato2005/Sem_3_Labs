`timescale 1ns/1ns
`include "decoder3to8.v"

module decoder3to8_tb;

reg en;
reg [2:0] in;
wire [7:0] y;
 
decoder3to8 uut (
    .en(en),
    .in(in),
    .y(y)
);

initial begin 
    $dumpfile("decoder3to8_tb.vcd");
    $dumpvars(0, decoder3to8_tb);

    $display("Time | en in  | y");
    $display("------------------------");
 
    en = 0;
    in = 3'b000;
    #5;
    repeat (8) begin
        $display("%0t | %b  %b | %b", $time, en, in, y);
        in = in + 1;
        #5;
    end
 
    en = 1;
    in = 3'b000;
    #5;
    repeat (8) begin
        $display("%0t | %b  %b | %b", $time, en, in, y);
        in = in + 1;
        #5;
    end

    $finish;
end

endmodule


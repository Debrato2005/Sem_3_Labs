`timescale 1ns / 1ps
`include "and_gate.v"

module and_gate_tb;

    reg   tb_a;
    reg   tb_b;
    wire  tb_y;

    and_gate DUT (
        .a (tb_a),
        .b (tb_b),
        .y (tb_y)
    );

    initial begin
        tb_a = 0;
        tb_b = 0;

        $monitor("Time=%0t | A=%b, B=%b | Y=%b", $time, tb_a, tb_b, tb_y);

        #10;

        tb_b = 1;
        #10;

        tb_a = 1;
        tb_b = 0;
        #10;

        tb_b = 1;
        #10;

        $finish;
    end

    initial begin
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);
    end

endmodule

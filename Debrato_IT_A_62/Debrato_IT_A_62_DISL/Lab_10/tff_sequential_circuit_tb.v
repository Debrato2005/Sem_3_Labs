`timescale 1ns / 1ps
`include "tff_sequential_circuit.v"

module tff_sequential_circuit_tb;

    reg x;
    reg clk;
    reg rst;

    wire q1_out;
    wire q0_out;

    tff_sequential_circuit uut (
        .q1_out(q1_out),
        .q0_out(q0_out),
        .x(x),
        .clk(clk),
        .rst(rst)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("tff_circuit.vcd");
        $dumpvars(0, tff_sequential_circuit_tb);

        rst = 1;
        x = 0;
        #15;
        rst = 0;

        #10; 
        x = 1;
        #10; 
        x = 1;
        #10; 
        x = 0;
        #10; 
        x = 0;
        #10; 
        x = 1;
        #10; 
        x = 1;
        #20;
        
        $finish;
    end

endmodule

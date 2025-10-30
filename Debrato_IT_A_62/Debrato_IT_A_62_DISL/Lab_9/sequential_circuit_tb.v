`timescale 1ns / 1ps
`include "sequential_circuit.v"

module sequential_circuit_tb;

    // Inputs
    reg E;
    reg x;
    reg clk;
    reg rst;

    // Outputs
    wire A;
    wire B;

    // Instantiate the sequential circuit
    sequential_circuit uut (
        .A(A),
        .B(B),
        .E(E),
        .x(x),
        .clk(clk),
        .rst(rst)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Dump waves
        $dumpfile("sequential_circuit.vcd");
        $dumpvars(0, sequential_circuit_tb);

        // Initial values
        E = 0;
        x = 0;
        rst = 1;
        #15 rst = 0;

        // Test Case 1: E = 0 (No state change)
        #20 E = 0;
        #20 x = 1;

        // Test Case 2: E = 1, x = 1 (00 -> 01 -> 10 -> 11 -> 00)
        #20 E = 1;
              x = 1;
        #80; // Let it run for a few cycles

        // Test Case 3: E = 1, x = 0 (00 -> 11 -> 10 -> 01 -> 00)
        rst = 1;
        #15 rst = 0;
        #5 E = 1;
           x = 0;
        #80; // Let it run for a few cycles

        $finish;
    end

endmodule

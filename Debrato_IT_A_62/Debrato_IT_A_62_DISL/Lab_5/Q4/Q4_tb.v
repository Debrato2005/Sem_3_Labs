`timescale 1ns / 1ns

`include "Q4.v"  // Include the mux modules

module Q4_tb;

    reg [15:0] w;
    reg [3:0] s;
    wire f;

    mux16to1 uut (
        .w(w),
        .s(s),
        .f(f)
    );

    integer i;

    initial begin
        $dumpfile("Q4_tb.vcd");
        $dumpvars(0, Q4_tb);

        w = 16'b0;
        s = 4'b0;
        #10;

        for (i = 0; i < 16; i = i + 1) begin
            w = 16'b0;
            w[i] = 1'b1;
            s = i[3:0];
            #20;
            $display("Select = %b, Input = %b, Output = %b", s, w, f);
            if (f !== 1'b1) begin
                $display("ERROR: Output mismatch at select %b", s);
            end
        end

        $display("Test complete.");
        $finish;
    end
endmodule


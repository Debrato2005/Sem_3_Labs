module sequential_circuit(
    output reg A,
    output reg B,
    input E,
    input x,
    input clk,
    input rst
);

    // Internal registers for the current state
    reg current_A, current_B;

    // At the positive edge of the clock or reset
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the flip-flops to 00
            current_A <= 1'b0;
            current_B <= 1'b0;
        end else begin
            // When E is 1, the state transitions occur
            if (E) begin
                // State transitions when x is 1
                if (x) begin
                    case ({current_A, current_B})
                        2'b00: {current_A, current_B} <= 2'b01;
                        2'b01: {current_A, current_B} <= 2'b10;
                        2'b10: {current_A, current_B} <= 2'b11;
                        2'b11: {current_A, current_B} <= 2'b00;
                        default: {current_A, current_B} <= 2'b00;
                    endcase
                // State transitions when x is 0
                end else begin
                    case ({current_A, current_B})
                        2'b00: {current_A, current_B} <= 2'b11;
                        2'b11: {current_A, current_B} <= 2'b10;
                        2'b10: {current_A, current_B} <= 2'b01;
                        2'b01: {current_A, current_B} <= 2'b00;
                        default: {current_A, current_B} <= 2'b00;
                    endcase
                end
            end
            // If E is 0, the state remains the same
            else begin
                current_A <= current_A;
                current_B <= current_B;
            end
        end
    end

    // Assign internal state to outputs
    assign A = current_A;
    assign B = current_B;

endmodule

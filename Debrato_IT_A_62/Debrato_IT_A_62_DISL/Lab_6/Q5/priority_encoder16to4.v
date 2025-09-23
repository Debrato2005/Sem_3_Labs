module priority_encoder16to4(
    input wire [15:0] in,
    output reg [3:0] out,
    output reg valid
);

integer i;

always @(*) begin
    valid = 0;
    out = 4'b0000;
    for (i = 15; i >= 0; i = i - 1) begin
        if (in[i]) begin
            out = i[3:0];
            valid = 1;
        end
    end
end

endmodule


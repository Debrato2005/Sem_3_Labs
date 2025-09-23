module decoder3to8 (
    input wire en,            
    input wire [2:0] in,      
    output reg [7:0] y        
);

integer i;

always @(*) begin
    if (en) begin
        for (i = 0; i < 8; i = i + 1) begin
            if (i == in)
                y[i] = 1'b1;
            else
                y[i] = 1'b0;
        end
    end 
    else begin
        y = 8'b00000000; 
    end
end

endmodule

module decoder2to4 (
    input wire en,           
    input wire [1:0] in,      
    output reg [3:0] y     
);

always @(*) begin
    if (en) begin
        case (in)
            2'b00: y = 4'b1110;  
            2'b01: y = 4'b1101;  
            2'b10: y = 4'b1011;  
            2'b11: y = 4'b0111; 
            default: y = 4'b1111; 
        endcase
    end
    else begin
        y = 4'b1111; 
    end
end

endmodule


module decoder4to16 (
    input wire en,            
    input wire [3:0] in,      
    output wire [15:0] y     
);

wire [3:0] y0, y1, y2, y3; 
wire en0 = en & (in[3:2] == 2'b00);
wire en1 = en & (in[3:2] == 2'b01);
wire en2 = en & (in[3:2] == 2'b10);
wire en3 = en & (in[3:2] == 2'b11);

decoder2to4 dec0 (.en(en0), .in(in[1:0]), .y(y0));
decoder2to4 dec1 (.en(en1), .in(in[1:0]), .y(y1));
decoder2to4 dec2 (.en(en2), .in(in[1:0]), .y(y2));
decoder2to4 dec3 (.en(en3), .in(in[1:0]), .y(y3));

assign y = {y3, y2, y1, y0};

endmodule


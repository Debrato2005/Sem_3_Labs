module decoder2to4 (
    input wire en,          
    input wire [1:0] in,    
    output reg [3:0] y    
);

always @(*) begin
    if (en) begin
        if (in == 2'b00)
            y = 4'b0001;
        else if (in == 2'b01)
            y = 4'b0010;
        else if (in == 2'b10)
            y = 4'b0100;
        else
            y = 4'b1000;
    end 
    else begin
        y = 4'b0000; 
    end
end
endmodule

module decoder3to8 (
    input wire en,           
    input wire [2:0] in,     
    output wire [7:0] y      
);

wire [3:0] y_low, y_high; 

decoder2to4 dec_low (
    .en(en & ~in[2]),      
    .in(in[1:0]),
    .y(y_low)
);

 
decoder2to4 dec_high (
    .en(en & in[2]),          
    .in(in[1:0]),
    .y(y_high)
);

assign y = {y_high, y_low};
endmodule


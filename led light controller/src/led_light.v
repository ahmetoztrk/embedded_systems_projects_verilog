module led(
    output reg [1:3] s,
    input b1,
    input b2);
    always @(b1, b2) begin
        if(!b1 && !b2)
            s = 3'b011;
        if(b1 && !b2)
            s = 3'b101;
        if(!b1 && b2)
            s = 3'b110;
        if(b1 && b2)
            s = 3'b000;
    end
endmodule
        

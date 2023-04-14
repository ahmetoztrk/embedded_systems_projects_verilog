module light_counter(
    input sys_clk, // clk input
    input sys_rst_n, // reset input
    output reg [2:0] led // 110 G, 101 R, 011 B
);

reg [31:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        counter <= 32'd0;
    else if (counter < 32'd2400_0000) //1s delay
        counter <= counter + 1;
    else
        counter <= 32'd0;
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n)
        led <= 3'b110;
    else if (counter == 32'd2400_0000) //1s delay
        led[2:0] <= {led[1:0], led[2]};
    else
        led <= led;
end

endmodule
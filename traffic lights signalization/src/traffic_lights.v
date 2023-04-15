module TRAFIC_LIGHTS_SIGNALIZATION (
    output reg [2:0] led,
    input sys_clk, //clock input
    input sys_rst_n //reset input
);

    reg [31:0] counter;

    wire [31:0] red_light_time = 32'd24_000_000 * 10; //10 seconds red light
    wire [31:0] yellow_light_time = 32'd24_000_000 * 2; //2 seconds yellow light
    wire [31:0] green_light_time = 32'd24_000_000 * 5; // 5 seconds green light

    wire [31:0] after_red_time = 32'd24_000_000 * 10;
    wire [31:0] after_yellow_time = 32'd24_000_000 * 12;
    wire [31:0] full_time = 32'd24_000_000 * 17;


    always @( posedge sys_clk or negedge sys_rst_n ) begin
        if(!sys_rst_n) counter <= 32'b0;
        else if (counter < full_time) counter <= counter + 1;
        else counter <= 32'b0;
    end

    always @( posedge sys_clk or negedge sys_rst_n ) begin
        if(!sys_rst_n) led <= 3'b110; // red light
        else if(counter >= full_time)    led <= 3'b110; //red light
        else if(counter == after_red_time)   led <= 3'b010; // yellow light ==> yellow = red + green
        else if(counter == after_yellow_time) led <= 3'b011; // green light
    end
    
endmodule
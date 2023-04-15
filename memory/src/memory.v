module memory
# (
parameter ADDR_WIDTH = 4,
parameter DATA_WIDTH = 16,
parameter DEPTH = 16
)

(
    input clk,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] data,
    output reg [DATA_WIDTH-1:0] read_data,
    input cs, //chip enabled
    input we, //write
    input oe  //output
);

reg [DATA_WIDTH-1:0] tmp_data;
reg [DATA_WIDTH-1:0] mem [0: DEPTH-1];

always @ (posedge clk) begin
    if (cs & we)
        mem[addr] <= data;
end

always @ (negedge clk) begin
    if (cs & oe)
        read_data <= mem[addr];
end

endmodule
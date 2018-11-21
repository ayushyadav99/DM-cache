module cache(address, hit_miss, out, clk);
    // reg [31:0]cache[256*16-1:0]
    input [31:0]address;
    input clk;
    output hit_miss;
    output [31:0]out;
    reg [31:0][15:0]cache[255:0];
    wire [3:0]block_offset = address[3:0];
    wire [7:0]index = address[11:4];
    wire [19:0]tag = address[31:12];
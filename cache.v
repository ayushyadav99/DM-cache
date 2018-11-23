module cache(address, hit_miss, out, clk);
    input [31:0]address;
    input clk;
    output reg hit_miss;                    //1 if hit, 0 if miss
    output reg [31:0]out;
    
    reg [31:0][15:0]cache[255:0];
    reg [19:0]tag_reg[255:0];               //for cache
    reg [31:0]memory[299999:0];
    initial begin
        $readmemb("memory.txt",memory);
    end

    wire [3:0]block_offset = address[3:0];
    wire [7:0]index = address[11:4];
    wire [19:0]tag = address[31:12];
    integer i;
    wire [31:0]block_start = {address[31:4],4'b0000};

    always @ (posedge clk)
        begin
            if (tag_reg[index] == tag)
                begin
                    hit_miss <= 1;
                end
            else
                begin
                    hit_miss <= 0;
                    for (i = 0; i < 16; i++)
                        begin
                            cache[index][i] <= memory[block_start+i];
                        end
                    tag_reg[index] <= tag;
                end
            out <= cache[index][block_offset];
        end



endmodule
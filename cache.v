module comparator(address, tag_reg, flag, clk);
    input[31:0] address;
    input clk;
    input [19:0]tag_reg;
    output reg flag;
    always @ (posedge clk)
            begin
            if (tag_reg == tag)
                begin
                    flag =1;
                end
            else
                flag = 0;
            end
endmodule

module cache(address, hit_miss, out, clk);
    // reg [31:0]cache[256*16-1:0]
    input [31:0]address;
    input clk;
    output reg hit_miss;                    //1 if hit, 0 if miss
    output reg [31:0]out;
    
    reg [31:0][15:0]cache[255:0];
    reg [19:0]tag_reg[255:0];               //for cache
    reg [31:0]memory[29999:0];
    initial begin
        $readmemb("memory.txt",memory);
    end
    // $display("%b\n", memory[0]);

    reg [3:0]block_offset = address[3:0];
    reg [7:0]index = address[11:4];
    reg [19:0]tag = address[31:12];

    always @ (posedge clk)
        begin
            if (tag_reg[index] == tag)
                begin
                    hit_miss <= 1;
                    out <= cache[index][block_offset];
                end
            else
                begin
                    hit_miss = 0;
                end
        end



endmodule

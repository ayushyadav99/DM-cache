module cache_tb();
    reg [31:0]address;
    reg clk;
    wire [31:0]out;
    wire hit_miss;
    reg [31:0]instructions[481043:0];
    initial begin
        $readmemb("gzip.txt",instructions);
    end
    integer i;
    integer hits;
    // integer miss;

    cache uut(address, hit_miss, out, clk);

    always
        begin 
            clk = 1; #5;
            clk = 0; #5;
        end
    
    always  
        begin
            $dumpfile("cache.vcd");
            $dumpvars(0,cache_tb);

            hits = 0;
            // address = 32'b00000000000000000000000000010100; #1;
            // hits = hits + uut.hit_miss;
            // address = 32'b00000000000000000000000000010100; #1;
            // hits = hits + uut.hit_miss; #30;
            // address = 32'b00000000000000000000001000010110; #1;
            // hits = hits + uut.hit_miss; #30;
            // address = 32'b00000000000000000000000000010110; #1;
            // hits = hits + uut.hit_miss; #30;
            // address = 32'b00000000000000000000001000010111; #1;
            // hits = hits + uut.hit_miss; #30;
            address = instructions[0]; #8
            hits = hits + uut.hit_miss; #1;
            for (i = 1; i < 481044; i = i + 1)
                begin
                    address = instructions[i]; #9;
                    hits <= hits + uut.hit_miss; #1;
                end
            // $display("%d", hits);
            #100;
            $finish;
        end
endmodule




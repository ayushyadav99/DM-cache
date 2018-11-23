module cache_tb();
    reg [31:0]address;
    reg clk;
    wire [31:0]out;
    wire hit_miss;

    cache uut(address, hit_miss, out, clk);

    always
        begin 
            clk = 1; #3;
            clk = 0; #3;
        end
    
    always  
        begin
            $dumpfile("cache.vcd");
            $dumpvars(0,cache_tb);

            address = 32'b00000000000000000000000000010100; #30;
            address = 32'b00000000000000000000000000010100; #30;
            address = 32'b00000000000000000000001000010110; #30;
            address = 32'b00000000000000000000000000010110; #30;
            address = 32'b00000000000000000000001000010111; #30;
            #100;
            $finish;
        end
endmodule




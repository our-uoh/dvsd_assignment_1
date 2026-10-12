`timescale 1ns / 1ps
module tb;
    reg clk, rst_n, en;
    wire [3:0] count;
    wire wrapped;
    bcd_counter dut (.clk(clk), .rst_n(rst_n), .en(en), .count(count), .wrapped(wrapped));

    initial clk = 0;
    always #5 clk = ~clk;

    integer i;
    initial begin
        rst_n = 0; en = 0;
        repeat (3) @(negedge clk);
        rst_n = 1; en = 1;
        for (i = 0; i < 26; i = i + 1) begin
            @(negedge clk);
            $display("cycle=%0d  count=%b  wrapped=%b", i, count, wrapped);
        end
        $finish;
    end
endmodule

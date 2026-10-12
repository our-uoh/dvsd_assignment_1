`timescale 1ns / 1ps
module sync_tb();

    reg clk, d;
    wire q;
    sync_pipe dut (.clk(clk), .d(d), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    integer i;
    reg [11:0] pattern;
    initial begin
        pattern = 12'b0011_0101_1100;
        d = 0;
        for (i = 0; i < 16; i = i + 1) begin
            @(negedge clk);
            d = (i < 12) ? pattern[11 - i] : 1'b0;
            @(posedge clk);
            #1 $display("edge=%0d  d=%b  q=%b", i, d, q);
        end
        $finish;
    end
endmodule

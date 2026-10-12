
`timescale 1ns/1ps
module tb;
    reg  [3:0] a, b;
    reg  [1:0] op;
    wire [4:0] y;
    mini_alu dut (.a(a), .b(b), .op(op), .y(y));

    task apply;
        input [3:0] ta, tb_;
        input [1:0] top;
        begin
            a = ta; b = tb_; op = top;
            #10;
            $display("t=%0t  op=%b a=%0d b=%0d  y=%0d", $time, op, a, b, y);
        end
    endtask

    initial begin
        a = 0; b = 0; op = 0;
        #10;
        apply(4'd3,  4'd4,  2'b00);
        apply(4'd3,  4'd5,  2'b00);
        apply(4'd9,  4'd5,  2'b01);
        apply(4'd9,  4'd2,  2'b01);
        apply(4'd12, 4'd10, 2'b10);
        apply(4'd12, 4'd3,  2'b10);
        apply(4'd5,  4'd2,  2'b11);
        apply(4'd5,  4'd10, 2'b11);
        $finish;
    end
endmodule

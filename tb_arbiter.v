`timescale 1ns / 1ps

module tb_arbiter();

    reg  [3:0] req;
    wire [3:0] grant;
    prio_arb dut (.req(req), .grant(grant));

    integer i;
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            req = i[3:0];
            #10;
            $display("req=%b  grant=%b", req, grant);
        end
        $finish;
    end
endmodule


`timescale 1ns / 1ps
// Case 4 : prio_arb
// 4-request fixed-priority arbiter. Request 0 has the highest priority.
module prio_arb(
    input [3:0] req,
    output reg [3:0] grant
);
    always @(*) begin
        casez (req) // synopsys parallel_case
            4'b???1: grant = 4'b0001;
            4'b??1?: grant = 4'b0010;
            4'b?1??: grant = 4'b0100;
            4'b1???: grant = 4'b1000;
            default: grant = 4'b0000;
        endcase
    end
endmodule

module sync_pipe (
    input      clk,
    input      d,
    output reg q
);
    reg meta;
// replaced blocking with non blocking
    always @(posedge clk) begin
        meta <= d;
        q    <= meta;
    end
endmodule
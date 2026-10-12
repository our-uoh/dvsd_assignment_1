
module bcd_counter (
    input clk,
    input rst_n,
    input en,
    output reg [3:0]count,
    output reg wrapped
);

    always@(posedge clk) begin
        if(!rst_n) begin
            count<= 4'd0;
            wrapped <= 1'b0;
        end
        else begin
            wrapped <= 1'b0;

            if (en) begin
                if (count == 4'd9) begin
                    count   <= 4'd0;
                    wrapped <= 1'b1;
                end
                else begin
                    count <= count + 4'd1;
                end
            end
        end
    end

endmodule

// In earlier version, the synthesis waveform was throwing an error
// hence we have declared wrapped as a synthesis

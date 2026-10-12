module mini_alu(
    input      [3:0] a,
    input      [3:0] b,
    input      [1:0] op,
    output reg [4:0] y
);

//in earlier code if b was changing the case selection was not changing and hence giving some errors.
//The code given now is correct i.e we need to add the variable b in always block.
    always @(a or b or op) begin
        case (op)
            2'b00:   y = {1'b0, a} + {1'b0, b};
            2'b01:   y = {1'b0, a} - {1'b0, b};
            2'b10:   y = {1'b0, a & b};
            default: y = {1'b0, a | b};
        endcase
    end
endmodule
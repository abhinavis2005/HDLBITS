module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1;
    wire [15:0] sum2;
    wire carry;
    add16 inst1(a[15:0], b[15:0], 1'b0, sum1, carry);
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(carry), .sum(sum2));
    assign sum = {sum2, sum1};

endmodule

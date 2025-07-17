module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b1;
    wire [31:0] sub1 = {32{sub}};
    assign b1 = (b ^ sub1);
    wire [15:0] sum1, sum2;
    wire carry;
    add16 inst1(.a(a[15:0]), .b(b1[15:0]), .cin(sub), .sum(sum1), .cout(carry));
    add16 inst2(.a(a[31:16]), .b(b1[31:16]), .cin(carry), .sum(sum2));
    assign sum = {sum2, sum1};
             

endmodule


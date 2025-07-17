module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire [15:0] sum1, sum2, sum3;
    wire carry;
    add16 inst1(.a(a[15:0]), .b(b[15:0]), .cin(0), .sum(sum1), .cout(carry));
    add16 inst2(.a(a[31:16]), .b(b[31:16]), .cin(0), .sum(sum2));
    add16 inst3(.a(a[31:16]), .b(b[31:16]), .cin(1), .sum(sum3));
    
    always @ (*) begin
        case (carry)
            0: sum = {sum2, sum1};
            1: sum = {sum3, sum1};
        endcase    
    end
    
endmodule


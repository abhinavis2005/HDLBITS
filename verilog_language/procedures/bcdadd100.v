module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    genvar i;
    wire carry[99:0];
    bcd_fadd first(a[3:0], b[3:0], cin, carry[0], sum[3:0]); 
    generate
        for (i = 1 ; i<100; i = i+1) begin: gen_fa
            bcd_fadd mine(a[i*4+3:i*4], b[i*4+3:i*4], carry[i-1], carry[i], sum[i*4+3: i*4]);
        end
    endgenerate
    assign cout = carry[99];
endmodule


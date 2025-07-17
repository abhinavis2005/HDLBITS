module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    
    reg [4:0] carries;
    assign carries[0] = cin;
    genvar i;
    generate
        for (i = 0; i < 4; i = i+1) begin: adders
            bcd_fadd adder(a[i*4+3: i*4], b[i*4+3: i*4], carries[i], carries[i+1], sum[i*4+3:i*4]);
        end
    endgenerate
    assign cout = carries[4];
            
endmodule


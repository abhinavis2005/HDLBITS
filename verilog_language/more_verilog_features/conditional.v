module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);//
	
    wire [7:0] intermediate_result1;
    assign intermediate_result1 = (a<=b ? a: b);
    wire [7:0] ir2;
    assign ir2 = (intermediate_result1<=c ? intermediate_result1 : c);
    wire [7:0] ir3;
    assign min = (ir2 <= d ? ir2: d);
    
    
	
endmodule


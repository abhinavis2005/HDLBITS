module top_module (
    input clk,
    input d,
    output q
);
    reg a, b;
    always @ (posedge clk) begin
    	a <= d ^ b;
	end
    always @ (negedge clk) begin
        b <= d ^ a;
    end
    assign q = a ^ b;
endmodule


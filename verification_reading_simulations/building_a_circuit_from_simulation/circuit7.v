module top_module (
    input clk,
    input a,
    output q );
	
    always @ (posedge clk) begin
        state_machine <= a;
        q <= ~a;
    end
endmodule


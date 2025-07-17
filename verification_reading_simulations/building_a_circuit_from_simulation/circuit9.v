module top_module (
    input clk,
    input a,
    output [3:0] q );
	
    always @ (posedge clk) begin
        if (!a) begin
            if (q==6)
                q <= 0;
            else
                q <= q + 1;
            
        end
        else 
            q <= 4;
    end
endmodule


module top_module (
    input clk,
    input reset,
    output [9:0] q);
    always @ (posedge clk) begin
        if (reset) begin
            q <= 0;
        end
        else begin
            if (q == 999)
                q <= 0;
            else
                q <= q + 1;
        end
    end
endmodule


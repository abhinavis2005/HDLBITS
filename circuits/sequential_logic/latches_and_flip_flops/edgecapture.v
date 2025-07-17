module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] state;
    always @ (posedge clk) begin
        if (reset) begin
            state <= in;
			out <= 0;
        end
        else begin
            state <= in;
            out <= out | (state&~in);
        end
    end

endmodule


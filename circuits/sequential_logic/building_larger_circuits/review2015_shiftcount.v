// question is wrong? data appears to be shifted in LSB first;
module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    always @ (posedge clk) begin
        if (count_ena) begin
            q <= q - 1;
        end
        else if (shift_ena) begin
            q <= {q[2:0], data};
        end
    end

endmodule


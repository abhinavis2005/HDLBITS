module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    reg [3:0] count;
    always @ (posedge clk) begin
        if (reset)
            count <= 0;
        else begin
            if (count == 9) 
                count <= 0;
            else
                count <= count + 1;
        end
    end
    assign q = count;
endmodule


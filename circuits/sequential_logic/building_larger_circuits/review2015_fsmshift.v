module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    reg [3:0] count;
    always @ (posedge clk) begin
        if (reset) begin
        	count <= 0;
        end
        else begin
            if (count<4)
                count <= count + 1;
        end     
    end
    assign shift_ena = (count < 4);
endmodule


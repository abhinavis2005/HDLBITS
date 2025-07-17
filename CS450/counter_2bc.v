module top_module(
    input clk,
    input areset,
    input train_valid,
    input train_taken,
    output [1:0] state
);
    reg [1:0] counter;
    always @ (posedge clk, posedge areset) begin
        if (areset)
            counter <= 2'b01;
        else begin
            case ({train_valid, train_taken}) 
                2'b11 : if (counter < 2'd3) counter <= counter + 1'b1;
                2'b10 : if (counter > 2'd0) counter <= counter - 1'b1;
				default : counter <= counter;
            endcase
        end
    end
        assign state = counter;

endmodule


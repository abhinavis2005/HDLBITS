module top_module(
    input clk,
    input areset,

    input predict_valid,
    input predict_taken,
    output [31:0] predict_history,

    input train_mispredicted,
    input train_taken,
    input [31:0] train_history
);
    always @ (posedge clk, posedge areset) begin
        if (areset) predict_history <= 32'd0;
        else begin
            if (train_mispredicted) begin
                predict_history <= {train_history[30:0] , train_taken};
            end
            else if (predict_valid) begin
                predict_history <= {predict_history[30:0], predict_taken};
            end
        end     
    end

endmodule


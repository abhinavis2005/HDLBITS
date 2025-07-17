module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    reg [3:0] state, next_state;
    always @ (*) begin
        if (state == 0) //waiting for start bit 
            next_state = in ? 0 : 1;
        else if (state == 9) //last daata bit received
            next_state = in ? 10 : 11; 
        else if (state == 10) // received last bit // op read
            next_state = in ? 0 : 1;
        else if (state == 11) // waiting for the stop bit // error state
            next_state = in ? 0 : 11;
        else
            next_state = state + 1;
    end
    
    always @ (posedge clk) begin
        if (reset)
            state <= 0;
        else
            state <= next_state;
    end
    assign done = (state == 10);

endmodule

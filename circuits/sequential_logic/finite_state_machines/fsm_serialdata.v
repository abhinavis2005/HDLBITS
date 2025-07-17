module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    reg [7:0] out;
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
        else begin
            state <= next_state;
            
            if (next_state >= 2 && next_state <= 9) begin
                out[(next_state - 2)] <= in;
            end
        end
        
        
    end
    assign done = (state == 10);
    assign out_byte = out;

    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.

endmodule


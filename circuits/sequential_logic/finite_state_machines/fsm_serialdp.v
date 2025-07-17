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
        else if (state == 10) //last daata bit received
            next_state = in ? 11 : 12; 
        else if (state == 11) // received last bit // op read
            next_state = in ? 0 : 1;
        else if (state == 12) // waiting for the stop bit // error state
            next_state = in ? 0 : 12;
        else
            next_state = state + 1;
    end
    
    always @ (posedge clk) begin
        if (reset)
            state <= 0;
        else begin
            if (next_state == 11) begin //parity checking
                if (odd) begin
                    state <= 11;
                end
                else begin
                    state <= 0;
                end
            end
            else
            	state <= next_state;
            
            if (next_state >= 2 && next_state <= 9) begin
                out[(next_state - 2)] <= in;
            end
        end
        
        
    end
    reg odd;
    wire reset_parity;
    assign reset_parity = (next_state==1);
    parity inst1(clk, reset_parity, in, odd);
    assign done = (state == 11);
    assign out_byte = out ;
	
    // Use FSM from Fsm_serial

    // New: Datapath to latch input bits.


endmodule


module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter A = 0, B = 1, C = 2, RESET = 3;
    reg[1:0] state, next_state;

    // State transition logic (combinational)

    always @ (*) begin
        case (state) 
            RESET: next_state = in[3] ? A : RESET;
            A : next_state = B;
            B : next_state = C;
            C : next_state = in[3] ? A : RESET;
        endcase
    end
    // State flip-flops (sequential)
    always @ (posedge clk) begin
        if (reset)
            state <= RESET;
        else
        	state <= next_state;
    end
    assign done = (state == C);
    // Output logic

endmodule


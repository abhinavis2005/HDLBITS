module top_module(
    input clk,
    input reset,    // Synchronous reset to OFF
    input j,
    input k,
    output out); //  

     parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case (state)
            OFF: next_state = j ? ON : OFF;
            ON : next_state = k ? OFF : ON;
        endcase
        // State transition logic
        
    end

    always @(posedge clk) begin
        // State flip-flops with asynchronous reset
        if (reset)
            state <= OFF;  
        else 
            state <= next_state;
    end
    
    assign out = (state==ON);

endmodule


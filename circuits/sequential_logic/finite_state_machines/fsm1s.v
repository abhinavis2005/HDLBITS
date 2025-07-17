// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

     parameter A=0, B=1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        // State transition logic
        next_state = ~(state ^ in);
    end

    always @(posedge clk) begin    // This is a sequential always block
        // State flip-flops with asynchronous reset
        if (reset)
            state <= 1;
        else
            state <= next_state;
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state==1);

endmodule


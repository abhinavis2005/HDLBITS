module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    
    reg [2:0] state, next_state;
    
    always @ (*) begin
        case (state) 
            0 : next_state = in ? 1 : 0 ; //state of continous 0s
            1 : next_state = in ? 2 : 0;
            2 : next_state = in ? 3 : 0; 
            3 : next_state = in ? 4 : 0;
            4 : next_state = in ? 5 : 0;
            5 : next_state = in  ? 6: 0;
            6 : next_state = in ? 7 : 0;
            7 : next_state = in ? 7 : 0;
        endcase
    end
    always @ (posedge clk) begin
        if (reset) 
            state <= 0;
        else begin
            state <= next_state;
            if (state == 5 && (in==0)) 
                disc <= 1;
            else
                disc <= 0;
            if (state == 6 && (in==0)) 
                flag <= 1;
            else
                flag <= 0;
        end
    end
    assign err = (state == 7);
    

endmodule

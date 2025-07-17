module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    reg next_state;
    always @ (*) begin
        case (state) 
            0 : next_state = (a == 1'b1) && ( b == 1'b1);
            1 : next_state = !((a == 1'b0) && ( b == 1'b0));
        endcase
    end
    
    always @ (posedge clk) begin
        state <= next_state;
    end
    
    always @ (*) begin
        case (state)
            0 : q = a ^ b;
            1 : q = ~(a ^ b);
        endcase
    end
endmodule


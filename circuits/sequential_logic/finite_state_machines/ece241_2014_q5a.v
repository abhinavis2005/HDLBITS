module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
	parameter A = 0, B = 1;
    reg state, next_state;
    
    always @ (*) begin
        case (state)
            A : next_state = x ? B : A;
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if (areset) begin
            state <= A;
			z <= 0;
        end
        else begin
            state <= next_state;
            if (state == A)
                z <= x;
            else 
                z <= ~x;
        end
    end
    	
endmodule



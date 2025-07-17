module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    reg [2:0] state, next_state;
    parameter A = 0, B = 1, C = 2;
    always @ (*) begin
        case ( state )
            A : next_state = x ? B : A;
            B : next_state = x ? B : C;
            C : next_state = x ? B : A;
        endcase
    end
    
    always @ (posedge clk or negedge aresetn) begin
        if (!aresetn) 
            state <= A;
        else begin
			state <= next_state;
        end
    end
    
    assign z = (state == C && x ) ;
		            
endmodule


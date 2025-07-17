module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
	parameter A = 0, B = 1, C = 2, D = 3;
    reg [2:0] state, next_state;
    always @ (*) begin
        case (state)
            A : next_state = data ? B : A;
            B : next_state = data ? C : A;
            C : next_state = data ? C : D;
            D : next_state = data ? D : A;
        endcase
    end
    always @ (posedge clk) begin
        if (reset) begin
            state <= A;
        	start_shifting <= 0;
        end
        else begin
            state <= next_state;
            start_shifting <= start_shifting ? 1 : (state==D&&(data==1));
        end
    end
endmodule


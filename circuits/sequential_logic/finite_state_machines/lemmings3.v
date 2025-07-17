module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LF = 0, L = 1, R = 2, RF = 3, LD = 4, RD = 5;
    
    reg [2:0] state, next_state;
    always @ (*) begin
        case (state)
            LF : begin
                if (ground==1) 
                    next_state = L;
                else
                    next_state = LF;
            end
			L : begin
                if (ground==1) begin
                    if (dig) 
                        next_state = LD;
                    else
                    	next_state = bump_left ? R :L;
                end
                else
                    next_state = LF;
            end
            R : begin
                if (ground == 1) begin
                    if (dig)
                        next_state = RD;
                    else
                    	next_state = bump_right ? L : R;
                end
                else 
                    next_state = RF;
            end
            RF: begin
                if (ground == 1)
                    next_state = R;
                else
                    next_state = RF;
            end
            LD: begin
                if (ground == 1) begin
					next_state = LD;
                end
                else
                    next_state = LF;
            end
            RD: begin
                if (ground==1) begin
					next_state = RD;
                  
                end
                else
                    next_state = RF;
            end
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if (areset)
            state <= L;
        else 
            state <= next_state;
    end
    
    assign walk_left = (state == L);
    assign walk_right = (state == R);
    assign aaah = (state == LF || state == RF);
    assign digging = (state == LD || state == RD);
        
endmodule


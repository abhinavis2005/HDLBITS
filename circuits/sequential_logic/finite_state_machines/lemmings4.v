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
	
    parameter LF = 0, L = 1, R = 2, RF = 3, LD = 4, RD = 5, DEAD = 6;

    reg [2:0] state, next_state;
    reg [4:0] counter;
    always @ (*) begin
        case (state)
            LF : begin
                    if (ground) begin
                        if (counter > 20)
                            next_state = DEAD;
                        else
                            next_state = L;
                    end else
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
                    if (ground) begin
                        if (counter > 20)
                            next_state = DEAD;  // too long in the air, splatter
                        else
                            next_state = R;     // safe landing
                    end else
                        next_state = RF;        // keep falling
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
            DEAD: next_state = DEAD;
        endcase
    end
    
    always @ (posedge clk or posedge areset) begin
        if (areset) begin
            counter <= 0;
            state <= L;
        end
        else begin
            if ((next_state == LF) || (next_state == RF)) begin
                if (counter > 20)
                    counter <= 21;
                else
                	counter <= counter + 1;
            end
            else 
                counter <= 0;
            state <= next_state;
        end
    end
    
    always @ (*) begin
        if (state == DEAD) begin
            {walk_left, walk_right, aaah, digging} = 4'b0000;
        end
        else begin 
            walk_left = (state == L);
            walk_right = (state == R);
            aaah = (state == LF || state == RF);
            digging = (state == LD || state == RD);
        end
    end
    
endmodule


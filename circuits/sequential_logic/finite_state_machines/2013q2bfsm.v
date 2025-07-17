module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6, H = 7, I = 8, J = 9;
    reg [3:0] state, next_state;
    always @ (*) begin
        case (state)
            A : next_state = resetn ? B : A;
            B : next_state = C;
            C : next_state = x ? D : C;
            D : next_state = x ? D : E;
            E : next_state = x ? G : C;
          
            G : next_state = y ? H : I;
            I : next_state = y ? H : J;
            H : next_state = H;
            J : next_state = J;
        endcase
        f = (state == B ) ;
        g = (state == G ) || (state == I ) || (state == H);
    end
    always @ (posedge clk) begin
        if (!resetn)
            state <= A;
        else
            state <= next_state;
    end

endmodule


module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state, next_state;
    always @ (*) begin
        g = 3'b000;
        case (state)
            A : begin
                casez(r)
                    3'bzz1: next_state = B;
                    3'bz10: next_state = C;
                    3'b100: next_state = D;
                    default : next_state = A;
                endcase
            end
            B : begin
                next_state = r[1] ? B : A;
                g[1] = 1;
            end
            C : begin
                next_state = r[2] ? C : A;
                g[2] = 1;
            end
            D : begin 
                next_state = r[3] ? D : A;
                g[3] = 1;
            end
        endcase
    end
    always @ (posedge clk) begin
        if (!resetn)
            state <= A;
        else 
            state <= next_state;
    end
endmodule


module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
    reg [2:0] state, next_state;
    always @ (*) begin
        case (state)
            A : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = B;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            B : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = B;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            C : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            D : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = F;
                    3'b111: next_state = D;
                endcase
            end
            E : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            F : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = F;
                    3'b111: next_state = D;
                endcase
            end
        endcase
    end
    always @ (posedge clk) begin
        if (reset)
            state <= A;
        else 
            state <= next_state;
    end
    always @ (*) begin
        {fr1, fr2, fr3, dfr} = 4'b0000;
        case (state)
            A : begin
                fr1 = 1;
                fr2 = 1;
                fr3 = 1;
                dfr = 1;
            end
            B : begin
module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter A = 0, B = 1, C = 2, D = 3, E = 4, F = 5;
    reg [2:0] state, next_state;
    always @ (*) begin
        case (state)
            A : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = B;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            B : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = B;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            C : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            D : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = F;
                    3'b111: next_state = D;
                endcase
            end
            E : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = C;
                    3'b111: next_state = D;
                endcase
            end
            F : begin
                casez(s)
                    3'b000: next_state = A;
                    3'b001: next_state = E;
                    3'b01z: next_state = F;
                    3'b111: next_state = D;
                endcase
            end
        endcase
    end
    always @ (posedge clk) begin
        if (reset)
            state <= A;
        else 
            state <= next_state;
    end
    always @ (*) begin
        {fr1, fr2, fr3, dfr} = 4'b0000;
        case (state)
            A : begin
                fr1 = 1;
                fr2 = 1;
                fr3 = 1;
                dfr = 1;
            end
            B : begin
                fr1 = 1;
                fr2 = 1;
            end
            C : begin
                fr1 = 1;
            end
            E : {fr1, fr2, fr3, dfr} = 4'b1101;
            F : {fr1, fr2, fr3, dfr} = 4'b1001;
            default : {fr1, fr2, fr3, dfr} = 4'b0000;
        endcase
    end


endmodule



module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;
    reg [2:0] state, next_state;
    always @ (*) begin
        case (state)
            3'b000 : next_state = x ? 3'b001 : 3'b000;
            3'b001 : next_state = x ? 3'b100 : 3'b001;
            3'b010 : next_state = x ? 3'b001 : 3'b010;
            3'b011 : next_state = x ? 3'b010 : 3'b001;
            3'b100 : next_state = x ? 3'b100 : 3'b011;
        endcase
        
        z = (state == 3'b011) || (state == 3'b100) ;
    end
    always @ (posedge clk) begin
        if (reset) 
            state <= 3'b000;
        else 
            state <= next_state;
    end

endmodule


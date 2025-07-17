module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
	parameter A = 3'd0, // initial reset state
    B = 3'd1, // 1 detected
    C = 3'd2, // 11 detected
    D = 3'd3, // 110 detected
    E = 3'd4, // 1101 (shifting in 4 bits)
    F = 3'd5, // counting (actual delay state)
    G = 3'd6; // waiting for ack 
    
    //state variabels
    reg [2:0] state, next_state;
    
    //state transitions
    always @ (*) begin
        case (state)
        	A : next_state = data ? B : A;
            B : next_state = data ? C : A;
            C : next_state = data ? C : D;
            D : next_state = data ? E : A;
            E : next_state = (shifter==3) ? F : E;
            F : next_state = (counter == 0) ? G : F;
			G : next_state = ack ? A : G;
        endcase
    end
    //state transitions
    always @ (posedge clk) begin
        if (reset) begin//finish resetting all internal variables
            state <= A;
        end
        else
            state <= next_state;
    end
    
    reg [2:0] shifter;
    reg [3:0] delay;
    reg [14:0] counter;
    
    always @ (posedge clk) begin
        if (state == E) begin
            delay <= {delay[2:0], data};
            shifter <= shifter + 1;
            counter <= ({delay[2:0], data}+1)*1000-1;
        end
        
        if (state == F) begin
            counter <= counter - 1;
        end
        //reseting all internal variables
        if (state == A) begin
        	shifter <= 3'd0;
            delay <= 4'd0;
            counter <= 15'd0;
        end
            
    end
    
    
    //define outputs
    always @ (*) begin
        int temp;
        temp = counter / 1000;
        count = temp;
        counting = (state == F);
        done = (state == G);
    end
endmodule
    



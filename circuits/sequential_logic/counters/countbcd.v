module decade_counter (
    input clk,
    input reset,   
    input ena, // Synchronous active-high reset
    output [3:0] q);
	
    always @ (posedge clk) begin
        if (reset || (q==9 && ena)) 
            q <= 0;
        else begin
            if (ena) begin
            	q <= q + 1;
            end
        end
	end
            
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    decade_counter inst1(clk, reset, 1, q[3:0]);
    assign ena[1] = (q[3:0]==9);
    decade_counter inst2(clk, reset, ena[1], q[7:4]);
    assign ena[2] = (q[3:0] == 9 && q[7:4] == 9);
    decade_counter inst3(clk, reset, ena[2], q[11:8]);
    assign ena[3] = ena[2] && (q[11:8] == 9);
    decade_counter inst4(clk, reset, ena[3], q[15:12]);
    
    

endmodule


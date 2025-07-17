module top_module (
	input [2:0] SW,      // R
	input [1:0] KEY,     // L and clk
	output [2:0] LEDR);  // Q
    
    wire d1, d2, d3;
    assign d1 = KEY[1] ? SW[0] : LEDR[2];
    assign d2 = KEY[1] ? SW[1] : LEDR[0];
    assign d3 = KEY[1] ? SW[2] : LEDR[1]^LEDR[2];
    
    always @ ( posedge KEY[0]) begin
        LEDR[0] <= d1;
        LEDR[1] <= d2;
        LEDR[2] <= d3;
    end


endmodule


module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
	wire clk, E, L, w; 
    assign {clk, E, L, w} = {KEY[0], KEY[1], KEY[2], KEY[3]};
    mux_dff a(clk,w		 , SW[3], E, L, LEDR[3]);
    mux_dff b(clk,LEDR[3], SW[2], E, L, LEDR[2]);
    mux_dff c(clk,LEDR[2], SW[1], E, L, LEDR[1]);
    mux_dff d(clk,LEDR[1], SW[0], E, L, LEDR[0]);
  
endmodule

module mux_dff (
    input clk,
    input w, R, E, L,
    output Q
);
    wire d;
    assign d = L ? R: ( E ?  w : Q  ) ;
    always @ (posedge clk) begin
        Q <= d;
    end

endmodule




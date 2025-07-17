module top_module (input a, input b, input c, output out);//
	wire intermediate_out;
    andgate inst1 ( intermediate_out,  a, b, c, 1, 1 );
	assign out = ~intermediate_out;
endmodule


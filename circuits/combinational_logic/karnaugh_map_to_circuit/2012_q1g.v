module top_module (
    input [4:1] x,
    output f
); 
	wire a, b, c, d;
    assign {a, b, c, d} = x;
    assign f = |{&{~b, ~d},&{a, ~c},&{a,b,d}};

endmodule


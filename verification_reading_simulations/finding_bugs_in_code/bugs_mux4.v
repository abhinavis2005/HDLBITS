module top_module (
    input [1:0] sel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] out  ); //

    wire mux0_wire, mux1_wire;
    mux2 mux0 ( sel[0],    a,    b, mux0_wire );
    mux2 mux1 ( sel[0],    c,    d, mux1_wire );
    mux2 mux2 ( sel[1], mux0_wire, mux1_wire,  out );

endmodule


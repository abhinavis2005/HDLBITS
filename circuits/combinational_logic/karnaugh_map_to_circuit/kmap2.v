module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = | {&{~d, ~a}, &{~a, ~b, ~c}, &{c, d, b}, &{~b, ~c}, &{c, d, a}};

endmodule


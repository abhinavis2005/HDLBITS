module a(input x, input y, output z);
    assign z = (x^y) & x;
endmodule
module b ( input x, input y, output z );
    assign z = ~(x ^ y);
endmodule

module top_module (input x, input y, output z);
    wire [3:0] Z;
    a a1(x, y, Z[0]);
    a a2(x, y, Z[1]);
    b b1(x, y, Z[2]);
    b b2(x, y, Z[3]);
    assign z = ^{|{Z[1:0]}, &{Z[3:2]}};
endmodule


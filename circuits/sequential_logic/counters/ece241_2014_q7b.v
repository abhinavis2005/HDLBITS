module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
    reg [3:0] lsb;
    
    assign c_enable[0] = 1;
    assign c_enable[1] = (lsb == 9) ? 1 : 0;
    bcdcount counter0 (clk, reset, c_enable[0], lsb);
    reg [3:0] msb;
    bcdcount counter1 (clk, reset, c_enable[1], msb);
    assign c_enable[2] = (msb==9 && lsb==9) ?  1: 0;
    
    reg [3:0] finalsig;
    bcdcount counter2 (clk, reset, c_enable[2], finalsig);
    
    assign OneHertz = (finalsig==9 && msb ==9 && lsb==9) ? 1 : 0;
    
    
endmodule


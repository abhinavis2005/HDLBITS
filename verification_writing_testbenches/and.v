module top_module;
    reg [1:0] in;
    wire out;

    // Instantiate the DUT (Device Under Test)
    andgate dut (
        .in(in),
        .out(out)
    );

    initial begin
        $display("Time\tin\tout");
        $monitor("%0t\t%b\t%b", $time, in, out);

        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;

        $finish;
    end
endmodule


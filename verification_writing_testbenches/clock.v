`timescale 1ps/1ps  // Set time unit and precision to picoseconds
module top_module ( );




  // Clock signal
  reg clk;

  // Instantiate the DUT
  dut u_dut (
    .clk(clk)
  );

  // Clock generation: 10 ps period, starting at 0, first edge is rising
  initial begin
    clk = 0;
    forever begin
      #5 clk = ~clk; // Toggle clock every 5ps: 0→1→0 gives 10ps full period
    end
  end


endmodule


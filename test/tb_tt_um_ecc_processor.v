`default_nettype none
`timescale 1ns / 1ps

module tb_tt_um_ecc_processor ();

  initial begin
    $dumpfile("tb.fst");
    $dumpvars(0, tb_tt_um_ecc_processor);
    #1;
  end

  // DUT signals
  reg clk;
  reg rst_n;
  reg ena;
  reg [7:0] ui_in;
  reg [7:0] uio_in;

  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Instantiate ECC Processor
  tt_um_ecc_processor dut (

`ifdef GL_TEST
      .VPWR(VPWR),
      .VGND(VGND),
`endif

      .ui_in(ui_in),
      .uo_out(uo_out),
      .uio_in(uio_in),
      .uio_out(uio_out),
      .uio_oe(uio_oe),
      .ena(ena),
      .clk(clk),
      .rst_n(rst_n)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Basic stimulus
  initial begin
    ena    = 1'b1;
    rst_n  = 1'b0;
    ui_in  = 8'd0;
    uio_in = 8'd0;

    #20;
    rst_n = 1'b1;

    ui_in  = 8'd5;
    uio_in = 8'd3;

    #100;

    $finish;
  end

endmodule

`default_nettype wire

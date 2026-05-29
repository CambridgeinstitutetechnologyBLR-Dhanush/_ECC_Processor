/*
 * Copyright (c) 2026 Dhanush Kulkarni
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ecc_processor (
    input  wire [7:0] ui_in,
    output wire [7:0] uo_out,
    input  wire [7:0] uio_in,
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    reg [7:0] ecc_result;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            ecc_result <= 8'd0;
        else
            ecc_result <= (ui_in * uio_in) + ui_in;
    end

    assign uo_out  = ena ? ecc_result : 8'b0;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Prevent unused signal warnings
    wire _unused = &{1'b0};

endmodule

`default_nettype wire

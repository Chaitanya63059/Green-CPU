`timescale 1ns / 1ps



module dff #(parameter WIDTH = 16) (
    input       clk, rst,
    input       [WIDTH-1:0] d,
    output reg  [WIDTH-1:0] q
);
always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 16'b0;
        else
            q <= d;

endmodule


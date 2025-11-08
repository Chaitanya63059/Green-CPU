`timescale 1ns / 1ps

module immgen (
    input  [3:0]  inp,
    output [15:0] out
);
 assign imm_out = { {10{imm_in[5]}}, imm_in };

endmodule


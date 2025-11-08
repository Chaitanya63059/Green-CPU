`timescale 1ns / 1ps

module alu #(parameter WIDTH = 16) (
    input       [WIDTH-1:0] a, b,       // operands
    input       [3:0] alu_ctrl,       // ALU control
    output reg  [WIDTH-1:0] alu_out,   
    output      zero                  
);

 
    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b0001;
    localparam ALU_SLT = 4'b0010; // Set on Less Than (signed)
    localparam ALU_OR  = 4'b0011;
    localparam ALU_AND = 4'b0100;
    localparam ALU_SRL = 4'b0101; 
    localparam ALU_SLL = 4'b0110; 
    localparam ALU_SRA = 4'b0111; 


    always @(*) begin
        case (alu_ctrl)
            ALU_ADD: alu_out = a + b;
            ALU_SUB: alu_out = a - b;
            ALU_AND: alu_out = a & b;
            ALU_OR:  alu_out = a | b;
            ALU_SLT: alu_out = ($signed(a) < $signed(b)) ? 16'd1 : 16'd0;
            ALU_SLL: alu_out = a << b[4:0]; // Shift 'a' left by 'b' amount
            ALU_SRL: alu_out = a >> b[4:0]; // Logical shift right
            ALU_SRA: alu_out = $signed(a) >>> b[4:0]; // Arithmetic shift right
            
            
            default: alu_out = 16'hXXXX; 
        endcase
    end

   
    assign zero = (alu_out == 16'd0); // Becomes 1 when alu_out becomes 0

endmodule

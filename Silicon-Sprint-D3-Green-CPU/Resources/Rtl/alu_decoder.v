`timescale 1ns / 1ps

module alu_decoder (
    // Input from Main Control Unit (e.g., 2 bits)
    input [1:0] ALUOp,     
    
    input [3:0] funct,     
    
    output reg [3:0] alu_ctrl 
);
    
    // --- Define ALU Control signals (must match your alu.v) ---
    localparam ALU_ADD = 4'b0000;
    localparam ALU_SUB = 4'b0001;
    localparam ALU_SLT = 4'b0010;
    localparam ALU_OR  = 4'b0011;
    localparam ALU_AND = 4'b0100;
    localparam ALU_SRL = 4'b0101;
    localparam ALU_SLL = 4'b0110;
    localparam ALU_SRA = 4'b0111;

    // --- Define ALUOp types from Main Control ---
    localparam OP_MEMORY = 2'b00; // For LH, SH
    localparam OP_RTYPE  = 2'b10; // For R-Type instructions

    // Combinational logic to select the final alu_ctrl
    always @(*) begin
        case (ALUOp)
            
        // For Memory Offset , ADD instruction is used
        // For example LH R1, 16(R2) her e we have to add the memory Address to the register and then store that value in destination register R1
            
            OP_MEMORY: begin
                alu_ctrl = ALU_ADD;
            end

            // For Registers 
            // Performs Operations based on alu_ctrl input
            OP_RTYPE: begin
                
                case (funct) 
                    ALU_ADD: alu_ctrl = ALU_ADD;
                    ALU_SUB: alu_ctrl = ALU_SUB;
                    ALU_SLT: alu_ctrl = ALU_SLT;
                    ALU_OR:  alu_ctrl = ALU_OR;
                    ALU_AND: alu_ctrl = ALU_AND;
                    ALU_SRL: alu_ctrl = ALU_SRL;
                    ALU_SLL: alu_ctrl = ALU_SLL;
                    ALU_SRA: alu_ctrl = ALU_SRA;
                    default: alu_ctrl = 4'hXXXX; // Undefined funct
                endcase
            end
            
            // Default case for any other ALUOp
            default: begin
                alu_ctrl = 4'hXXXX; // Undefined ALUOp
            end

        endcase
    end

endmodule

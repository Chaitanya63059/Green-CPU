# Custom 16-bit RISC-V Style Processor Core

The objective of this project is to design and implement a custom Instruction Set Architecture (ISA) and its corresponding processor using Verilog HDL. The ISA must be defined such that all instructions are 16 bits wide, and the processor includes 8 General Purpose Registers (GPRs).
Find the specifications of the instructions of the ISA linked [here](https://docs.google.com/spreadsheets/d/18On-sn_LSf54qCVk8wgvnJ0nMea1kv3EHVJAyhfKcl8/edit?gid=1331383528#gid=1331383528)

---

## Core Architecture Specifications

* **ISA:** Custom 16-bit Architecture
* **Instruction Width:** 16 bits
* **Register File:** 8 General-Purpose Registers (GPRs)
* **Design Language:** Verilog HDL
* **Core Type:** Evolves from a single-cycle to a fully pipelined design.

---

## Project Milestones

### Task 1. Base Processor Design Single-Cycle Core

Design a single cycle processor that supports the following fundamental instructions:

* **Memory Instructions:**
    * `LH` (Load Halfword)
    * `SH` (Store Halfword)
      
* **Arithmetic & Logical (R-Type) Instructions:**
    * `ADD`
    * `SUB`
    * `SLT` (Set on Less Than)
    * `OR`
    * `AND`
    * `SRL` (Shift Right Logical)
    * `SLL` (Shift Left Logical)
    * `SRA` (Shift Right Arithmetic)

### Task 2. ISA Extension

Extend the base ISA to support a wider range of operations for more complex programs as follows:

* **Control Flow Instructions:**
    * `JAL` (Jump and Link)
    * `BEQ` (Branch on Equal)
    * `BNE` (Branch on Not Equal)
    * `BLT` (Branch on Less Than)
    * `BGE` (Branch on Greater Than or Equal)
    * `JALR` (Jump and Link Register)
    * 
* **Immediate Operations (I-Type):**
    * `ADDI` (Add Immediate)
    * `SUBI` (Subtract Immediate)
    * `ORI` (OR Immediate)
    * `ANDI` (AND Immediate)
    * `SLTI` (Set on Less Than Immediate)
    * 
* **Immediate Shift Operations:**
    * `SRLI` (Shift Right Logical Immediate)
    * `SLLI` (Shift Left Logical Immediate)
    * `SRAI` (Shift Right Arithmetic Immediate)

### Task 3. Floating-Point Unit (FPU) Design

Design a Floating-Point Arithmetic Processing Unit. All FPU operations must comply with the ***IEEE 754 half precision standard***. The instructions to be supported are as follows:

* **FPU Operations:**
    * `FADD` (Floating-Point Add)
    * `FMUL` (Floating-Point Multiply)

### Task 4. Pipelined Core

Pipeline the processor and implement a hazard detection-resolution unit. Integrate the FPU core into the pipelined processor.

### Task 5. Cryptographic Co-Processor Integration

With the provided source code for a custom cryptographic core’s encryption logic, design and implement the corresponding decryption logic. Design a co-processor interface that allows the main CPU to communicate with this cryptographic core. Integrate the co-processor into the CPU pipeline and extend the instruction set by adding two custom instructions:

* **Custom Crypto Core Instructions:**
    * `ENC` (Encrypt): Triggers the co-processor to perform an encryption operation.
    * `DEC` (Decrypt): Triggers the co-processor to perform a decryption operation.
 

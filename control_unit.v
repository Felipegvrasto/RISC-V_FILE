`timescale 1ns / 1ps

module control_unit(
    input Zero, funct7,
    input [2:0] funct3,
    input [6:0] op,
    output [1:0] ResultSrc,
    output [2:0] ALUControl, ImmSrc,
    output PCSrc, ALUSrc, MemWrite, RegWrite, Branch
    );

wire [1:0] ALUOp;
wire Jump;


main_decoder MD(
    .Opc(op),
    .Jump(Jump),
    .Branch(Branch),
    .ResultSrc(ResultSrc),
    .ImmSrc(ImmSrc),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
);

assign PCSrc = (Zero & Branch) | Jump;

alu_decoder AD(
    .funct7(funct7),
    .op5(op[5]),
    .funct3(funct3),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
    );

endmodule


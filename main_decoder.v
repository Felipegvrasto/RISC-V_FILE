`timescale 1ns / 1ps

module main_decoder(
    input [6:0] Opc,
    output [1:0] ResultSrc,
    output [2:0] ImmSrc,  // 3 bits para soportar la instrucción lui
    output Jump, Branch,
    output MemWrite, ALUSrc, RegWrite,
    output [1:0] ALUOp
    );

reg [11:0] salidas;

always @(*)
    case (Opc)
        7'b0000011 : salidas <= 12'b100010010000;  // lw
        7'b0100011 : salidas <= 12'b000111xx0000;  // sw
        7'b0110011 : salidas <= 12'b1xxx00000100;  // R-type // xor
        7'b1100011 : salidas <= 12'b001000xx1010;  // beq
        7'b0010011 : salidas <= 12'b100010000100;  // I-type ALU
        7'b1101111 : salidas <= 12'b1011x0100xx1;  // jal
        7'b0110111 : salidas <= 12'b1101x0110xx0;  // lui
        default    : salidas <= 12'bxxxxxxxxxxxx;
    endcase

assign {RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp, Jump} = salidas;

endmodule

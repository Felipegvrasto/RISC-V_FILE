`timescale 1ns / 1ps

module instr_memory #(parameter BITS_DATA=32, parameter BITS_ADDR=7)(
    input [BITS_ADDR-1:0] A,       
    output [BITS_DATA-1:0] RD  
    );

// Memory array (depth x width): 2^3= 8_rows x 4_bits
reg [7:0] memoria [0: (2**BITS_ADDR)-1];

initial
 $readmemh("datos_memory.mem", memoria, 0,	(2**BITS_ADDR)-1);
        //(File name, memoria array name, Start Address, Stop Address)

assign RD = {memoria[A], memoria[A+1], memoria[A+2], memoria[A+3]};

endmodule


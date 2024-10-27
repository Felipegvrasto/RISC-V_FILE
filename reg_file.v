`timescale 1ns / 1ps

module reg_file(
    input clk,
    input WE3,
    input [4:0] A1, A2, A3,
    input [31:0] WD3,
    output [31:0] RD1, RD2
    );

reg [31:0] regtrs [0:(2**5)-1];

// Inicialización de registros en cero
integer i;

initial begin
for (i = 0; i <= 31; i = i + 1)
    regtrs[i] <= 0;
end

always @(posedge clk)
    if (WE3)
        regtrs[A3] <= WD3;

assign RD1 = regtrs[A1];
assign RD2 = regtrs[A2];

endmodule
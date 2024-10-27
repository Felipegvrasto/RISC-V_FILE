`timescale 1ns / 1ps

module immextend_TB();

reg [2:0] ImmSrc;
reg [24:0] Instr;
wire [31:0] ImmExt;

immextend IE(
    .ImmSrc(ImmSrc),
    .Instr(Instr),
    .ImmExt(ImmExt)
    );

initial begin
Instr = 32'd4294966451;
ImmSrc = 0;
#10;
ImmSrc = 1;
#10;
ImmSrc = 2;
#10;
ImmSrc = 3;
#10;
ImmSrc = 4;
#10;
ImmSrc = 5;
end

endmodule

`timescale 1ns / 1ps

module pc_TB();

reg clk;
reg [6 : 0] D;
wire [6 : 0] Q;

pc PTT(
    .clk(clk),
    .D(D),
    .Q(Q)
    );

initial begin
clk = 0;    D = 0;
end

always begin
#2 clk = !clk;
end

always begin
#4 D = D + 7'd4;
end

endmodule
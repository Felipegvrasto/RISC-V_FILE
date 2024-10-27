`timescale 1ns / 1ps

module data_memory_TB();

reg clk;
reg WE;
reg [31:0] A;
reg [31:0] WD;
wire [31:0] RD;


data_memory DM(
.clk(clk),
.WE(WE),
.A(A),
.RD(RD),
.WD(WD)
);

initial begin
 clk = 1'd0;
end

always begin
#5 clk = !clk;
end

initial begin
WE = 1'd1;     A = 32'd0;     WD = 32'd3;
#10;                          
WE = 1'd1;     A = 32'd1;     WD = 32'd6;
#10;                          
WE = 1'd1;     A = 32'd2;     WD = 32'd9;
#10;                          
WE = 1'd1;     A = 32'd3;     WD = 32'd12;
#10;                          
WE = 1'd0;     A = 32'd0;     WD = 32'd0;
#10;                          
WE = 1'd0;     A = 32'd1;     WD = 32'd1;
#10;                          
WE = 1'd0;     A = 32'd2;     WD = 32'd2;
#10;                          
WE = 1'd0;     A = 32'd3;     WD = 32'd3;
end

endmodule


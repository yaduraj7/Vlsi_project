`timescale 1ns / 1ps
module fifo_tb();
reg J,K,clk;
wire Q, Qbar;

jkff uut (J,K,Q,Qbar,clk);

initial
begin
clk = 1'b0;
end

always #5 clk = ~ clk;

initial 
begin
force Q=1;
force Qbar=0;
force jkff.w3=1;
force jkff.w4=0;
#1
release Q;
release Qbar;
release jkff.w3;
release jkff.w4;
end

initial
begin
J=0; K=0;
#7 J=1; K=0;
#10 J=1; K=1;
#10 J=1; K=1;
#15 J=0; K=0;
#100 $finish;
end

endmodule

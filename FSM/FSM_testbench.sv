// Code your testbench here
// or browse Examples
//////////////////////////////////////////////////////////////////////////////////
// Name: Yaduraj Singh Tomar
// Roll no. 231040124
// Department of Electical Engineering
// Indian Institute Of Technology
// Create Date:    21:42:56 18/05/2024
// Design Name: FSM
// Module Name:   MUL_test
// Project Name: Multiplication By Repeated Addition
// 
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module MUL_test;
reg [15:0] data_in;
reg clk, start;
wire done;
wire [15:0] Result;
MUL_datapath DP (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk, Result);
controller CON (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
initial
begin
clk = 1'b0;
#3 start = 1'b1;
#5000 $finish;
end
always #5 clk = ~clk;
initial
begin
#17 data_in = 17;
#10 data_in = 5;
end
initial
begin
$monitor ($time, " %d %b %d", DP.Y, done, DP.Bout);
//$dumpfile ("mul.vcd"); $dumpvars (0, MUL_test);
end
endmodule

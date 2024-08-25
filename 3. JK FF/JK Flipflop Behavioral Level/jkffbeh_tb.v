`timescale 1ns / 1ns
`include "jkffbeh.v"

module jkffbeh_tb;
    reg [1:0] jk;
    reg clk;
    integer i;
    wire q,qbar;
    jkffbeh j1(jk,clk,q,qbar);
    initial 
    begin
    $display("jkffbeh.vcd");
    $monitor("%b  %b %b \t %b %b",jk[1],jk[1],jk[0],clk,q,qbar);
    $dumpfile("jkffbeh_tb.vcd");
    $dumpvars(0,jkffbeh_tb);

        jk = 2'b00;
        #10

        jk = 2'b01;
        #10

        jk = 2'b10;
        #10

        jk = 2'b11;
        #10
    $finish;
    end
    initial
    begin
        clk = 0;
        for(i=0;i<20;i=i+1)
            #5 clk = ~clk;
    end 
endmodule
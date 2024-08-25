`timescale 1ns / 1ns
`include "mux2to1str.v"
module mux2to1str_tb;
  reg sel;
  reg a;
  reg b;
  wire y;
  //Inputs & Outputs
    mux2to1str uut (.sel(sel), .a(a), .b(b), .y(y));
  
  initial begin
    $dumpfile("mux2to1str.vcd");
    $dumpvars(0, mux2to1str_tb);
        // Test case - sel=0, a=0, b=0
    sel = 0;
    a = 0;
    b = 0;
    #5;
    $display("Test case - sel=0, a=0, b=0: y=%b", y);
    
    // Test case - sel=0, a=0, b=1
    sel = 0;
    a = 0;
    b = 1;
    #5;
    $display("Test case - sel=0, a=0, b=1: y=%b", y);
    
    // Test case - sel=0, a=1, b=0
    sel = 0;
    a = 1;
    b = 0;
    #5;
    $display("Test case - sel=0, a=1, b=0: y=%b", y);
    
    // Test case - sel=0, a=1, b=1
    sel = 0;
    a = 1;
    b = 1;
    #5;
    $display("Test case - sel=0, a=1, b=1: y=%b", y);
    
    // Test case - sel=1, a=0, b=0
    sel = 1;
    a = 0;
    b = 0;
    #5;
    $display("Test case - sel=1, a=0, b=0: y=%b", y);
    
    // Test case - sel=1, a=0, b=1
    sel = 1;
    a = 0;
    b = 1;
    #5;
    $display("Test case - sel=1, a=0, b=1: y=%b", y);
    
    // Test case - sel=1, a=1, b=0
    sel = 1;
    a = 1;
    b = 0;
    #5;
    $display("Test case - sel=1, a=1, b=0: y=%b", y);
    
    // Test case - sel=1, a=1, b=1
    sel = 1;
    a = 1;
    b = 1;
    #5;
    $display("Test case - sel=1, a=1, b=1: y=%b", y);
    
    $finish;
  end
endmodule

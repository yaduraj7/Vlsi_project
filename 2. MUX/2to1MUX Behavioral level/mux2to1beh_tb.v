`timescale 1ns/1ns // Set timescale for simulation
`include "mux2to1beh.v"

module mux2to1beh_tb;

  // Inputs
  reg sel;
  reg a;
  reg b;
  
  // Outputs
  wire out;

  mux2to1beh uut(
    .sel(sel),
    .a(a),
    .b(b),
    .out(out)
  );
  
  initial begin
        // Test case - sel=0, a=0, b=0
    sel = 0;
    a = 0;
    b = 0;
    #5;
    $display("Test case - sel=0, a=0, b=0: out=%b", out);
    
    // Test case - sel=0, a=0, b=1
    sel = 0;
    a = 0;
    b = 1;
    #5;
    $display("Test case - sel=0, a=0, b=1: out=%b", out);
    
    // Test case - sel=0, a=1, b=0
    sel = 0;
    a = 1;
    b = 0;
    #5;
    $display("Test case - sel=0, a=1, b=0: out=%b", out);
    
    // Test case - sel=0, a=1, b=1
    sel = 0;
    a = 1;
    b = 1;
    #5;
    $display("Test case - sel=0, a=1, b=1: out=%b", out);
    
    // Test case - sel=1, a=0, b=0
    sel = 1;
    a = 0;
    b = 0;
    #5;
    $display("Test case - sel=1, a=0, b=0: out=%b", out);
    
    // Test case - sel=1, a=0, b=1
    sel = 1;
    a = 0;
    b = 1;
    #5;
    $display("Test case - sel=1, a=0, b=1: out=%b", out);
    
    // Test case - sel=1, a=1, b=0
    sel = 1;
    a = 1;
    b = 0;
    #5;
    $display("Test case - sel=1, a=1, b=0: out=%b", out);
    
    // Test case - sel=1, a=1, b=1
    sel = 1;
    a = 1;
    b = 1;
    #5;
    $display("Test case - sel=1, a=1, b=1: out=%b", out);
    
    $finish;
  end
  
endmodule

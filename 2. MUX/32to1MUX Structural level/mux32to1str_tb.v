`include "mux32to1str.v"
module mux32to1str_tb;

  mux32to1str dut (
    .sel(sel),
    .a(a),
    .y(y)
  );

  // Inputs
  reg [4:0] sel;
  reg [31:0] a;
  
  // Output
  wire [0:0] y;
  
  // Initialize inputs
  initial begin
    $dumpfile("mux32x1str.vcd");
    $dumpvars(0, mux32to1str_tb);
    // Test case 1
    sel = 5'b00000;
    a = 32'b00000000000000000000000000000001;
    #5;
    $display("Test case 1: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 2
    sel = 5'b00001;
    a = 32'b00000000000000000000000000000010;
    #5;
    $display("Test case 2: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 3
    sel = 5'b00010;
    a = 32'b00000000000000000000000000000100;
    #5;
    $display("Test case 3: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 4
    sel = 5'b00011;
    a = 32'b00000000000000000000000000001000;
    #5;
    $display("Test case 4: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 5
    sel = 5'b11111;
    a = 32'b10000000000000000000000000000000;
    #5;
    $display("Test case 5: sel=%b, a=%b, y=%b", sel, a, y);
    
    // Test case 6
    sel = 5'b11110;
    a = 32'b01000000000000000000000000000000;
    #5;
    $display("Test case 6: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 7
    sel = 5'b11101;
    a = 32'b00100000000000000000000000000000;
    #5;
    $display("Test case 7: sel=%b, a=%b, y=%b", sel, a, y);

    // Test case 8
    sel = 5'b11100;
    a = 32'b00010000000000000000000000000000;
    #5;
    $display("Test case 8: sel=%b, a=%b, y=%b", sel, a, y);

    $finish;
  end

endmodule

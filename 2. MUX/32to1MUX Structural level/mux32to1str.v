module mux32to1str (input [4:0] sel, input [31:0] a, output [0:0] y);

  //16 MUX in first level
  mux2to1 u_mux0 (.sel(sel[0]), .a(a[0]), .b(a[1]), .y(w0));
  mux2to1 u_mux1 (.sel(sel[0]), .a(a[2]), .b(a[3]), .y(w1));
  mux2to1 u_mux2 (.sel(sel[0]), .a(a[4]), .b(a[5]), .y(w2));
  mux2to1 u_mux3 (.sel(sel[0]), .a(a[6]), .b(a[7]), .y(w3));
  mux2to1 u_mux4 (.sel(sel[0]), .a(a[8]), .b(a[9]), .y(w4));
  mux2to1 u_mux5 (.sel(sel[0]), .a(a[10]), .b(a[11]), .y(w5));
  mux2to1 u_mux6 (.sel(sel[0]), .a(a[12]), .b(a[13]), .y(w6));
  mux2to1 u_mux7 (.sel(sel[0]), .a(a[14]), .b(a[15]), .y(w7));
  mux2to1 u_mux8 (.sel(sel[0]), .a(a[16]), .b(a[17]), .y(w8));
  mux2to1 u_mux9 (.sel(sel[0]), .a(a[18]), .b(a[19]), .y(w9));
  mux2to1 u_mux10 (.sel(sel[0]), .a(a[20]), .b(a[21]), .y(w10));
  mux2to1 u_mux11 (.sel(sel[0]), .a(a[22]), .b(a[23]), .y(w11));
  mux2to1 u_mux12 (.sel(sel[0]), .a(a[24]), .b(a[25]), .y(w12));
  mux2to1 u_mux13 (.sel(sel[0]), .a(a[26]), .b(a[27]), .y(w13));
  mux2to1 u_mux14 (.sel(sel[0]), .a(a[28]), .b(a[29]), .y(w14));
  mux2to1 u_mux15 (.sel(sel[0]), .a(a[30]), .b(a[31]), .y(w15));

  // 8 MUX in 2nd level
  mux2to1 u_mux16 (.sel(sel[1]), .a(w0), .b(w1), .y(w16));
  mux2to1 u_mux17 (.sel(sel[1]), .a(w2), .b(w3), .y(w17));
  mux2to1 u_mux18 (.sel(sel[1]), .a(w4), .b(w5), .y(w18));
  mux2to1 u_mux19 (.sel(sel[1]), .a(w6), .b(w7), .y(w19));
  mux2to1 u_mux20 (.sel(sel[1]), .a(w8), .b(w9), .y(w20));
  mux2to1 u_mux21 (.sel(sel[1]), .a(w10), .b(w11), .y(w21));
  mux2to1 u_mux22 (.sel(sel[1]), .a(w12), .b(w13), .y(w22));
  mux2to1 u_mux23 (.sel(sel[1]), .a(w14), .b(w15), .y(w23));
  
  // 4 MUX in 3rd level
  mux2to1 u_mux24 (.sel(sel[2]), .a(w16), .b(w17), .y(w24));
  mux2to1 u_mux25 (.sel(sel[2]), .a(w18), .b(w19), .y(w25));
  mux2to1 u_mux26 (.sel(sel[2]), .a(w20), .b(w21), .y(w26));
  mux2to1 u_mux27 (.sel(sel[2]), .a(w22), .b(w23), .y(w27));

  // 2 MUX in 4th level
  mux2to1 u_mux28 (.sel(sel[3]), .a(w24), .b(w25), .y(w28));
  mux2to1 u_mux29 (.sel(sel[3]), .a(w26), .b(w27), .y(w29));

  // 1 MUX in 5th level
  mux2to1 u_mux30 (.sel(sel[4]), .a(w28), .b(w29), .y(y));
  
endmodule
module mux2to1 (input sel, input a, input b, output y);
    reg y;
    always@(*)begin
        if(sel==0)
        y=a;
        else
        y=b;
    end
endmodule
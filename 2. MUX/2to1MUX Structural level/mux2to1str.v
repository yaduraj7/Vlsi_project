module mux2to1str (input sel, input a, input b, output y);
  // 2 to 1 mux at structural level
  // sel=select line, a&b=inputs lines
  wire sel_not, a_nand_sel, b_nand_sel, ab_nand;
  // declaring wires
  // NOT gate inverts select line input
  not u_sel_not (sel_not, sel);
    // NAND gates for selection of inputs a or b
  nand u_a_nand_sel (a_nand_sel, a, sel_not);
    //NAND between input a and inverted select line
  nand u_b_nand_sel (b_nand_sel, b, sel);
    //NAND betwwen input b and select line
  nand u_ab_nand (ab_nand, a_nand_sel, b_nand_sel);
    // Assigning the output of the NOR gate to the output port
  assign y = ab_nand;
endmodule
// test bench file is mux2to1str_tb.v
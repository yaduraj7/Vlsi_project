module jkff(J,K,Q,Qbar,clk);
input J,K, clk;
output Q, Qbar;
wire w1, w2, w3, w4, w5, w6, clkbar;

not nn1 (clkbar, clk);
nand n1 (w1, J, clk, Qbar);
nand n2 (w2, K, clk, Q);
nand n3 (w3, w1, w4);
nand n4 (w4, w2, w3);

nand n5 (w5, w3, clkbar);
nand n6 (w6, w4, clkbar);
nand n7 (Q, w5, Qbar);
nand n8 (Qbar, w6, Q);

endmodule

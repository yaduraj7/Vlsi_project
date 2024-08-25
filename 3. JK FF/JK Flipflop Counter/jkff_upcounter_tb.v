`include "jkff_upcounter.v"
module jkff_upcounter_tb;
  reg clk, reset;
  integer i;
  wire [3:0] q;

  jkff_upcounter counter(.clk(clk), .reset(reset), .q(q));

  initial begin
    clk = 0;
    for (i=1;i<66;i=i+1)begin
   #2 clk=~clk; 
    end
  end

  initial begin
    $dumpfile("jkff_upcounter.vcd");
    $dumpvars(0, jkff_upcounter_tb);
  end

  initial 
    $monitor("simtime=%g,clk=%b,reset=%b,count=%b%b%b%b",$time,clk,reset,q[3],q[2],q[1],q[0]);
initial 
begin
  reset=1;
 #10 reset=0; 
  #150 reset=1;
end

endmodule


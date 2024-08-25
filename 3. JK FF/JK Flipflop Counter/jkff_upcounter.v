module jkff_upcounter(clk,reset,q);
  input clk,reset;
  output [3:0] q;
  wire j2,j3,q0_bar;
//input & output initialization
   
  jkff ff0(.j(1'b1), .k(1'b1), .clk(clk), .rst(reset), .q(q[0]));
  jkff ff1(.j(q[0]), .k(q[0]), .clk(clk), .rst(reset), .q(q[1]));
  and(j2,q[1],q[0]);
  jkff ff2(.j(j2), .k(j2), .clk(clk), .rst(reset), .q(q[2]));
  and(j3,q[2],q[1],q[0]);
  jkff ff3(.j(j3), .k(j3), .clk(clk), .rst(reset), .q(q[3]));
  //interconnecting JK flipflops and logic gates using wires
endmodule

module jkff(j,k,clk,rst,q);
    input j,k,clk,rst;
    output reg q;
    reg qbar;
    
    //positive edge triggered JK flipflop
    always@(posedge clk)
    begin
        if(rst) begin
        q<=0;
        qbar <=1; end
        else
        begin
    case({j,k})
        2'b00:begin
            q<=q;
            qbar<=qbar;
        end
        2'b01:begin
            q<= 0;
            qbar<=1;
        end
        2'b10:begin
            q<=1;
            qbar<=0;
        end

        2'b11:begin
            q<= ~q;
            qbar<=~qbar;end
    endcase
        end
    end     
endmodule

module jkffbeh(jk,clk,q,qbar);
    input [1:0] jk;
    input clk;
    output q,qbar;
    reg q,qbar;

    always@(negedge clk)
    begin
    case(jk)
        2'b00:
            q= q;

        2'b01:
            q= 0;

        2'b10:
            q=1;

        2'b11:
            q= ~q;
    endcase

    qbar = ~q;
    
    end 
endmodule
module mux2to1beh (input wire sel, input wire a, input wire b, output reg out);
// inputs declaration
    initial begin
    $dumpfile("mux2to1beh.vcd");
    $dumpvars(0, mux2to1beh_tb);
    end
    always @(sel, a, b)  //structural logic for 2to1mux
        if(sel)
            out = b;
        else
            out = a;
endmodule
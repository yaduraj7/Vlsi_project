//////////////////////////////////////////////////////////////////////////////////
// Name: Yaduraj Singh Tomar
// Roll no. 231040124
// Department of Electical Engineering
// Indian Institute Of Technology
// Create Date:    20/06/2024
// Design Name: MIPS Testbench
// Module Name:  test_mips32
// Project Name: MIPS Design
// 
//
//////////////////////////////////////////////////////////////////////////////////
module test_mips32; 
 reg clk1, clk2; 
 integer k; 
 MIPS_32 mips (clk1, clk2); 
 initial 
 begin 
 clk1 = 0; clk2 = 0; 
 repeat (20) // Generating two-phase clock 
 begin 
 #5 clk1 = 1; #5 clk1 = 0; 
 #5 clk2 = 1; #5 clk2 = 0; 
 end 
 end 
 initial 
 begin 
 for (k=0; k<31; k++) 
 mips.reg_bank[k] = k; 
 mips.mem_inst[0] = 32'h2801000a; // ADDI R1,R0,10 
 mips.mem_inst[1] = 32'h28020014; // ADDI R2,R0,20 
 mips.mem_inst[2] = 32'h28030019; // ADDI R3,R0,25 
 mips.mem_inst[3] = 32'h0ce77800; // OR R7,R7,R7 -- dummy instr. 
 mips.mem_inst[4] = 32'h0ce77800; // OR R7,R7,R7 -- dummy instr. 
 mips.mem_inst[5] = 32'h00222000; // ADD R4,R1,R2 
 mips.mem_inst[6] = 32'h0ce77800; // OR R7,R7,R7 -- dummy instr. 
 mips.mem_inst[7] = 32'h00832800; // ADD R5,R4,R3 
 mips.mem_inst[8] = 32'hfc000000; // HLT 
mips.halted = 0; 
 mips.pc = 0; 
 mips.taken_branch = 0; 
 #280 
 for (k=0; k<6; k++) 
 $display ("R%1d - %2d", k, mips.reg_bank[k]); 
 end 
 initial 
 begin 
 $dumpfile ("mips.vcd"); 
 $dumpvars (0, test_mips32); 
 #300 $finish; 
 end 
endmodule
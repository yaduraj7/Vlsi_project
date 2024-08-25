//////////////////////////////////////////////////////////////////////////////////
// Name: Yaduraj Singh Tomar
// Roll no. 231040124
// Department of Electical Engineering
// Indian Institute Of Technology
// Create Date:     25/06/2024
// Design Name: MIPS 
// Module Name:  MIPS_32 
// Project Name: MIPS Design
// 
//
//////////////////////////////////////////////////////////////////////////////////
module MIPS_32(clk1 , clk2);
input clk1, clk2;


// Defining all the registers in each stage
reg [31:0] pc, IF_ID_ir, IF_ID_npc;
reg [31:0] ID_EX_ir, ID_EX_npc, ID_EX_a, ID_EX_b, ID_EX_Imm;
reg [31:0] EX_MEM_ir, EX_MEM_b, EX_MEM_ALUOut;
reg EXE_MEM_cond;
reg [31:0] MEM_WB_ir, MEM_WB_ALUOut, MEM_WB_lmd; 
reg [2:0] ID_Ex_type, EX_MEM_type, MEM_WB_type;
//*****************************************


// Defining Memory & Register bank
reg [31:0] reg_bank [31:0];
reg [31:0] mem_inst [1024:0];
//********************************


// Defining Instructions Opcode
parameter ADD=000000, SUB=000001, AND=000010, OR=000011, SLT=000100, MUL=000101, HLT=111111;
parameter LW=001000, SW=001001, ADDI=001010, SUBI=001011, SLTI=001100, BNEQZ=001101, BEQZ=001110;
//*****************************


// Defining type of Instruction
parameter RR_ALU=000, RM_ALU=001, LOAD=010, STORE=011, BRANCH=100, HALT=101;
//*****************************


//***** additional registers *********
reg halted;         // set after HLT instruction is completed in WB stage
reg taken_branch;   // Required to disable instructions after branch
//***********************************


//******* Insrtuction Fetch ********
always@(posedge clk1)
  if(halted == 0)
  begin
    if( ((EX_MEM_ir[31:26] == BEQZ) && (EXE_MEM_cond == 1)) || ((EX_MEM_ir[31:26] == BNEQZ) && (EXE_MEM_cond == 0)) )
    begin
      IF_ID_ir <= #2 mem_inst[EX_MEM_ALUOut];
      taken_branch <= #2 1'b1;
      IF_ID_npc <= #2 EX_MEM_ALUOut + 1;
      pc <= EX_MEM_ALUOut + 1;
    end
    else
    begin
      IF_ID_ir <= #2 mem_inst[pc];
      IF_ID_npc <= #2 pc+1;
      pc <= #2 pc+1;
    end
  end
//**********************************


//****** Instruction Decode ***********
always@(posedge clk2)
begin
  if(halted==0)
  begin
  if(IF_ID_ir[25:21]==5'b00000) ID_EX_a <= #2 0;
  else ID_EX_a <= reg_bank[IF_ID_ir[25:21]];          // a <-- rs

  if (IF_ID_ir[20:16]==5'b00000) ID_EX_b <= #2 0;
  else ID_EX_b <= reg_bank[IF_ID_ir[20:16]];         // b <-- rt

  ID_EX_ir <= #2 IF_ID_ir;
  ID_EX_npc <= #2 IF_ID_npc;
  ID_EX_Imm <= #2 {{16{IF_ID_ir[15]}},IF_ID_ir[15:0]};

  case(IF_ID_ir[31:26])
  ADD, SUB, AND, OR, SLT, MUL     : ID_Ex_type <= #2 RR_ALU;
  ADDI, SUBI, SLTI                : ID_Ex_type <= #2 RM_ALU;
  BNEQZ, BEQZ                     : ID_Ex_type <= #2 BRANCH;
  LW                              : ID_Ex_type <= #2 LOAD;
  SW                              : ID_Ex_type <= #2 STORE;
  HLT                             : ID_Ex_type <= #2 HALT;
  default                         : ID_Ex_type <= #2 HALT;
  endcase
  end
end
//***************************************


//****** Execution / Effective address computation******
always@(posedge clk1)
begin
  if(halted == 0)
  begin
    EX_MEM_ir <= #2 ID_EX_ir;
    EX_MEM_b  <= #2 ID_EX_b;
    taken_branch <= #2 0;

    case(ID_Ex_type)
    RR_ALU      : case(ID_EX_ir[31:26])
                  ADD  : EX_MEM_ALUOut <= #2 ID_EX_a + ID_EX_b;
                  SUB  : EX_MEM_ALUOut <= #2 ID_EX_a - ID_EX_b;
                  AND  : EX_MEM_ALUOut <= #2 ID_EX_a & ID_EX_b;
                  OR   : EX_MEM_ALUOut <= #2 ID_EX_a | ID_EX_b;
                  SLT  : EX_MEM_ALUOut <= #2 ID_EX_a < ID_EX_b;
                  MUL  : EX_MEM_ALUOut <= #2 ID_EX_a * ID_EX_b;
                  default  : EX_MEM_ALUOut <= #2 32'hxxxxxxxx;
                  endcase

    RM_ALU      : case(ID_EX_ir[31:26])
                  ADDI  : EX_MEM_ALUOut <= #2 ID_EX_a + ID_EX_Imm;
                  SUBI  : EX_MEM_ALUOut <= #2 ID_EX_a - ID_EX_Imm;
                  SLTI  : EX_MEM_ALUOut <= #2 ID_EX_a < ID_EX_Imm;
                  default  : EX_MEM_ALUOut <= #2 32'hxxxxxxxx;
                  endcase

    BRANCH      : begin
                  EX_MEM_ALUOut <= ID_EX_npc + ID_EX_Imm;
                  EXE_MEM_cond  <= (ID_EX_a ==0);
                  end

    LOAD,STORE  : begin
                  EX_MEM_ALUOut <= ID_EX_a + ID_EX_Imm;
                  end

    endcase
  end
end
//********************************************************

//****** Memory Excess / Branch Completion ***************
always@(posedge clk2)
begin
  if(halted == 0)
  begin
    MEM_WB_type <= #2 EX_MEM_type;
    MEM_WB_ir     <= #2 EX_MEM_ir;
    case(EX_MEM_type)
    RM_ALU,RR_ALU       : MEM_WB_ALUOut <= #2 EX_MEM_ALUOut;

    LOAD                : MEM_WB_lmd    <= #2 mem_inst[EX_MEM_ALUOut];

    STORE               : if(taken_branch == 0)
                          mem_inst[EX_MEM_ALUOut] <= #2 EX_MEM_b;
    endcase
  end
end
//*******************************************************


//******* Write Back ************************************
always@(posedge clk1)
begin
case(MEM_WB_type)
RR_ALU        : reg_bank[MEM_WB_ir[15:11]] <= #2 MEM_WB_ALUOut;
RM_ALU        : reg_bank[MEM_WB_ir[20:16]] <= #2 MEM_WB_ALUOut;
LOAD          : reg_bank[MEM_WB_ir[15:11]] <= #2 MEM_WB_lmd;
HALT          : halted <= #2 1'b1;
endcase
end
//********************************************************

endmodule


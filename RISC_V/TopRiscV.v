module riscv_top (
    input clk,
    input reset
);
    wire [31:0] PC, PCPlus4, PCTarget, PCNext, Instr;
    wire [31:0] RD1, RD2, ImmExt, SrcB, ALUResult, ReadData, Result;
    wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch, Zero, Sign, PCSrc, load;
    wire [1:0] ImmSrc, ALUOp;
    wire [2:0] ALUControl;

  
    program_counter u_pc (.clk(clk), .reset(reset), .load(load), .PCnext(PCNext), .PC(PC));
    assign PCPlus4  = PC + 32'd4;
    assign PCTarget = PC + ImmExt;
    MUX u_pcmux (.A(PCPlus4), .B(PCTarget), .s(PCSrc), .z(PCNext));
   
    InstrMemory u_imem (.A(PC), .RD(Instr));


    Register_file u_rf (
        .clk(clk), .reset(reset), .Regwire(RegWrite),
        .A1(Instr[19:15]), .A2(Instr[24:20]), .A3(Instr[11:7]),
        .WD3(Result), .RD1(RD1), .RD2(RD2)
    );
    
   
    SignExtend u_ext (.Instr(Instr), .ImmScr(ImmSrc), .ImmExt(ImmExt));

    MainDecoder u_maindec (
        .opcode(Instr[6:0]), .RegWrite(RegWrite), .ImmSrc(ImmSrc), .ALUSrc(ALUSrc),
        .MemWrite(MemWrite), .ResultSrc(ResultSrc), .Branch(Branch), .ALUOp(ALUOp)
    );
    AluDecoder u_aludec (
        .ALUop(ALUOp), .funct3(Instr[14:12]), .op5(Instr[5]), .funct7b5(Instr[30]),
        .ALUControl(ALUControl)
    );
    BranchResolution u_br (.Branch(Branch), .Zero(Zero), .Sign(Sign), .funct3(Instr[14:12]), .PCSrc(PCSrc));
    
    
     assign load = (Instr != 32'b0);
    
    MUX u_srcbmux (.A(RD2), .B(ImmExt), .s(ALUSrc), .z(SrcB));

    ALU u_alu (
        .A(RD1), 
        .B(SrcB), 
        .ALU_control(ALUControl), 
        .ALU_result(ALUResult), 
        .zero_flag(Zero), 
        .sign_flag(Sign)
    );

  
    DataMemory u_dmem (.clk(clk), .WE(MemWrite), .A(ALUResult), .WD(RD2), .RD(ReadData));
    
  
    MUX u_resultmux (.A(ALUResult), .B(ReadData), .s(ResultSrc), .z(Result));
endmodule

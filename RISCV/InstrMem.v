module InstrMemory (
    input  wire [31:0] A,
    output wire [31:0] RD
);
    reg [31:0] InstrMem [0:63];
    initial $readmemh("program.hex", InstrMem);
    assign RD = InstrMem[A[7:2]];
endmodule

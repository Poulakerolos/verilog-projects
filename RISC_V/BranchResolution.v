module BranchResolution (
    input  Branch, Zero, Sign,
    input  [2:0] funct3,
    output reg PCSrc
);
    always @(*) begin
        if (!Branch)
            PCSrc = 1'b0;
        else
        case (funct3)
            3'b000: PCSrc = Zero;     // beq: taken when rs1-rs2 == 0
            3'b001: PCSrc = ~Zero;    // bne: taken when rs1-rs2 != 0
            3'b100: PCSrc = Sign;     // blt: taken when rs1-rs2 is negative
            default: PCSrc = 1'b0;
        endcase
    end
endmodule

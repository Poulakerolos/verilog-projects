module MainDecoder (
    input [6:0] opcode,
    output reg RegWrite,ALUSrc,MemWrite,ResultSrc,Branch,
    output reg [1:0] ImmSrc,ALUOp
);
    always@(*)begin
        case(opcode)
        7'b0000011: begin 
            RegWrite=1'b1; ImmSrc=2'b00; ALUSrc=1'b1; MemWrite=1'b0; ResultSrc=1'b1;
            Branch =1'b0; ALUOp=2'b00;
        end
        7'b0100011: begin 
            RegWrite=1'b0; ImmSrc=2'b01; ALUSrc=1'b1; MemWrite=1'b1; ResultSrc=1'b0;
            Branch =1'b0; ALUOp=2'b00;
        end

        7'b0110011: begin 
            RegWrite=1'b1; ImmSrc=2'b00; ALUSrc=1'b0; MemWrite=1'b0; ResultSrc=1'b0;
            Branch =1'b0; ALUOp=2'b10;
        end

        7'b0010011: begin 
            RegWrite=1'b1; ImmSrc=2'b00; ALUSrc=1'b1; MemWrite=1'b0; ResultSrc=1'b0;
            Branch =1'b0; ALUOp=2'b10;
        end

        7'b1100011: begin 
            RegWrite=1'b0; ImmSrc=2'b10; ALUSrc=1'b0; MemWrite=1'b0; ResultSrc=1'b0;
            Branch =1'b1; ALUOp=2'b01;
        end
    default: begin
            RegWrite=1'b0; ImmSrc=2'b10; ALUSrc=1'b0; MemWrite=1'b0; ResultSrc=1'b0;
            Branch =1'b0; ALUOp=2'b00;
        end
        endcase
    end
endmodule

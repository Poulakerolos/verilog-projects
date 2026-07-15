module AluDecoder (
    input wire [1:0] ALUop,
    input wire [2:0] funct3,
    input wire op5 ,
    input wire funct7b5 ,
    output reg [2:0] ALUControl
);
    always@(*)begin 
        case(ALUop)
        2'b00:ALUControl=3'b000;
        2'b01:ALUControl=3'b010;
        2'b10: begin
            case(funct3)
            3'b000: begin 
                    case({op5,funct7b5})
                    2'b11:ALUControl=3'b010;
                    default:ALUControl=3'b000;
                    endcase
                     end
            3'b001:ALUControl=3'b001;
            3'b100:ALUControl=3'b100;
            3'b101:ALUControl=3'b101;
            3'b110:ALUControl=3'b110;
            3'b111:ALUControl=3'b111;
            default :ALUControl=3'b000;
            endcase
        end
        default :ALUControl=3'b000;
        endcase
    end
endmodule

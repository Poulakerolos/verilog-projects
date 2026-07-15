module ALU (
     input wire [2:0] ALU_control
    ,input wire [31:0] A,B 
    ,output reg [31:0] ALU_result
    ,output wire zero_flag
    ,output wire sign_flag   
);
always@(*)begin 
case (ALU_control)
   3'b000 :ALU_result=A+B ;
   3'b001 :ALU_result=A<<B[4:0] ;
   3'b010 :ALU_result=A-B ;
   3'b100 :ALU_result=A^B ;
   3'b101 :ALU_result=A>>B[4:0] ;
   3'b110 :ALU_result=A|B ;
   3'b111 :ALU_result=A&B ;
    default: ALU_result=32'b0;
endcase
end
assign zero_flag=(ALU_result==32'b0);
assign sign_flag=ALU_result[31];
    
endmodule

module alu(
input [3:0] A,
input [3:0] B,
input CIN,
input [2:0] OPCODE,
input PASS_A,
input PASS_B, output reg [3:0] OUT, output reg COUT
);
reg [4:0] temp;
always @(*) begin
COUT = 1'b0;
if (PASS_A) begin
OUT = A;
end
else if (PASS_B) begin
OUT = B;
end
else begin
case (OPCODE)
3'b000: begin
temp = {1'b0, A} + {1'b0, B} + CIN; //casting the size of A and B to save the carry bit
OUT = temp[3:0];
COUT = temp[4];
end
3'b001: OUT = A - B;
3'b010: OUT = A * B;
3'b011: OUT = A & B;
3'b100: OUT = ~(A | B);
3'b101: OUT = A ^ B;
3'b110: OUT = A >> 1;//shift right
3'b111: OUT = A << 1;//shift left
default: OUT = 4'b0000;// to avoid Inferred Latch
endcase
end
end
endmodule
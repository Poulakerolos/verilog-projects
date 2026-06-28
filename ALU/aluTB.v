module ALU_TB;
//tb
reg[3:0] A;
reg [3:0] B;
reg CIN;
reg [2:0] OPCODE;
reg PASS_A;
reg PASS_B;
wire [3:0] OUT;
wire COUT;
//repeat
reg [3:0] rA, rB;
reg rCIN, rPASS_A, rPASS_B;
reg [2:0] rOPCODE;
alu DUT(
.A(A),
.B(B),
.CIN(CIN),
.OPCODE(OPCODE),
.PASS_A(PASS_A),
.PASS_B(PASS_B),
.OUT(OUT),
.COUT(COUT)
);
task apply_and_check ;
input [3:0] A_TB;
input [3:0] B_TB;
input CIN_TB;
input [2:0] OPCODE_TB;
input PASS_A_TB;
input PASS_B_TB;
reg [3:0] OUT_TB;
reg COUT_TB;
reg [4:0] temp;
begin
A=A_TB;
B=B_TB;
CIN=CIN_TB;
OPCODE=OPCODE_TB;
PASS_A=PASS_A_TB;
PASS_B=PASS_B_TB;
#10
COUT_TB='b0;
if (PASS_A_TB) begin
OUT_TB = A_TB;
end
else if (PASS_B_TB) begin
OUT_TB = B_TB;
end
else begin
case (OPCODE_TB)
3'b000: begin
temp = {1'b0, A_TB} + {1'b0, B_TB} + CIN_TB;
OUT_TB = temp[3:0];
COUT_TB = temp[4];
end

3'b001: OUT_TB = A_TB - B_TB;
3'b010: OUT_TB = A_TB * B_TB;
3'b011: OUT_TB = A_TB & B_TB;
3'b100: OUT_TB = ~(A_TB | B_TB);
3'b101: OUT_TB = A_TB ^ B_TB;
3'b110: OUT_TB = A_TB >> 1;
3'b111: OUT_TB = A_TB << 1;
default: OUT_TB = 4'b0000;
endcase
end
if (OUT !== OUT_TB || COUT !== COUT_TB) begin
$display("Test failed ");
end else begin
$display("Test passed");
end
end
endtask
integer i;
initial begin
for(i=0;i<8;i=i+1) begin
apply_and_check(4'b0110, 4'b0011, 1'b0, i[2:0], 1'b0, 1'b0);
end
repeat(100) begin
rA=$random;
rB=$random;
rCIN=$random;
rOPCODE=$random;
rPASS_A=$random;
rPASS_B=$random;
apply_and_check(rA,rB,rCIN,rOPCODE,rPASS_A,rPASS_B);
end
end
endmodule

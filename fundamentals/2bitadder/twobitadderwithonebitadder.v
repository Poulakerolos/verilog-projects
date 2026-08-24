module counter2bit(
    input wire [1:0] A, B,
    output wire [2:0] out
);
 wire carry;
adder u0(.A(A[0]), .B(B[0]), .Cin(1'b0), .Sum(out[0]), .Cout(carry));
adder u1(.A(A[1]), .B(B[1]), .Cin(carry), .Sum(out[1]), .Cout(out[2]));
endmodule
module adder(
    input wire A, B, Cin,
    output wire Sum, Cout
);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule
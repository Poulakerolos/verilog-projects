module top(
    input wire [1:0] A, B,
    output wire [6:0] seg
);
    wire E, L, S;
    comparator u0(.A(A), .B(B), .E(E), .L(L), .S(S));
    seg_decoder u1(.E(E), .L(L), .S(S), .seg(seg));
endmodule
module MUX (
    input wire [31:0] A,B,
    input wire s,
    output wire [31:0] z
);
assign z = s ? B : A;
endmodule

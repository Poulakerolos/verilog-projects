module mux(
    input wire A,B,sel,
    output wire out
);
assign out=sel?A:B;
endmodule
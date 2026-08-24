module comparator(
    input wire [1:0] A,B,
    output wire E,L,S
);
assign E=(A==B);
assign L=(A > B);
assign S=(A<B);
endmodule
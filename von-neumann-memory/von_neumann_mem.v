module von_neumann_mem #(
    parameter WIDTH = 8,
    parameter DEPTH = 32
)(
    input clk,
    input w_en,
    input Rst_n,
    input [$clog2(DEPTH/2)-1:0] I_addr,
    input [$clog2(DEPTH/2)-1:0] D_addr,
    input [WIDTH-1:0] w_data,
    output [WIDTH-1:0] I_data,
    output [WIDTH-1:0] D_data
);
    localparam HALF = DEPTH/2;
    reg [WIDTH-1:0] mem [0:DEPTH-1];
    integer i;

    always @(posedge clk or negedge Rst_n) begin
        if (!Rst_n)
            for (i = 0; i < DEPTH; i = i + 1)
                mem[i] <= {WIDTH{1'b0}};
        else if (w_en)
            mem[D_addr + HALF] <= w_data;
    end

    assign I_data = mem[I_addr];
    assign D_data = mem[D_addr + HALF];
endmodule

module stack #(
    parameter WIDTH = 8,
    parameter DEPTH = 8
)(
    input clk,
    input rst,
    input push,
    input pop,
    input [WIDTH-1:0] data_in,
    output [WIDTH-1:0] data_out,
    output empty,
    output full,
    output [$clog2(DEPTH+1)-1:0] stack_ptr
);

    reg [$clog2(DEPTH+1)-1:0] ptr;
    reg [WIDTH-1:0] mem [0:DEPTH-1];

    assign stack_ptr = ptr;
    assign full = (ptr == DEPTH);
    assign empty = (ptr == 0);
    assign data_out = empty ? {WIDTH{1'b0}} : mem[ptr-1];

    always @(posedge clk or negedge rst) begin
        if (!rst)
            ptr <= 0;
        else begin
            case ({push, pop})
                2'b10: if (!full) begin
                    mem[ptr] <= data_in;
                    ptr <= ptr + 1;
                end
                2'b01: if (!empty)
                    ptr <= ptr - 1;
                2'b11: if (!empty)
                    mem[ptr-1] <= data_in;
                default: ;
            endcase
        end
    end
endmodule

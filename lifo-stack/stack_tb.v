module stack_tb;
    parameter WIDTH = 8;
    parameter DEPTH = 8;
    reg clk, rst, push, pop;
    reg [WIDTH-1:0] data_in;
    wire [WIDTH-1:0] data_out;
    wire empty, full;
    wire [$clog2(DEPTH+1)-1:0] stack_ptr;

    stack #(.WIDTH(WIDTH), .DEPTH(DEPTH)) dut (
        .clk(clk), .rst(rst), .push(push), .pop(pop), .data_in(data_in),
        .data_out(data_out), .empty(empty), .full(full), .stack_ptr(stack_ptr)
    );

    initial begin clk = 0; forever #5 clk = ~clk; end
    integer i, errors;
    initial begin
        errors = 0; rst = 0; push = 0; pop = 0; data_in = 0;
        #12;
        if (empty !== 1'b1 || full !== 1'b0) errors = errors + 1;
        rst = 1; @(negedge clk);
        if (empty !== 1'b1) errors = errors + 1;
        for (i = 0; i < DEPTH; i = i + 1) begin
            @(negedge clk); push = 1; pop = 0; data_in = i + 8'h10;
        end
        @(negedge clk); push = 0;
        if (full !== 1'b1 || data_out !== (DEPTH - 1 + 8'h10)) errors = errors + 1;
        @(negedge clk); push = 1; data_in = 8'hFF;
        @(negedge clk); push = 0;
        if (data_out !== (DEPTH - 1 + 8'h10)) errors = errors + 1;
        for (i = DEPTH - 1; i >= 0; i = i - 1) begin
            @(negedge clk); pop = 1;
            if (data_out !== (i + 8'h10)) errors = errors + 1;
            @(negedge clk); pop = 0;
        end
        if (empty !== 1'b1) errors = errors + 1;
        @(negedge clk); pop = 1; @(negedge clk); pop = 0;
        if (empty !== 1'b1) errors = errors + 1;
        if (errors == 0) $display("TESTBENCH RESULT: ALL TESTS PASSED");
        else $display("TESTBENCH RESULT: %0d TEST(S) FAILED", errors);
        $finish;
    end
endmodule

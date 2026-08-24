module top(
    input wire clkin,
    input wire rst,
    input wire up, down, reset,
    output wire [3:0] out
);
    wire slow_clk;

    clk_divider u_clk_div (
        .clkin  (clkin),
        .rst    (rst),
        .clkout (slow_clk)
    );

    counter u_counter (
        .clk   (slow_clk),
        .up    (up),
        .down  (down),
        .reset (reset),
        .out   (out)
    );

endmodule
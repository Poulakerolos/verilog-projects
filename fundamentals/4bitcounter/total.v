module clk_divider(
    input clkin, rst,
    output reg clkout
);
    reg [24:0] count;
    
    always @(posedge clkin or negedge rst) begin
        if (~rst) begin
            count  <= 25'd0;
            clkout <= 1'b0;
        end
        else begin
            if (count == 25'd24_999_999) begin
                count  <= 25'd0;
                clkout <= ~clkout;
            end
            else begin
                count <= count + 1'b1;
            end
        end
    end
endmodule

module counter(
    input wire clk,
    input wire up, down, reset,
    output reg [3:0] out
);
always @(posedge clk) begin
    if(reset)
        out <= 4'b0000;
    else if(up) begin
        if(out == 4'b1111)
            out <= 4'b0000;
        else
            out <= out + 1;
    end
    else if(down) begin
        if(out == 4'b0000)
            out <= 4'b1111;
        else
            out <= out - 1;
    end
end
endmodule
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
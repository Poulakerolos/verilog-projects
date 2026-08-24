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
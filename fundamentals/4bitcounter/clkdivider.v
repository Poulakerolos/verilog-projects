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
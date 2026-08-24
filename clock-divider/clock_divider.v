module clock_divider #(parameter WIDTH = 8)(
    input  wire             clk_in,
    input  wire             rst_n,      
    input  wire [WIDTH-1:0] divisor,    // N
    input  wire             clk_en,
    output wire             clk_out
);
 
    wire [WIDTH-1:0] n_eff = (divisor == {WIDTH{1'b0}}) ? {{(WIDTH-1){1'b0}}, 1'b1} : divisor;
    wire passthrough = (divisor == {WIDTH{1'b0}}) || (divisor == {{(WIDTH-1){1'b0}}, 1'b1});
    wire [WIDTH-1:0] high_thresh = (n_eff + 1'b1) >> 1;
 
    reg [WIDTH-1:0] count;
    reg             div_clk;
 
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            count   <= {WIDTH{1'b0}};
            div_clk <= 1'b0;
        end else if (clk_en) begin
            div_clk <= (count < high_thresh);
            if (count == n_eff - 1'b1)
                count <= {WIDTH{1'b0}};
            else
                count <= count + 1'b1;
        end else begin
            count   <= {WIDTH{1'b0}};
            div_clk <= 1'b0;
        end
    end
 assign clk_out = clk_en ? (passthrough ? clk_in : div_clk) : 1'b0;
endmodule

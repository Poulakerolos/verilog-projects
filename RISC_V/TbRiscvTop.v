
`timescale 1ns/1ps

module tb_riscv_top;
    reg clk;
    reg reset;

    riscv_top dut (
        .clk(clk),
        .reset(reset)  
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    initial begin
    reset = 1'b0; // hold reset
    #12
    reset=1'b1;
      #2000
        $stop;
    end
endmodule

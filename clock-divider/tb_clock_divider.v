`timescale 1ns/1ps
 
module tb_clock_divider;
 
    parameter WIDTH      = 8;
    parameter CLK_PERIOD = 10; // 100 MHz source clock
 
    reg               clk_in;
    reg               rst_n;
    reg  [WIDTH-1:0]  divisor;
    reg               clk_en;
    wire              clk_out;
 
    integer test_case;
 
    clock_divider #(.WIDTH(WIDTH)) DUT (
        .clk_in  (clk_in),
        .rst_n   (rst_n),
        .divisor (divisor),
        .clk_en  (clk_en),
        .clk_out (clk_out)
    );
 
    initial clk_in = 1'b0;
    always #(CLK_PERIOD/2) clk_in = ~clk_in;
 
    task do_reset;
        begin
            rst_n = 1'b0;
            #(CLK_PERIOD*2);
            rst_n = 1'b1;
        end
    endtask
 
    initial begin
        $dumpfile("tb_clock_divider.vcd");
        $dumpvars(0, tb_clock_divider);
 
        test_case = 0;
        rst_n     = 1'b0;
        clk_en    = 1'b0;
        divisor   = {WIDTH{1'b0}};
        #(CLK_PERIOD*2);
 
        // Case 1: Even Division, N = 4 
        test_case = 1;
        do_reset;
        divisor = 4; clk_en = 1'b1;
        #(CLK_PERIOD*20);
 
        //  Case 2: Odd Division, N = 5
        test_case = 2;
        do_reset;
        divisor = 5; clk_en = 1'b1;
        #(CLK_PERIOD*25);
 
        // Case 3: Divisor = 0 (pass-through) 
        test_case = 3;
        do_reset;
        divisor = 0; clk_en = 1'b1;
        #(CLK_PERIOD*10);
 
        // Case 4: Divisor = 1 (pass-through) 
        test_case = 4;
        do_reset;
        divisor = 1; clk_en = 1'b1;
        #(CLK_PERIOD*10);
 
        //  Case 5: clk_en gating mid-operation
        test_case = 5;
        do_reset;
        divisor = 4; clk_en = 1'b1;
        #(CLK_PERIOD*8);
        clk_en = 1'b0;
        #(CLK_PERIOD*8);
        clk_en = 1'b1;
        #(CLK_PERIOD*8);
 
        $display("All test cases completed.");
        $finish;
    end
 
endmodule

/*Build a 64-bit arithmetic shift register, with synchronous load. The shifter can
shift both left and right, and by 1 or 8 bit positions, selected by signal amount.

An arithmetic right shift shifts in the sign bit of the number in the shift register
(q[63] in this case) instead of zero as done by a logical right shift. Another way of
thinking about an arithmetic right shift is that it assumes the number being
shifted is signed and preserves the sign, so that arithmetic right shift divides a
signed number by a power of two.
There is no difference between logical and arithmetic left shifts.
Verify your code with testbench.
Inputs:
 load: Loads shift register with data[63:0] instead of shifting.
 en: Chooses whether to shift or not.
 amount: Chooses which direction and how much to shift.
o 2'b00: shift left by 1 bit.
o 2'b01: shift left by 8 bits.
o 2'b10: shift right by 1 bit.
o 2'b11: shift right by 8 bits.

Output:
 q: The contents of the shifter.*/


module shiftREG(
    input  [63:0] data,    // value to load
    input         load,    // synchronous load enable
    input         en,      // shift enable
    input  [1:0]  amount,  // shift direction + magnitude select
    input         clk,
    output reg [63:0] q   // register contents = output (same thing)
);always @(posedge clk) begin
    if (load)
        q <= data;
    else if (en) begin
        case (amount)
            2'b00: q <= q << 1;
            2'b01: q <= q << 8;
            2'b10: q <= {q[63], q[63:1]};
            2'b11: q <= {{8{q[63]}}, q[63:8]};
        endcase
    end
end
endmodule
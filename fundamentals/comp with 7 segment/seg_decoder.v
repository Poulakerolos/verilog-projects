module seg_decoder(
    input wire E, L, S,
    output reg [6:0] seg  // abcdefg active high
);
    always @(*) begin
        case({E, L, S})
            3'b100: seg = 7'b1000000; // E → display "="  approximated as "0"
            3'b010: seg = 7'b1001111; // L → display "1" (A>B)
            3'b001: seg = 7'b1100000; // S → display "2" (A<B)  
            default: seg = 7'b0000000;
        endcase
    end
endmodule
module moore_nonoverlapping(input clk, reset, in, output out);
    parameter A=0, B=1, C=2, D=3;
    reg [1:0] state, next_state;
    assign out = (state == D);

    always @(posedge clk or posedge reset) begin
        if (reset) state <= A;
        else state <= next_state;
    end

    always @(*) begin
        case(state)
            A: next_state = in ? B : A;
            B: next_state = in ? B : C;
            C: next_state = in ? D : A;
            D: next_state = A;
            default: next_state = A;
        endcase
    end
endmodule
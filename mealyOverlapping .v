module mealy_overlapping(input clk, reset, in, output reg out);
    parameter A = 2'b00,
              B = 2'b01,
              C = 2'b10;
    reg [1:0] current_state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset) state <= A;
        else current_state <= next_state;
    end

    always @(*) begin
        case(state)
            A: begin next_state = in ? B : A; out = 0; end
            B: begin next_state = in ? C : A; out = 0; end
            C: begin next_state = in ? B : A; out = in ? 1 : 0; end
            default: next_state = A;
        endcase
    end
endmodule
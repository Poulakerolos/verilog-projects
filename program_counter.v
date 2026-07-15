module program_counter (
    input wire clk,reset,load,
    input wire [31:0] PCnext,
    output reg [31:0] PC
);
always@(posedge clk or negedge  reset )begin
    if(!reset)
    PC<=32'b0;
    else if(load)
    PC<=PCnext;
end

    
endmodule

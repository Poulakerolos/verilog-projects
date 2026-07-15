module DataMemory (
    input clk,WE,
    input [31:0] WD,
    input [31:0] A ,
    output [31:0] RD
);
    reg [31:0]mem[0:63];
    assign RD=mem[A[7:2]]; 
    integer i;

initial begin
    for(i=0;i<64;i=i+1)
        mem[i]=32'b0;
end
    always@(posedge clk)begin 
        if(WE)
            mem[A[7:2]]<=WD;
end
endmodule

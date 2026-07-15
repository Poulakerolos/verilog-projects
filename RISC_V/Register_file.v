module Register_file (
     input wire clk
    ,input wire reset
    ,input wire Regwire
    ,input wire [4:0] A1,A2,A3
    ,input wire [31:0] WD3
    ,output wire [31:0] RD1,RD2
);
reg [31:0] File [31:0];
assign RD1=(A1==5'b0)? 32'b0:File[A1];
assign RD2=(A2==5'b0)? 32'b0:File[A2];
integer i;

initial begin
    for(i=0;i<32;i=i+1)
        File[i]=0;
end
always@(posedge clk or negedge reset)begin
    if(!reset) begin
    for(i=0;i<32;i=i+1)
    File[i]<=32'b0;
    end
    else if(Regwire && A3!=5'b0)
    File[A3]<=WD3; 
end
    
endmodule

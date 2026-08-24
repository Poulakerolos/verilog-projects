module dual_port_ram #(parameter width =8 ,parameter depth =16)
(
    input wire clk,clear_memo,
    
    input wire wren_a,
    input wire[$clog2(depth)-1:0] addr_a,
    input wire[width-1:0] din_a,

    input wire wren_b,
    input wire[$clog2(depth)-1:0] addr_b,
    input wire[width-1:0] din_b,
    
    output wire[width-1:0] dout_a,
    output wire[width-1:0] dout_b
);
reg [width-1:0]memo[0:depth-1];

integer i;
always@(posedge clk,posedge clear_memo) begin
    if(clear_memo==1)
    begin
    for(i=0;i<depth;i=i+1)
    memo[i]<=0;
    end
else
 begin 
    if(wren_a)
    begin
        memo[addr_a]<=din_a;
    end    if(wren_b)
    begin
        memo[addr_b]<=din_b;
    end
end
end
assign dout_a=memo[addr_a];
assign dout_b=memo[addr_b];
endmodule
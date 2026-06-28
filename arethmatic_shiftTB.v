//keep going :)
module arethmaticTB ();
    reg  [63:0] data;   // value to load
    reg         load;    // synchronous load enable
    reg         en;      // shift enable
    reg  [1:0]  amount;  // shift direction + magnitude select
    reg         clk;
    wire [63:0] q;
//____________________________________________________________________________________________________//
    reg  [63:0] dataTB;    // value to load
    reg         loadTB;    // synchronous load enable
    reg         enTB;      // shift enable
    reg  [1:0]  amountTB;  // shift direction + magnitude select
    reg  [63:0] qTB;
//__________________________________________________________________________________________________//
shiftREG dut(.data(data),.load(load),.en(en),.amount(amount),.clk(clk),.q(q));
initial begin
    clk=0;
    forever #5 clk=~clk;
end
initial begin
    repeat(100)begin 
        dataTB=$random;
        loadTB=$random;
        enTB=$random;
        amountTB=$random;
//__________________________________________________________________________________________________//
        data=dataTB;
        load=loadTB;
        en=enTB;
        amount=amountTB;
//__________________________________________________________________________________________________//
        @(posedge clk)begin
        if (load)
        qTB <= data;
    else if (en) begin
        case (amount)
            2'b00: qTB <= qTB << 1;
            2'b01: qTB <= qTB << 8;
            2'b10: qTB <= {qTB[63], qTB[63:1]};
            2'b11: qTB <= {{8{qTB[63]}}, qTB[63:8]};
        endcase
    end
        end
        @(negedge clk)begin
            if(qTB!==q)begin
            $display("error:qTB=%b,q=%b",qTB,q);
            end
            else
            $display("pass");
        end
    end
end

    
endmodule

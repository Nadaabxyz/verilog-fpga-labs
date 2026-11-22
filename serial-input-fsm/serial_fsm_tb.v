module Mchine_tb(
    );
    reg rst,clk,x;
    wire y;
    
    reg [39:0] test=39'b0000010110000100010110001000110100000101;   
    
Machine uut(.y(y),.x(x),.clk(clk),.rst(rst));

always #5 clk = ~clk;
    integer i=0;
    initial begin                                                
       clk=0;
       rst=0;
       #75 rst = 1; #5; rst=0;
       #120 rst = 1; #5; rst=0;
       #105 rst = 1; #5; rst=0;
    end     
    always @(posedge clk) begin 
        x=test[39-i];
        i=i+1;
        if(i==40) begin
            $finish;
        end
    end      
endmodule

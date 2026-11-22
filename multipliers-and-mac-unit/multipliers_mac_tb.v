`timescale 1ns / 1ps

module tb_MULTS(
    );
    reg [7:0]A,X;
    wire [15:0]R;

//    MULTS uut(.A(A),.X(X),.result(R));
   MULTS_signed uut(.A(A),.X(X),.result(R));
//    MULTB uut(.A(A),.B(X),.result(R));
    initial begin
  
        A=8'b0000_0000; X=8'b0000_0000; #10;
       
            
        A=8'd3; X=8'd7; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
        A=8'd11; X=8'd6; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
//        A=8'd22; X=8'd13; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
//        A=8'd144; X=8'd335; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
        A=-8'd22; X=8'd13; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
        A=8'd144; X=-8'd335; #10;$display("A=%d,X=%d,Result=%d,",A,X,R);
        
        #10;
        $finish;
    end
endmodule




module MAC_tb(
    );
    reg clk,rst;
    wire  [19:0] result;
    reg [23:0] weight;
    reg [23:0] data;
    
    MAC uut(.clk(clk),.rst(rst),.data(data),.weight(weight),.result(result));
 
    initial 
    begin
        rst=1'b0;
        data=24'd0; weight=-24'd1; 
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd4; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd0; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd2; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd1; weight=-24'd8;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd0; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd9; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd1; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        data=24'd5; weight=-24'd1;
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10
        clk=1'b0; #10
        clk=1'b1; #10        
        
        $finish;

    end
endmodule
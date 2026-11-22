`timescale 1ns / 1ps

//module SRLatch_tb;
//    reg S, R;
//    wire Q, Qn;
  
//    SRLatch uut (.S(S),.R(R),.Q(Q),.Qn(Qn) );

//    initial begin
//        S= 1; R= 0; #10; $display("S=1, R=0: Q=%b Qn=%b", Q, Qn);
//        S= 1; R= 1; #10; $display("S=1, R=1: Q=%b Qn=%b", Q, Qn);
//        S= 0; R= 1; #10; $display("S=0, R=1: Q=%b Qn=%b", Q, Qn);        
//        S= 1; R= 1; #10; $display("S=1, R=1: Q=%b Qn=%b", Q, Qn);    
//        S= 0; R= 0; #10; $display("S=0, R=0: Q=%b Qn=%b", Q, Qn);

//        $stop;
//    end

//endmodule

////////////////////////////////////////////////////////////////////////////////////

//module DFlipFlop_tb;

//    reg CLK, D;
//    wire Q, Qn;

//    DFlipFlop uut (.CLK(CLK), .D(D), .Q(Q), .Qn(Qn));

//    initial begin
//        CLK = 1; D = 0; #10; $display("CLK=1, D=0: Q=%b Qn=%b", Q, Qn);
//        CLK = 0; D = 1; #10; $display("CLK=0, D=1: Q=%b Qn=%b", Q, Qn);
//        CLK = 1; D = 1; #10; $display("CLK=1, D=1: Q=%b Qn=%b", Q, Qn);
//        CLK = 0; D = 0; #10; $display("CLK=0, D=0: Q=%b Qn=%b", Q, Qn);
        

//        $stop;
//    end

//endmodule

//////////////////////////////////////////////////////////////////////////

//module D_Master_slave_tb;

//    reg CLK, D;
//    wire Q, Qn;

//    D_Master_slave uut (.CLK(CLK), .D(D), .Q(Q), .Qn(Qn));

//    initial begin
//        CLK = 1; D = 0; #10; $display("CLK=1, D=0: Q=%b Qn=%b", Q, Qn);
//        CLK = 0; D = 1; #10; $display("CLK=0, D=1: Q=%b Qn=%b", Q, Qn);
//        CLK = 1; D = 1; #10; $display("CLK=1, D=1: Q=%b Qn=%b", Q, Qn);
//        CLK = 0; D = 0; #10; $display("CLK=0, D=0: Q=%b Qn=%b", Q, Qn);
        

//        $stop;
//    end

//endmodule

/////////////////////////////////////////////////////////

//module DFF_behavioral_tb;

//    reg clk, D;
//    wire Q, Qn;

//    DFF_behavioral uut (.clk(clk), .D(D), .Q(Q), .Qn(Qn));

//    initial begin
//        clk = 1; D = 0; #10; $display("CLK=1, D=0: Q=%b Qn=%b", Q, Qn);
//        clk = 0; D = 1; #10; $display("CLK=0, D=1: Q=%b Qn=%b", Q, Qn);
//        clk = 1; D = 1; #10; $display("CLK=1, D=1: Q=%b Qn=%b", Q, Qn);
//        clk = 0; D = 0; #10; $display("CLK=0, D=0: Q=%b Qn=%b", Q, Qn);

//        $stop;
//    end

//endmodule
////////////////////////////////////////////////////////
module MyModule_tb;

  reg [7:0] IN;
  reg CLK;
  reg CLEAR;
  wire [7:0] OUT;

  Bit_REG uut (
    .IN(IN),
    .CLK(CLK),
    .CLEAR(CLEAR),
    .OUT(OUT)
  );

  initial begin
    IN = 8'b10101010;
    CLK = 0;
    CLEAR = 1; // Initialize CLEAR to 1

    #1 $display("Initial: OUT=%b", OUT);

    #10 CLEAR <= 0;
    #20 CLEAR <= 1;
    #10 IN <= 8'b11001100;

    $display("Case 1: OUT=%b", OUT);

    #10 IN <= 8'b00110011;
    $display("Case 2: OUT=%b", OUT);

    #10 CLK <= 1; #10 CLK <= 0;
    $display("Case 3: OUT=%b", OUT);

    #10 CLEAR <= 1;
    #10 CLEAR <= 0;
    #10 IN <= 8'b01010101;
    $display("Case 4: OUT=%b", OUT);

    #100 $finish;
  end

endmodule
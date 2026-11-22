`timescale 1ns / 1ps
//module ha_tb;
//  reg x, y;
//  wire cout, s;

//  HA ha_inst (.x(x), .y(y), .cout(cout), .s(s));

//  initial begin
//    $display("Testing Half Adder (HA) Module");

//    x = 0; y = 0; #10 $display("Input: x=%b, y=%b, Sum=%b, Cout=%b", x, y, s, cout);
//    x = 0; y = 1; #10 $display("Input: x=%b, y=%b, Sum=%b, Cout=%b", x, y, s, cout);
//    x = 1; y = 0; #10 $display("Input: x=%b, y=%b, Sum=%b, Cout=%b", x, y, s, cout);
//    x = 1; y = 1; #10 $display("Input: x=%b, y=%b, Sum=%b, Cout=%b", x, y, s, cout);

//    #10 $finish;
//  end
//endmodule

///////////////////////////////////////////////////////////////////////////////////////////////
module FA_tb;
  reg x, y, ci;
  wire s, cout;

  FA fa_inst (.x(x), .y(y), .ci(ci), .s(s), .cout(cout));

  initial begin
    $display("Testing Full Adder (FA) Module");

    x = 0; y = 0; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 0; y = 0; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 0; y = 1; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 0; y = 1; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 1; y = 0; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 1; y = 0; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 1; y = 1; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
    x = 1; y = 1; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);


    #10 $finish;
  end
endmodule
///////////////////////////////////////////////////////////////////////////////////////////////


//module tb_RCA;


//  reg [3:0] x, y;
//  reg ci;

 
//  wire cout;
//  wire [3:0] s;

//  RCA uut (
//    .x(x),
//    .y(y),
//    .ci(ci),
//    .cout(cout),
//    .s(s)
//  );

//  reg clk = 0;
//  always #5 clk = ~clk;

//  initial begin
   
//    x = 4'b0000;
//    y = 4'b0000;
//    ci = 0;

//    repeat (2**4) begin
      
//      #10 x = x + 1;
//      y = x; 
//      #10 ci = ci + 1;
//    end

//    #10 $finish;
//  end

//endmodule


///////////////////////////////////////
//module P_RCA_tb;
//    reg [3:0] x, y;
//    reg ci;
//    wire [3:0] s;
//    wire cout;

//    parametric_RCA #(4) uut (
//        .x(x),
//        .y(y),
//        .ci(ci),
//        .cout(cout),
//        .s(s)
//    );

//    initial begin
//        $display("Testing parametric_RCA Module");

//        x = 4'b0000; y = 4'b0000; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 4'b0101; y = 4'b1100; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 4'b1010; y = 4'b0111; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 4'b1111; y = 4'b0001; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 4'b1101; y = 4'b1011; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);


//        #10 $finish;
//    end	
//endmodule


//module P_RCA_tb;
//    reg [7:0] x, y;
//    reg ci;
//    wire [7:0] s;
//    wire cout;

//    parametric_RCA #(8) uut (
//        .x(x),
//        .y(y),
//        .ci(ci),
//        .cout(cout),
//        .s(s)
//    );

//    initial begin
//        $display("Testing parametric_RCA Module");

//        x = 8'b00000000; y = 8'b00000000; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 8'b01010011; y = 8'b11001111; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 8'b10101010; y = 8'b01110110; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 8'b10010110; y = 8'b00011101; ci = 0; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);
//        x = 8'b11010101; y = 8'b10011001; ci = 1; #10 $display("Input: x=%b, y=%b, ci=%b, Sum=%b, Cout=%b", x, y, ci, s, cout);


//        #10 $finish;
//    end
//endmodule


//////////////////////////////////////////////////////



//module CLA_tb;

//  reg [3:0] x, y;
//  reg c0;
//  reg clk = 0;
//  wire cout;
//  wire [3:0] sum;

//  CLA uut (
//    .x(x),
//    .y(y),
//    .c0(c0),
//    .cout(cout),
//    .sum(sum)
//  );

//  always #5 clk = ~clk;

//  initial begin
//    $monitor("Time=%0t Input: x=%b, y=%b, c0=%b | Output: cout=%b, sum=%b", $time, x, y, c0, cout, sum);
//        x = 4'b0000; y = 4'b0000; c0 = 0;
//    #10 x = 4'b1101; y = 4'b1010; c0 = 1;

//    #10 x = 4'b0100; y = 4'b0011; c0 = 0;

//    #10 x = 4'b1111; y = 4'b0001; c0 = 1;

//    #10 $stop;
//  end

//endmodule






////////////////////////////////////////////////////////////////////////////////






module tb_Add_Sub;

  reg [3:0] A, B;
  reg ci;
  wire [3:0] SUM;
  wire cout, V;

  Add_Sub uut(.A(A), .B(B), .ci(ci), .SUM(SUM), .cout(cout), .V(V));

  initial begin
    // Test cases
    for (A = -8; A <= 7; A = A + 1) begin
      for (B = -8; B <= 7; B = B + 1) begin
        for (ci = 0; ci <= 1; ci = ci + 1) begin
          #10;
          $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);
        end
      end
    end

    A = 4'b0111; B = 4'b0100; ci = 0; #10; // A=7, B=4, Cin=0 (no overflow)
    $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);

    A = 4'b0111; B = 4'b0100; ci = 1; #10; // A=7, B=4, Cin=1 (overflow)
    $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);

    A = 4'b1111; B = 4'b0001; ci = 0; #10; // A=-1, B=1, Cin=0 (no overflow)
    $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);

    A = 4'b0100; B = 4'b0111; ci = 0; #10; // A=4, B=7, Cin=0 (no overflow)
    $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);

    A = 4'b1000; B = 4'b1000; ci = 1; #10; // A=-8, B=-8, Cin=1 (overflow)
    $display("A=%4d, B=%4d, Cin=%1b, SUM=%4d, cout=%1b, V=%1b", A, B, ci, SUM, cout, V);

    $finish;
  end

endmodule
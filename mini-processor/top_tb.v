`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 09:31:24 PM
// Design Name: 
// Module Name: Top_Module_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

//module Top_Module_tb;
//    reg clk,rst,start;
//    reg [7:0] InA,InB;
//    wire [7:0] out;
//    wire busy;

//    TOP top(.clk(clk),.rst(rst),.start(start),.InA(InA),.InB(InB),.out(out),.busy(busy));

//    initial begin
//        clk=1'b0;
//        rst=1'b1;
//        #5;
//    end
//    always begin
//        clk =~clk;
//        #5;
//    end

//    initial begin
//        rst=1'b0;
//        #5;
//        InA = 8'b000000;
//        InB = 8'd43;
//        start = 1'b1;
//        #200;
//        $finish;
//    end
//endmodule

module tb;
    reg clk, rst, start;
    reg [5:0] InA, InB;
    wire [7:0] out;
    wire busy;

    TOP top(.clk(clk), .rst(rst), .start(start), .InA(InA), .InB(InB), .out(out), .busy(busy));

    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #5;
    end

    always begin
        clk =~clk;
        #5;
    end

    initial begin
        rst = 1'b0;
        #5;
        InA = 8'b11100111; InB = 8'b00001111; start = 1'b1; #1000; $display("Time=%t, InA=%b, InB=%b, out=%b, Correct=%s", $time, InA, InB, out, (out == (InA - 3 * InB)) ? "True" : "False");
        InA = 8'b0; InB = 8'b11111111; start = 1'b1; #1000; $display("Time=%t, InA=%b, InB=%b, out=%b, Correct=%s", $time, InA, InB, out, (out == (InA - 3 * InB)) ? "True" : "False");
        InA = 8'b00101010; InB = 8'b01010101; start = 1'b1; #1000; $display("Time=%t, InA=%b, InB=%b, out=%b, Correct=%s", $time, InA, InB, out, (out == (InA - 3 * InB)) ? "True" : "False");

        $finish;
    end
endmodule
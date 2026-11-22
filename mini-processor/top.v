`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 07:41:34 PM
// Design Name: 
// Module Name: Top_Module
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



module TOP(
    input clk,rst,start,
    input [5:0] InA,InB,
    output signed [7:0] out,
    output busy
    );
    wire CO,Z,WE;
    wire [1:0] InsSel;
    wire [7:0] CUconst,ALUinA,ALUinB,ALUout;
    wire [2:0] InMuxAdd;
    wire [3:0] OutMuxAdd,RegAdd;
    CU cu(.clk(clk),.reset(rst),.Z(Z),.CO(CO),.start(start),.InsSel(InsSel),.WE(WE),.busy(busy),.InMuxAdd(InMuxAdd),.CUconst(CUconst),.OutMuxAdd(OutMuxAdd),.RegAdd(RegAdd));
    ALU alu(.ALUinA(ALUinA),.ALUinB(ALUinB),.InsSel(InsSel),.ALUout(ALUout),.CO(CO),.Z(Z));
    RB rb(.clk(clk),.reset(rst),.WE(WE),.InA(InA),.InB(InB),.CUconst(CUconst),.ALUout(ALUout),.InMuxAdd(InMuxAdd),.RegAdd(RegAdd),.OutMuxAdd(OutMuxAdd),.Out(out),.ALUinA(ALUinA),.ALUinB(ALUinB));

endmodule

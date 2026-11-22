`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/20/2024 07:32:42 PM
// Design Name: 
// Module Name: RB
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
module RB(
    input clk,
	input reset,
	input [5:0]InA,InB, 
	input [7:0]CUconst,ALUout, 
	input [2:0]InMuxAdd, 
	input WE, 
	input [3:0]RegAdd,OutMuxAdd,  
	output signed [7:0] Out,
	output [7:0] ALUinA,
	output [7:0] ALUinB 
	);
	
	wire [15:0] Decod_Out;          
	wire [7:0] MUXOut2;              
	wire [7:0] MUXOut1;               
	wire [127:0] RegOut;    

    (* dont_touch="true" *)    Decoder DEC1 (WE, RegAdd, Decod_Out);
    (* dont_touch="true" *)    MUX8_8bit MUX1  (InMuxAdd, InA, InB, CUconst, ALUout, MUXOut2, MUXOut2, MUXOut2, MUXOut2, MUXOut1);
    (* dont_touch="true" *)    MUX16_8bit MUX2 (OutMuxAdd,RegOut[7:0]
                                                  ,RegOut[15:8] 
                                                  ,RegOut[23:16] 
                                                  ,RegOut[31:24] 
                                                  ,RegOut[39:32] 
                                                  ,RegOut[47:40] 
                                                  ,RegOut[55:48] 
                                                  ,RegOut[63:56] 
                                                  ,RegOut[71:64] 
                                                  ,RegOut[79:72] 
                                                  ,RegOut[87:80] 
                                                  ,RegOut[95:88] 
                                                  ,RegOut[103:96] 
                                                  ,RegOut[111:104] 
                                                  ,RegOut[119:112] 
                                                  ,RegOut[127:120], MUXOut2);                
   genvar i;
    generate
       for (i=0; i < 16; i=i+1)
       begin: Registers
          (* dont_touch="true" *) Reg REG( Decod_Out[i], clk, reset, MUXOut1,RegOut[(8*i+7):(8*i)]);
       end
    endgenerate 

	assign Out = RegOut[7:0];
	assign ALUinA = RegOut[15:8]; 
	assign ALUinB = RegOut[23:16]; 

endmodule

module MUX8_8bit(
    input [2:0] InsSel,
    input [5:0] i1,
    input [5:0] i2,
    input [7:0] i3,
    input [7:0] i4,
    input [7:0] i5,
    input [7:0] i6,
    input [7:0] i7,
    input [7:0] i8,
    output reg [7:0] r
  ); 
    
   always @(*)
       case (InsSel)
          3'b000: r = i1;
          3'b001: r = i2;
          3'b010: r = i3;
          3'b011: r = i4;
          3'b100: r = i5;
          3'b101: r = i6;
          3'b110: r = i7;
          3'b111: r = i8;
       endcase    
    
endmodule

module Decoder(
    input  WE,
    input [3:0] RegAdd,
    output reg [15:0] r
  ); 

  always @(*)
      if (WE == 1'b0) begin
         r <= 16'h0000;
      end
      else
         case (RegAdd)
            4'b0000  : r <= 16'b0000000000000001;
            4'b0001  : r <= 16'b0000000000000010;
            4'b0010  : r <= 16'b0000000000000100;
            4'b0011  : r <= 16'b0000000000001000;
            4'b0100  : r <= 16'b0000000000010000;
            4'b0101  : r <= 16'b0000000000100000;
            4'b0110  : r <= 16'b0000000001000000;
            4'b0111  : r <= 16'b0000000010000000;
            4'b1000  : r <= 16'b0000000100000000;
            4'b1001  : r <= 16'b0000001000000000;
            4'b1010  : r <= 16'b0000010000000000;
            4'b1011  : r <= 16'b0000100000000000;
            4'b1100  : r <= 16'b0001000000000000;
            4'b1101  : r <= 16'b0010000000000000;
            4'b1110  : r <= 16'b0100000000000000;
            4'b1111  : r <= 16'b1000000000000000;
            default  : r <= 16'b0000000000000000;
         endcase

endmodule

module Reg(
    input  En,
    input  clk,
    input  reset,
    input [7:0] Rin,   
    output reg [7:0] Rout
  ); 
  
  always @(posedge clk or posedge reset) begin
  
    if (reset) begin  
      Rout <= 8'h00;
    end
    
    else if (En == 1'b1) begin
      Rout <= Rin;
    end 
  end
  
endmodule

module MUX16_8bit(
    input [3:0] InsSel,
    input [7:0] in1,
    input [7:0] in2,
    input [7:0] in3,
    input [7:0] in4,
    input [7:0] in5,
    input [7:0] in6,
    input [7:0] in7,
    input [7:0] in8,
    input [7:0] in9,
    input [7:0] in10,
    input [7:0] in11,
    input [7:0] in12,
    input [7:0] in13,
    input [7:0] in14,
    input [7:0] in15,
    input [7:0] in16,
    output reg [7:0] r
  ); 
    
   always @(*)
       case (InsSel)
          4'b0000: r = in1;
          4'b0001: r = in2;
          4'b0010: r = in3;
          4'b0011: r = in4;
          4'b0100: r = in5;
          4'b0101: r = in6;
          4'b0110: r = in7;
          4'b0111: r = in8;
          4'b1000: r = in9;
          4'b1001: r = in10;
          4'b1010: r = in11;
          4'b1011: r = in12;
          4'b1100: r = in13;
          4'b1101: r = in14;
          4'b1110: r = in15;
          4'b1111: r = in16;
       endcase    
    
endmodule
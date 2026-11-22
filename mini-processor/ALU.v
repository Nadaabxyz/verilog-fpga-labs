`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2024 07:24:14 PM
// Design Name: 
// Module Name: ALU
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

// done check exept the error in line 39

//module ALU(
//    input [7:0] ALUinA,
//    input [7:0] ALUinB,
//    input [1:0] InsSel,
//    output [7:0] ALUout,
//    output CO,
//    output Z
//    );
//    wire [7:0] ANDout, XORout, ADDout, CLSout;
//    wire cout;
	
//	AND_8bit AND(ALUinA,ALUinB,ANDout);	
//	XOR_8bit XOR(ALUinA,ALUinB,XORout);   
//	ADD_8bit ADD(ALUinA,ALUinB, ADDout,cout);	
//	CLS_8bit CLS(ALUinA,CLSout);	
//	MUX4_8bit MUX8(InsSel,ANDout,XORout,ADDout,CLSout,ALUout);	
//	MUX4 MUX(InsSel, 1'b0, 1'b0, cout, CLSout[0], CO );	
//	ZC_8bit ZC(ALUout,Z); 

//endmodule 

//module AND_8bit(
//    input [7:0] a,
//    input [7:0] b,
//    output [7:0] r
//    );
  
//    assign r = a & b;     
       
//endmodule
//module XOR_8bit(
//    input [7:0] a,
//    input [7:0] b,
//    output [7:0] r
//    );
  
//    assign r = a ^ b;     
       
//endmodule
//module ADD_8bit(
//    input [7:0] a,
//    input [7:0] b,
//    output [7:0] r,
//    output cout
//    );
  
//assign {cout, r} = a + b;     
//                                        assign cout = 1'b1;    
//endmodule
//module CLS_8bit(
//    input [7:0] a,
//    output [7:0] r
//    );
  
//    assign r[7:1] = a[6:0];     
//    assign r[0]   = a[7]  ;     
       
//endmodule
//module MUX4_8bit(
//    input [1:0] InsSel,
//    input [7:0] a,
//    input [7:0] b,
//    input [7:0] c,
//    input [7:0] d,
//    output [7:0] r
//    );

//        wire [7:0] m;
//        wire [7:0] n; 
        
//        assign m = (InsSel[1]? c : a);    
//        assign n = (InsSel[1]? d : b);    
//        assign r  = (InsSel[0]? n : m);    
         
//endmodule
//module MUX4(
//    input [1:0] InsSel,
//    input a,
//    input b,
//    input c,
//    input d,
//    output r
//    );
    
//    assign r = InsSel[1] ? (InsSel[0] ? d : c) : (InsSel[0] ? b:a);

//endmodule

//module ZC_8bit(
//    input [7:0] a,
//    output Z
//    );
  
//assign Z = ~(a[0]|a[1]|a[2]|a[3]|a[4]|a[5]|a[6]|a[7]);         
//endmodule


module ALU(
    input [1:0] InsSel,
    output CO,
    output Z,
    input [7:0] ALUinA,
    input [7:0] ALUinB,
    output [7:0] ALUout
    );
    
wire [7:0] rAND;
wire [7:0] rXOR;
wire [7:0] rADD;
wire [7:0] rCLS;
wire cout;
wire [7:0] ALUoutWire; 

 
(* dont_touch="true" *) AND_8 AND(ALUinA, ALUinB, rAND);
(* dont_touch="true" *) XOR_8 XOR(ALUinA, ALUinB, rXOR);
(* dont_touch="true" *) ADD_8 ADD(ALUinA, ALUinB, rADD,cout);
(* dont_touch="true" *) CLS_8 CLS(ALUinA, rCLS);


(* dont_touch="true" *) MUX4_8 MUX1 (InsSel, rAND, rXOR, rADD, rCLS , ALUoutWire );
(* dont_touch="true" *) MUX4_1 MUX2 (InsSel, 1'b0, 1'b0, cout, rCLS[0], CO );  

assign ALUout = ALUoutWire;

(* dont_touch="true" *) ZeroComp_8 ZC (ALUoutWire, Z);         
    
    
    
    
endmodule


module AND_8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] r
    );
  
assign r = a & b;     
       
endmodule


module XOR_8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] r
    );
  
assign r = a ^ b;     
       
endmodule


module ADD_8(
    input [7:0] a,
    input [7:0] b,
    output [7:0] r,
    output cout
    );
  
assign {cout, r} = a + b;     
       
endmodule


module CLS_8(
    input [7:0] a,
    output [7:0] r
    );
  
assign r[7:1] = a[6:0];     
assign r[0]   = a[7]  ;     
       
endmodule


module MUX4_8(
    input [1:0] InsSel,
    input [7:0] a,
    input [7:0] b,
    input [7:0] c,
    input [7:0] d,
    output [7:0] r
    );

wire [7:0] t0;
wire [7:0] t1; 

assign t0 = (InsSel[1]? c : a);    
assign t1 = (InsSel[1]? d : b);    
assign r  = (InsSel[0]? t1 : t0);    
         
endmodule


module MUX4_1(
    input [1:0] InsSel,
    input a,
    input b,
    input c,
    input d,
    output r
    );
  
wire t0;
wire t1; 
    
//assign t0 = (InsSel[1]? c : a);    
//assign t1 = (InsSel[1]? d : b);    
//assign r  = (InsSel[0]? t0 : t1);  

assign r = InsSel[1] ? (InsSel[0] ? d : c) : (InsSel[0] ? b:a);
              
endmodule


module ZeroComp_8(
    input [7:0] a,
    output Z
    );
  
assign Z = ~(a[0]|a[1]|a[2]|a[3]|a[4]|a[5]|a[6]|a[7]);     
       
endmodule



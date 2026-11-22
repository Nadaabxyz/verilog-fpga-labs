`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 13:39:40
// Design Name: 
// Module Name: SSI_Library
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

//AND GATE

module AND(
       input I1,I2,
       output O
    );
    
    assign O = I1&I2;
endmodule

//OR GATE

module OR(
       input I1,I2,
       output O
    );
    
    assign O = I1||I2;
endmodule

//NOT GATE
module NOT(
       input I,
       output O
    );
    
    assign O = ~I;
endmodule



//NAND USING ALWAYS
module NAND(
       input I1,
       input I2,
       output reg O
    );

    always @(*)
    begin
        O = !(I1&I2);
    end
        
endmodule


//NOR USING ALWAYS
module NOR(
       input I1, I2,
       output reg O
    );

    always @(*)
    begin
        O = !(I1||I2);
    end
       
endmodule

// XOR using a LUT2 primitive
module XOR(
    output O,
    input I0,
    input I1
    );
    wire[1:0] Lut_in;
    wire Lut_out;

    assign Lut_in = {I0, I1};

    LUT2 #(.INIT(4'h6)) O1 (.O(Lut_out),.I0(Lut_in[0]),.I1(Lut_in[1]));

    assign O = Lut_out;
endmodule



//XNOR using a LUT2 primitive
module XNOR(
    output O,
    input I0,
    input I1
    );
    wire[1:0] Lut_in;
    wire Lut_out;

    assign Lut_in = {I0, I1};

    LUT2 #(.INIT(4'h9)) O2 (.O(Lut_out),.I0(Lut_in[0]),.I1(Lut_in[1]) );

    assign O = Lut_out;
endmodule


// TRI using conditional operator(?)
module TRI (
    input I,E,
    output O
     );

  assign O = E ? (I) : (1);

endmodule

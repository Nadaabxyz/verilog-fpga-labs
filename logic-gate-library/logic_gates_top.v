`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 14:52:04
// Design Name: 
// Module Name: Top_module2
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


module Top_module2(
    input [15:0] IN,
    output [7:0] OUTA
    );
    
    AND GATE_and(.O(OUTA[0]),.I1(IN[0]),.I2(IN[1]));
    OR GATE_or(.O(OUTA[1]),.I1(IN[2]),.I2(IN[3]));
    NOT GATE_not(.O(OUTA[2]),.I(IN[4]));
    NAND GATE_nand(.O(OUTA[3]),.I1(IN[5]),.I2(IN[6]));
    NOR GATE_nor(.O(OUTA[4]),.I1(IN[7]),.I2(IN[8]));
    XOR GATE_xor(.O(OUTA[5]),.I0(IN[9]),.I1(IN[10]));
    XNOR GATE_xnor(.O(OUTA[6]),.I0(IN[11]),.I1(IN[12]));
    TRI GATE_tri(.O(OUTA[7]),.I(IN[13]),.E(IN[14]));

endmodule


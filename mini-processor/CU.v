`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2024 07:24:46 PM
// Design Name: 
// Module Name: CU
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


module CU(
    output reg [1:0] InsSel,
    output reg WE,busy,
    output reg [2:0] InMuxAdd,
    output reg [7:0] CUconst,
    output reg [3:0] OutMuxAdd,RegAdd,
    input start,clk,reset,CO,Z
    );
    
    reg [3:0] state =0;
    
     always @(posedge clk or posedge reset) begin
        if(reset) begin
            state <= 4'd0;
            busy <= 1'b0;
        end
        else if(start) begin
            case (state)
                4'd0: begin // B -> Reg1
                    busy <= 1'b1;
                    WE <= 1'b1;
                    state <= 4'd1;
                    InMuxAdd <= 3'b001;
                    RegAdd <= 4'b0001;
                end
                4'd1: begin // B -> reg2
                    state <= 4'd2;
                    InMuxAdd <= 3'b001;
                    RegAdd <= 4'b0010;
                end
                4'd2: begin // reg1 + reg2
                    state <= 4'd3;
                    InsSel <= 2'b10;
                    //RegAdd <= 4'b0000; // tet to print B - correct
                end
               
               
                4'd3: begin // ALUout -> reg1
                    state <= 4'd4;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0001; //0000 i printe 6 uccess so workkkkss till here
                end
             
                4'd4: begin // ALUout -> reg2
                    state <= 4'd5;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0010; //0010 i printe 9 uccess so workkkkss till here
                end
                4'd5: begin // 8bit 1 -> reg1
                    state <= 4'd6;
                    CUconst <= 8'b11111111;
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0001; //i printe 111111111 uccess so workkkkss till here
                end
                4'd6: begin // reg1 xor reg2
                    state <= 4'd7;
                    InsSel <= 2'b01;
                end
                
                4'd7: begin // ALUout -> reg2
                    state <= 4'd8;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0010;
                end
                4'd8: begin // 00000001 ->reg1
                    state <= 4'd9;
                    CUconst <= 8'b00000001;
                    InMuxAdd <= 3'b010;
                    RegAdd <= 4'b0001;
                end
                4'd9: begin // reg1 + reg2
                    state <= 4'd10;
                    InsSel <= 2'b10;
                end
                4'd10: begin //ALUout -> reg2
                    state <= 4'd11;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0010;
                end
                4'd11: begin // A -> reg1
                    state <= 4'd12;
                    InMuxAdd <= 3'b000;
                    RegAdd <= 4'b0001;
                end
                4'd12: begin // reg1 + reg2
                    state <= 4'd13;
                    InsSel <= 2'b10;
                    
                end
                4'd13: begin // ALUout -> reg0
//                    state <= 4'd14;
                    InMuxAdd <= 3'b011;
                    RegAdd <= 4'b0000;
                    busy <= 1'b0; //workkkeddddddd
                end
                default: begin
                    state <= 4'b0000;
                end
            endcase
        end
    end 
    
endmodule

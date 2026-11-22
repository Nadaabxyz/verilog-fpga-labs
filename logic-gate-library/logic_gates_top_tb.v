`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 14:50:59
// Design Name: 
// Module Name: Top_module2_tb
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


module Top_module2_tb;

reg [15:0] inp;
wire [7:0] out;

Top_module2 uut (.OUTA(out),.IN(inp));


initial 
begin 
inp=16'h00;
inp[0]=0; inp[1] = 0;
inp[2]=0; inp[3] = 0;
inp[4]=0;
inp[5]=0; inp[6] = 0;
inp[7]=0; inp[8] = 0;
inp[9]=0; inp[10] = 0;
inp[11]=0; inp[12] = 0;
inp[13]=0; inp[14] = 0;

#10 
inp[0]=0; inp[1] = 1;
inp[2]=0; inp[3] = 1;
inp[4]=1;
inp[5]=0; inp[6] = 1;
inp[7]=0; inp[8] = 1;
inp[9]=0; inp[10] = 1;
inp[11]=0; inp[12] = 1;
inp[13]=0; inp[14] = 1;

#10 
inp[0]=1; inp[1] = 0;
inp[2]=1; inp[3] = 0;
inp[5]=1; inp[6] = 0;
inp[7]=1; inp[8] = 0;
inp[9]=1; inp[10] = 0;
inp[11]=1; inp[12] = 0;
inp[13]=1; inp[14] = 0;


#10 
inp[0]=1; inp[1] = 1;
inp[2]=1; inp[3] = 1;
inp[5]=1; inp[6] = 1;
inp[7]=1; inp[8] = 1;
inp[9]=1; inp[10] = 1;
inp[11]=1; inp[12] = 1;
inp[13]=1; inp[14] = 1;

#10 
$finish;

end 
 
endmodule
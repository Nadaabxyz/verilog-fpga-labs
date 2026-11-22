`timescale 1ns / 1ps

module FSM1_tb(
    );
    reg x,clk;
    wire z; 

    always #10 clk = !clk;
    reg [41:0] testsig=42'b010011000111000011110000011111000000111111;
    FSM1 uut(x,clk,z);
//    FSM2 uut (x,clk,z);
    integer i;
  
     initial begin
       x = 0;
       clk = 0;
       i=0;
       end
       
    always @(posedge clk) begin  
    x=testsig[41-i];
    i=i+1;
   if(i==42) 

   $finish; 
//   begin 
   
//    end   
//           $display("Time=%0t x=%b q0=%b q1=%b q2=%b Q0=%b  Q1=%b Q2=%b z=%b", $time, x, uut.q0, uut.q1, uut.q2,uut.Q0,uut.Q1,uut.Q2, z);
    end
  
endmodule



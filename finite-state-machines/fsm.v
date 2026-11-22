`timescale 1ns / 1ps
module FSM1(
    input x,clk,
    output reg z
    );
    
    reg q0,q1,q2;
    wire Q0,Q1,Q2;
    reg d_ff;

     
   initial begin 
    q0=0;
    q1=0;
    q2=0;
    end
   
    assign Q0 = (q0&x)| (q1 & q2 &x) ;
    assign Q1 = (q1& (~q2))| ((~q0)&(~q1)& x)|  ((~q0)&(~q1)& q2);
    assign Q2 = x & ((~q1)| (~q2 ))|  ((~q0) & (~q1) &( ~q2));
    assign d_ff <= (q0 & q2 & x) + (q1 & (~q2) & (~x));
   
    always @(posedge clk)begin 
    q2<=Q2;
    q1<=Q1;
    q0<=Q0;
    z <= d_ff;
    end
   //    z= (q0&q2&x)+(q1&(~q2)&(~x)) ;        

endmodule

module FSM2(
input x,clk,
output  reg z
);

    wire [2:0]Q;
    reg [2:0] q;
    wire a,Z;

    initial begin 
    q=3'b010; 
    end


//For right sided FSM
assign a=x ^ q[0];
assign Q[0]=!x;

//For left sided FSM
assign Q[2] = (q[1] & a) | (a & q[2]);
assign Q[1] = a & (!q[1]) & (!q[2]);
assign Z= a & q[2];

    always @(posedge clk)begin 
    q[2]=Q[2];
    q[1]=Q[1];
    q[0]=Q[0];
    z=Z;
    end
endmodule


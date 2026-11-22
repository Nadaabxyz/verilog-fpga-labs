`timescale 1ns / 1ps
module HA(
input x,y,
output cout, s
    );
  (* dont_touch="true" *)assign s = x ^ y; // used xor
  (* dont_touch="true" *) assign cout = x & y; // used and
endmodule

module FA(
    input x, y, ci, 
    output s, cout
    );
   (* dont_touch="true" *) wire m, n, p; 

    HA ha1(.x(x), .y(y), .s(m), .cout(n));
    HA ha2(.x(m), .y(ci), .s(s), .cout(p));
    assign cout = n || p;
endmodule



module RCA(
  input [3:0] x,
  input [3:0] y,
  input ci,
  output cout,
  output [3:0] s
);

  (* dont_touch="true" *) wire [2:0] m;

   FA fa0 (.x(x[0]), .y(y[0]), .ci(ci), .s(s[0]), .cout(m[0]));
   FA fa1 (.x(x[1]), .y(y[1]), .ci(m[0]), .s(s[1]), .cout(m[1]));
   FA fa2 (.x(x[2]), .y(y[2]), .ci(m[1]), .s(s[2]), .cout(m[2]));
   FA fa3 (.x(x[3]), .y(y[3]), .ci(m[2]), .s(s[3]), .cout(cout));


endmodule



module parametric_RCA #(parameter SIZE=8)(
  input [SIZE-1:0] x,
  input [SIZE-1:0] y,
  input ci,
  output cout,
  output [SIZE-1:0] s
);

  (* dont_touch="true" *) wire [SIZE:0] m;

  genvar i;
  generate
    for (i = 0; i < SIZE; i = i + 1) begin : gen_fa

        FA fa (
          .x(x[i]),
          .y(y[i]),
          .ci(m[i]),
          .s(s[i]),
          .cout(m[i+1])
        );
    end
  endgenerate

  assign m[0] = ci;
  assign cout = m[SIZE];

endmodule


module CLA (
  input [3:0] x,
  input [3:0] y,
  input c0,
  output cout,
  output [3:0] sum
);
  (* dont_touch = "true" *) wire [4:0] g, p, c;

  assign g = x & y;
  assign p = x ^ y;
  

  
    assign c[0] = c0;
    assign c[1] = g[0] || (p[0] & c[0]);
    assign c[2] = g[1] || (p[1] & (g[0] || (p[0] & c[0])));
    assign c[3] = g[2] || (p[2] & (g[1] || (p[1] & (g[0] || (p[0] & c[0])))));
    assign c[4] = g[3] || (p[3] & (g[2] || (p[2] & (g[1] || (p[1] & (g[0] || (p[0] & c[0])))))));
    assign sum = x ^ y ^ c;
    assign cout = c[4];

endmodule



module Add_Sub(
  input [3:0] A, B,
  input ci,
  output [3:0] SUM,
  output cout,
  output V
);

(* dont_touch="true" *) wire m,n,l,p;
     assign m=ci^ B[0];
     assign n=ci^ B[1];
     assign l=ci^ B[2];
     assign p=ci^ B[3];

 (* dont_touch="true" *)  wire  c1, c2, c3;

   FA fa1xx(.x(A[0]), .y(m), .ci(ci), .s(SUM[0]), .cout(c1));
   FA fa2xx(.x(A[1]), .y(n), .ci(c1), .s(SUM[1]), .cout(c2));
   FA fa3xx(.x(A[2]), .y(l), .ci(c2), .s(SUM[2]), .cout(c3));
   FA fa4xx(.x(A[3]), .y(p), .ci(c3), .s(SUM[3]), .cout(cout));

  assign V = c3 ^ cout;



endmodule

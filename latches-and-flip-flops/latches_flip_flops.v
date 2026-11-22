`timescale 1ns / 1ps

module SRLatch(
    input S, R,
    output Q, Qn
);
  (*dont_touch="true"*) wire m,n;
    NAND nand1 (.I1(S),.I2(Qn),.O(m));
    NAND nand2 (.I1(Q),.I2(R),.O(n));

    assign m = Q;
    assign n = Qn;

endmodule

// D latch
module DFlipFlop(
    input CLK, D,
    output  Q, Qn
);
    (*dont_touch="true"*) wire nand1_out, nand2_out,m,Qout,Qnout;

    NOT inv1 (.I(D), .O(m));
    NAND nand1x (.I1(D), .I2(CLK), .O(nand1_out));
    NAND nand2x (.I1(CLK), .I2(m), .O(nand2_out));

    NAND nand3x (.I1(nand1_out), .I2(Qn), .O(Qout));
    NAND nand4x (.I1(Q), .I2(nand2_out), .O(Qnout));
        assign Q= Qout;
        assign Qn= Qnout;

endmodule



module D_Master_slave(
    input CLK, D,
    output  Q, Qn
);

(*dont_touch="true"*) wire f,Qm,Qmnot;

assign f=~CLK;

  DFlipFlop Master (.CLK(CLK), .D(D), .Q(Qm),.Qn(Qmnot));
  DFlipFlop Slave (.CLK(f), .D(Qm), .Q(Q),.Qn(Qn));


endmodule

module DFF_behavioral(
  input  D,
  input  clk,
  output  Q,
  output  Qn
);

  reg FF;
  always @(posedge clk) begin
    FF <= D;
  end
 
  assign Q = FF;
  assign Qn = ~FF;

endmodule



module Bit_REG (
  input [7:0] IN,
  input CLK,
  input CLEAR,
  output [7:0] OUT
);

  reg [7:0] reg_OUT;

  always @(posedge CLK or posedge CLEAR) begin
    if (CLEAR) begin
      reg_OUT <= 8'b00000000;
    end
    else begin
      reg_OUT <= IN;
    end
  end

  assign OUT = reg_OUT;

endmodule

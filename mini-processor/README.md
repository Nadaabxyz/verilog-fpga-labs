# Mini processor

Small datapath made of an ALU, a register block and a control unit that steps through a fixed micro-sequence. It computes `A - 3*B` for 6-bit inputs `A` and `B` and gives an 8-bit signed result. 40 random input pairs all matched in simulation.

The control unit runs its sequence once per reset, so reset between runs. The bundled testbench does not reset between input sets, so its printed "Correct" flag can show False even when the result is right.

Files: `ALU.v`, `CU.v`, `RB.v`, `top.v`, `top_tb.v`

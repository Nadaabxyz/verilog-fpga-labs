# Verilog FPGA Labs: Digital System Design (Istanbul Technical University)

Verilog designs and testbenches from my Digital System Design Applications lab course (EHB436E) at Istanbul Technical University. The lab ran in **Xilinx Vivado** on the **Digilent Nexys A7** board (Artix-7). Each folder holds the design sources and its testbench. Pin constraints were provided with the lab and are not included.

## Contents

| Folder | What it is |
|---|---|
| `exp1-gates-seven-segment` | Gate-level library (AND, OR, NOT, NAND, NOR, XOR, XNOR, tri-state) plus a top module and testbench |
| `exp4-arithmetic-circuits` | Half adder, full adder, ripple-carry adder, parametric RCA, carry-lookahead adder, adder/subtractor |
| `exp5-latches-flipflops-register` | SR latch, D latch, master-slave D flip-flop, behavioral D flip-flop, register built from them |
| `exp6-fsm` | Two small finite-state machines with a testbench |
| `exp7-multipliers-mac` | 16-bit CLA, structural unsigned and signed multipliers, and a multiply-accumulate (MAC) unit |
| `midterm1-dadda-multiplier` | 16x16 Dadda-tree multiplier built from half/full adders and 8x8 Dadda blocks |
| `midterm2-fsm-project` | FSM with a testbench |
| `final-mini-processor` | Small datapath: ALU, register block, control unit stepping through a fixed micro-sequence |

## Verified results

I re-ran two designs in Icarus Verilog with my own random-input checks:

- **Dadda multiplier (`midterm1-dadda-multiplier`)**: 20,001 test cases (20,000 random plus 16'hFFFF x 16'hFFFF) matched `A * B` with 0 mismatches.
- - **Mini processor (`final-mini-processor`)**: computes `A - 3*B` for 6-bit inputs `A` and `B` and gives an 8-bit signed result. 40 random input pairs all matched.
  -   - The control unit runs its sequence once per reset, so reset between runs. The bundled testbench does not reset between input sets and compares against a wider expression, so its printed "Correct" flag can show False even when the result is right.
   
      - The other folders were simulated in Vivado during the course. I did not re-verify them here. Several use Vivado-specific constructs (e.g. `(* dont_touch *)` attributes and the `LUT2` primitive), so open them in Vivado rather than a generic simulator.
   
      - ## Notes
   
      - - `exp5` and `exp7` include copies of `SSI_Library.v` and `arithmetic_circuits.v`, which they depend on.
        - - `midterm1-dadda-multiplier/Dadda_Tree_tb.v` reads a stimulus file from an absolute Windows path; change the path to run it on your machine.
          - - Experiment 8 (image processing) is not included because I don't have complete working results for it.
            - 

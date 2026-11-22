# Verilog FPGA Designs

Verilog designs and testbenches for digital building blocks, from basic gates up to a Dadda-tree multiplier and a small processor datapath. Written in **Xilinx Vivado** for the **Digilent Nexys A7** board (Artix-7) during my Digital System Design lab course at Istanbul Technical University.

## Contents

| Folder | What it is |
|---|---|
| `logic-gate-library` | Gate-level library (AND, OR, NOT, NAND, NOR, XOR, XNOR, tri-state) plus a top module and testbench |
| `adders-and-arithmetic-circuits` | Half adder, full adder, ripple-carry adder, parametric RCA, carry-lookahead adder, adder/subtractor |
| `latches-and-flip-flops` | SR latch, D latch, master-slave D flip-flop, behavioral D flip-flop, register built from them |
| `finite-state-machines` | Two small finite-state machines with a testbench |
| `multipliers-and-mac-unit` | 16-bit CLA, structural unsigned and signed multipliers, and a multiply-accumulate (MAC) unit |
| `dadda-multiplier-16bit` | 16x16 Dadda-tree multiplier built from half/full adders and 8x8 Dadda blocks |
| `serial-input-fsm` | FSM that reads a serial input bit stream and drives an output, with a testbench |
| `mini-processor` | Small datapath: ALU, register block, control unit stepping through a fixed micro-sequence |

## Verified results

I re-ran two designs in Icarus Verilog with random-input checks.

**Dadda multiplier (`dadda-multiplier-16bit`):** 20,001 test cases (20,000 random plus 16'hFFFF x 16'hFFFF) matched `A * B` with 0 mismatches.

**Mini processor (`mini-processor`):** computes `A - 3*B` for 6-bit inputs `A` and `B` and gives an 8-bit signed result. 40 random input pairs all matched. The control unit runs its sequence once per reset, so reset between runs. The bundled testbench does not reset between input sets and compares against a wider expression, so its printed "Correct" flag can show False even when the result is right.

The other designs were simulated in Vivado. I did not re-verify them in another simulator. Several use Vivado-specific constructs (e.g. `(* dont_touch *)` attributes and the `LUT2` primitive), so open them in Vivado.

## Notes

`latches-and-flip-flops` and `multipliers-and-mac-unit` include copies of `logic-gate-library/SSI_Library.v` and `adders-and-arithmetic-circuits/arithmetic_circuits.v`, which they depend on.

`dadda-multiplier-16bit/dadda_multiplier_tb.v` reads a stimulus file from an absolute Windows path; change the path to run it on your machine.

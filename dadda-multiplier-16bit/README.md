# 16-bit Dadda multiplier

16x16 Dadda-tree multiplier built from half and full adders and 8x8 Dadda blocks, with a testbench. Checked against `A * B` on 20,001 test cases (random inputs plus 16'hFFFF x 16'hFFFF) with 0 mismatches.

The testbench reads a stimulus file from an absolute Windows path, so change the path to run it on your machine.

Files: `dadda_multiplier.v`, `dadda_multiplier_tb.v`

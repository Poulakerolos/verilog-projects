# Single-Cycle RV32I Processor

## What it is

A single-cycle RISC-V implementation composed of a program counter, instruction memory, register file, decoders, ALU, branch resolution, data memory, top level, and testbench.

## Why it matters

It integrates datapath and control logic into a complete processor rather than an isolated RTL block.

## How it's built

`TopRiscV.v` connects the datapath and control modules; `TbRiscvTop.v` and `run.do` support simulation. `program.hex` provides the loaded program image.

## How to run

Open the directory in ModelSim/Questa and run `run.do`.

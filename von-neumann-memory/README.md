# Von Neumann Shared Memory

## What it is

A single memory array divided into instruction and data regions through an address offset.

## Why it matters

It contrasts a shared-memory organization with the separate-port structure used in Harvard-style memory exercises.

## How it's built

`von_neumann_mem.v` was transcribed from the supplied assignment PDF. It supports synchronous writes, asynchronous reads, and asynchronous active-low reset; instruction addresses map to the first half of memory and data addresses to the second.

## How to run

Compile the module in a Verilog simulator and provide instruction/data address and write stimuli.

# LIFO Stack

## What it is

A parameterized LIFO stack with asynchronous active-low reset, push/pop control, full/empty flags, asynchronous top-of-stack read, and pointer visibility.

## Why it matters

It covers a common stateful storage structure and its boundary behavior: overflow, underflow, reset, and simultaneous push/pop.

## How it's built

`stack.v` and `stack_tb.v` were transcribed from the supplied assignment PDF. The self-checking testbench exercises reset, fill, overflow, ordered popping, empty state, and underflow.

## How to run

Compile both files in ModelSim/Questa and simulate `stack_tb`.

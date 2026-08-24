# Verilog Projects

Digital-design coursework from the IEEE Cairo University Digital Design Workshop, verified in ModelSim/Questa with directed testbenches and, where retained, waveform evidence.

## Flagship

- [`riscv-singlecycle/`](riscv-singlecycle/) - RV32I single-cycle processor with program counter, instruction/data memories, register file, decoders, ALU, branch logic, testbench, and simulation script.

## Modules

- [`alu/`](alu/) - 4-bit ALU with testbench.
- [`clock-divider/`](clock-divider/) - parameterized divider, testbench, ModelSim script, and captured VCD waveform.
- [`memory-dual-port-ram/`](memory-dual-port-ram/) - dual-port RAM module and testbench.
- [`von-neumann-memory/`](von-neumann-memory/) - shared-memory instruction/data regions.
- [`lifo-stack/`](lifo-stack/) - parameterized stack with push, pop, full and empty handling.
- [`shift-register-64bit/`](shift-register-64bit/) - arithmetic shift register with screenshots.
- [`fsm-sequence-detectors/`](fsm-sequence-detectors/) - Mealy/Moore and overlapping/non-overlapping sequence detectors with screenshots.
- [`comparator/`](comparator/) - comparator module.
- [`fundamentals/`](fundamentals/) - grouped introductory FPGA exercises: adders, counter, mux, comparator, and seven-segment decoder.

## How to run

Compile the target module and its testbench in ModelSim/Questa. Directories that contain `run.do` include the associated simulation script.

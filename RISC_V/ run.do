# run.do -- ModelSim/Questasim automation script

quit -sim
vlib work
vmap work work

# Compile all Verilog files
vlog program_counter.v
vlog InstrMem.v
vlog Register_file.v
vlog SignExtend.v
vlog MUX21.v
vlog ALU.v
vlog DataMemory.v
vlog MainDecoder.v
vlog AluDecoder.v
vlog BranchResolution.v
vlog HaltDetection.v
vlog TopRiscV.v
vlog tb_riscv_top.v

# Start simulation
vsim -voptargs=+acc work.tb_riscv_top

# Add waves
add wave -divider "Clock / Reset"
add wave -radix binary  /tb_riscv_top/clk
add wave -radix binary  /tb_riscv_top/reset

add wave -divider "Register File"
add wave -radix unsigned -label File0 /tb_riscv_top/dut/u_rf/File[0]
add wave -radix unsigned -label File1 /tb_riscv_top/dut/u_rf/File[1]
add wave -radix unsigned -label File2 /tb_riscv_top/dut/u_rf/File[2]
add wave -radix unsigned -label File3 /tb_riscv_top/dut/u_rf/File[3]
add wave -radix unsigned -label File4 /tb_riscv_top/dut/u_rf/File[4]
add wave -radix unsigned -label File5 /tb_riscv_top/dut/u_rf/File[5]
add wave -radix unsigned -label File6 /tb_riscv_top/dut/u_rf/File[6]
add wave -radix unsigned -label File7 /tb_riscv_top/dut/u_rf/File[7]

add wave -divider "Data Memory"
add wave -radix unsigned -label mem0 /tb_riscv_top/dut/u_dmem/mem[0]
add wave -radix unsigned -label mem1 /tb_riscv_top/dut/u_dmem/mem[1]
add wave -radix unsigned -label mem2 /tb_riscv_top/dut/u_dmem/mem[2]
add wave -radix unsigned -label mem3 /tb_riscv_top/dut/u_dmem/mem[3]
add wave -radix unsigned -label mem4 /tb_riscv_top/dut/u_dmem/mem[4]
add wave -radix unsigned -label mem5 /tb_riscv_top/dut/u_dmem/mem[5]
add wave -radix unsigned -label mem6 /tb_riscv_top/dut/u_dmem/mem[6]
add wave -radix unsigned -label mem7 /tb_riscv_top/dut/u_dmem/mem[7]
add wave -radix unsigned -label mem8 /tb_riscv_top/dut/u_dmem/mem[8]
add wave -radix unsigned -label mem9 /tb_riscv_top/dut/u_dmem/mem[9]

# Run and fit screen
run 2000ns
wave zoom full

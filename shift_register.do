if [file exists work] {
    vdel -all
}
vlib work
vmap work work

vlog arethmatic_shift_regester.v
vlog arethmatic_shiftTB.v

vsim -voptargs=+acc work.arethmaticTB

add wave -r /*

run -all

wave zoom full
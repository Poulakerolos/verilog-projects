vlib work
vmap work work
 
vlog -sv clock_divider.v tb_clock_divider.v
 
vsim -voptargs="+acc" work.tb_clock_divider
 
add wave -radix decimal /tb_clock_divider/test_case
add wave -radix binary  /tb_clock_divider/rst_n
add wave -radix binary  /tb_clock_divider/clk_en
add wave -radix binary  /tb_clock_divider/clk_in
add wave -radix decimal /tb_clock_divider/divisor
add wave -radix binary  /tb_clock_divider/clk_out
add wave -radix decimal /tb_clock_divider/DUT/count
 
configure wave -namecolwidth 180
configure wave -valuecolwidth 100
configure wave -timelineunits ns
 
run 1000 ns
 
wave zoom full
 
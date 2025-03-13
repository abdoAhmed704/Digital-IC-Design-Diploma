vlib work
vlog monitor_bits.v monitor_tb.v
vsim -voptargs=+acc work.monitor_111_tb
add wave *
run -all
#quit -sim
vlib work
vlog memory_design.v test_memory.v
vsim -voptargs=+acc work.RAM_SINGLE_PORT_tb
add wave *
run -all
#quit -sim
vlib work
vlog ram_tb.v fifo_ram.v
vsim -voptargs=+acc work.FIFO_RAM_tb
add wave *
run -all
#quit -sim
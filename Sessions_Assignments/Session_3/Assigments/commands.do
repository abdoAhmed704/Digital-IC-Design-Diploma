vlib work
vlog Task_1.v tb_1.v
vsim -voptargs=+acc work.latch_tb #close the optimization
add wave 
run -all
#quit -sim
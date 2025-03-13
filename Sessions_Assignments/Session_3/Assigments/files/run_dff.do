vlib work
vlog Task_2.v tb_dsp.v
vsim -voptargs=+acc work.tb_dsp
add wave *
run -all
#quit -sim
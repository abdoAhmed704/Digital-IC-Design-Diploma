vlib work
vlog Assigments.Task_2_b.v
vsim -voptargs=+acc work.Task_2_b #close the optimization
add wave *
run -all
#quit -sim
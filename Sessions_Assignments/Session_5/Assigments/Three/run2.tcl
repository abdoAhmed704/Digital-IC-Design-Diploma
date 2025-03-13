create_project project_Using_commands_counter "C:/Users/ABDOU/Desktop/Digital World/Digital Ic Diploma/design/section 5/Assigments/THREE" -part xc7a35ticpg236-1L -force

## Add source files & XDC files
add_files monitor_bits.v Constraints_monitor.xdc

## Elaborate Design (Will open the schematic)
synth_design -rtl -top monitor_111 > elab.log

## Save Schematic
write_schematic elaborated_schematic.pdf -format pdf -force 

## Synthesize Design
launch_runs synth_1 > synth.log

## open gui (Schematic)
wait_on_run synth_1
open_run synth_1

## Save Schematic
write_schematic synthesized_schematic.pdf -format pdf -force 

## Generate netlist
write_verilog -force netlist_here.v

## Implementation
launch_runs impl_1 -to_step write_bitstream 

## open gui (Schematic & Device view)
wait_on_run impl_1
open_run impl_1

if {[file exists work]} {
    
    vdel -lib work -all

}

vlib work
vmap work work

transcript file transcript.log
transcript on

vlog -sv +acc logic_gates_b.sv
vlog -sv +acc logic_gates_b_tb.sv

vsim -voptargs=+acc -wlf sim.wlf work.tb

log -r /*

add wave -r sim:/tb/dut/*

vcd file dump.vcd
vcd add -r sim:/tb/dut/*
vcd on

run -all

transcript off

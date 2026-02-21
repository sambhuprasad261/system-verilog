if {[file exists work]} {

    vdel -lib work -all    
    
}

vlib work
vmap work work 

transcript file transcript.log
transcript on

vlog -sv adder_des.sv
vlog -sv adder_tb.sv

vsim -voptargs=+acc -wlf sim.wlf work.tb

log -r /*

add wave -r /tb/dut/*

vcd file dump.vcd
vcd add -r /tb/dut/*
vcd on

run -all

transcript off

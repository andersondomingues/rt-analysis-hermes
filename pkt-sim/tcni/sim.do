if {[file isdirectory work]} { vdel -all -lib work }

vlib work
vmap work work

vcom -mixedsvvh -work work -93 -explicit ../hermes/Hermes_package.vhd
vcom -mixedsvvh -work work -93 -explicit ../hermes/Hermes_buffer.vhd
vcom -mixedsvvh -work work -93 -explicit ../hermes/Hermes_switchcontrol.vhd
vcom -mixedsvvh -work work -93 -explicit ../hermes/Hermes_crossbar.vhd
vcom -mixedsvvh -work work -93 -explicit ../hermes/RouterCC.vhd
vcom -mixedsvvh -work work -93 -explicit ../hermes/TopNOC.vhd

vlog -mixedsvvh -sv -work work sv/defs.sv
vlog -mixedsvvh -sv -work work sv/interface_memory.sv
vlog -mixedsvvh -sv -work work sv/interface_tcni.sv
vlog -mixedsvvh -sv -work work sv/interface_router.sv
vlog -mixedsvvh -sv -work work sv/interface_cpu.sv
vlog -mixedsvvh -sv -work work sv/ddma.sv

vlog -mixedsvvh -sv -work work sv/tb.sv

vsim -voptargs=+acc=lprn -t ps work.tb

#set StdArithNoWarnings 1
#set StdVitalGlitchNoWarnings 1

do wave.do
run 100 ns



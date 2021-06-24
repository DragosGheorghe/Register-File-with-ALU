transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/qfiles/tema4 {D:/qfiles/tema4/regFileWithAlu.v}
vlog -vlog01compat -work work +incdir+D:/qfiles/tema4 {D:/qfiles/tema4/alu.v}
vlog -vlog01compat -work work +incdir+D:/qfiles/tema4 {D:/qfiles/tema4/mux2_32.v}
vlog -vlog01compat -work work +incdir+D:/qfiles/tema4 {D:/qfiles/tema4/regfile.v}

vlog -vlog01compat -work work +incdir+D:/qfiles/tema4 {D:/qfiles/tema4/tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb

add wave *
view structure
view signals
run -all
